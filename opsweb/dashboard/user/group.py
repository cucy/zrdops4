#coding:utf8
from django.views.generic import TemplateView, View, ListView
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.models import Group,User, Permission
from django.http import JsonResponse, HttpResponse
from django.core import serializers 

import logging
logger = logging.getLogger('opsweb')


class GroupListView(ListView):
    model = Group
    template_name = 'user/grouplist.html'
    def post(self, request):
        ret = {'status':0}
        name =  request.POST.get('name', '')
        if name:
            try:
                group = Group()
                group.name = name
                group.save()
            except Exception as e:
                ret['status'] = 1
                ret['ermsg'] = e.args
                
        return JsonResponse(ret, safe=True)


# 获取用户组信息
class GroupView(View):
    def get(self, request):
        uid = request.GET.get('uid','')
        ret = {'status':0}
        try:
            user = User.objects.get(pk=uid)
        except User.DoesNotExist as e:
            ret['status'] = 1
            ret['errmsg'] = '用户不存在{}'.format(e.args)
        all_groups = Group.objects.all()
        groups = [group for group in all_groups if group not in user.groups.all() ]
        return HttpResponse(serializers.serialize("json", groups), content_type="application/json")


#  将用户添加到指定组
class UserGroupView(View):
    def get(self, request):
        uid = request.GET.get('uid')
        ret = {"status": 0}
        try:
            user = User.objects.get(pk=uid)
        except User.DoesNotExist as e:
            ret['status'] = 1
            ret['errmsg'] = "用户不存在{}".format(e.args)

        all_groups = Group.objects.all()
        user_groups = user.groups.all()
        groups = [group for group in all_groups if group not in user_groups]
        return HttpResponse(serializers.serialize("json", groups), content_type="application/json")

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
