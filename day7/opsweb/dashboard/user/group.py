# coding:utf8
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required, permission_required
from django.views.generic import TemplateView, View, ListView
from django.contrib.auth.models import Group, User, Permission, ContentType
from django.http import JsonResponse,HttpResponse, QueryDict, Http404
from django.core import serializers
from django.forms.models import model_to_dict
from django.shortcuts import render
from django.conf import settings

import logging
logger = logging.getLogger('opsweb')

class GroupListView(ListView):
    model = Group
    template_name = "user/grouplist.html"

    @method_decorator(login_required)
    @method_decorator(permission_required("auth.view_group_list", login_url=settings.PERMISSION_NONE_URL))
    def get(self, request, *args, **kwargs):
        return super(GroupListView, self).get(request, *args, **kwargs)


    def post(self, request):
        ret = {"status": 0}
        if not request.user.has_perm('auth.add_group'):
            ret["status"] = 1
            ret['errmsg'] = "没有权限"
            return JsonResponse(ret, safe=True)

        name = request.POST.get("name", "")
        if name:
            try:
                group = Group()
                group.name = name
                group.save()
            except Exception as e:
                ret['status'] = 1
                ret['errmsg'] = e.args
        return JsonResponse(ret, safe=True)


class GroupView(View):
    """
    获取用户组信息
    """
    def get(self, request):

        uid = request.GET.get('uid')
        ret = {"status": 0}
        try:
            user = User.objects.get(pk=uid)
        except User.DoesNotExist:
            ret['status'] = 1
            ret['errmsg'] = "用户不存在"


        all_groups = Group.objects.all()
        user_groups = user.groups.all()
        groups = [group for group in all_groups if group not in user_groups]
        return HttpResponse(serializers.serialize("json", groups), content_type="application/json")

class UserGroupView(View):

    """
        取出指定用户组下的所有用户信息
    """
    def get(self, request):
        gid = request.GET.get('gid', None)
        try:
            group = Group.objects.get(pk=gid)
        except:
            return JsonResponse([], safe=False)
        users = group.user_set.all()

        user_list = [{"username": user.username, "email": user.email, "name": user.profile.name, "id": user.id} for user in users]
        return JsonResponse(user_list, safe=False)

    """
        将用户添加到指定组
    """
    def post(self,request):
        ret = {"status": 0}
        uid = request.POST.get('uid', None)
        gid = request.POST.get('gid', None)

        try:
            user = User.objects.get(pk=uid)
        except User.DoesNotExist:

            logger.error("将用户添加至指定用户组，用户不存在，用户id为：{}".format(uid))
            ret['status'] = 1
            ret['errmsg'] = "用户不存在"
            return JsonResponse(ret, safe=True)

        try:
            group = Group.objects.get(pk=gid)
        except Group.DoesNotExist:

            logger.error("将用户添加至指定用户组，用户组不存在，用户组id为：{}".format(uid))
            ret['status'] = 1
            ret['errmsg'] = "用户组不存在"
            return JsonResponse(ret, safe=True)

        user.groups.add(group)
        return JsonResponse(ret, safe=True)

    """
        将用户从用户组中删除
    """
    def delete(self, request):
        ret = {"status":0}
        data = QueryDict(request.body)
        uid = data.get('userid', None)
        gid = data.get('groupid', None)
        try:
            user = User.objects.get(pk=uid)
            group = Group.objects.get(pk=gid)
            group.user_set.remove(user)
        except User.DoesNotExist:
            ret['status'] = 1
            ret['errmsg'] = "用户不存在"
        except Group.DoesNotExist:
            ret['status'] = 1
            ret['errmsg'] = "用户组不存在"
        except Exception as e:
            ret['status'] = 1
            ret['errmsg'] = e.args
        return JsonResponse(ret, safe=True)

class GroupPermissionListView(TemplateView):
    template_name = "user/group_permission_list.html"

    def get_context_data(self, **kwargs):
        context = super(GroupPermissionListView, self).get_context_data(**kwargs)
        context['group'] = self.request.GET.get('gid', None)
        context['group_permissions'] = self.get_group_permission()
        context['content_type'] = ContentType.objects.all()
        return context

    def get_group_permission(self):
        gid = self.request.GET.get('gid',None)
        try:
            group = Group.objects.get(pk=gid)
            return [per.id for per in group.permissions.all()]
        except Group.DoesNotExist:
            raise Http404



    def post(self, request):
        permission_id_list = request.POST.getlist('permission', [])
        groupid = request.POST.get('group', None)
        ret =  {"status": 0, "next_url": "/group/list/"}
        try:
            group = Group.objects.get(pk=groupid)
        except Group.DoesNotExist:
            ret['status'] = 1
            ret['errmsg'] = "用户组不存在"
        else:
            if permission_id_list:
                permission_objs = Permission.objects.filter(id__in=permission_id_list)
                group.permissions = permission_objs
        return render(request, settings.TEMPLATE_JUMP,ret)


class GroupPermissionView(TemplateView):
    template_name = "user/group_permissions.html"

    def get_context_data(self, **kwargs):
        context_data = super(GroupPermissionView, self).get_context_data(**kwargs)
        gid = self.request.GET.get('gid', 0)
        try:
            group = Group.objects.get(pk=gid)
            context_data['permissions'] = group.permissions.all()
        except Group.DoesNotExist:
            raise Http404
        return context_data
