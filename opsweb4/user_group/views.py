import json

from django.contrib.auth import authenticate, login
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.views import LogoutView, LoginView
from django.contrib.auth.models import User
from django.views import View

from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_protect


# 登录视图
class UserLoginView(LoginView):
    template_name = "user/login.html"
    redirect_field_name = reverse_lazy("index")

    def get_context_data(self, **kwargs):
        next = kwargs.get("next")
        if next:
            kwargs.update({"next": next})
        return super(UserLoginView, self).get_context_data(**kwargs)


# 登录视图
@csrf_protect
def login_view(request):
    if request.method == 'POST':
        ret = {"status": 0, "errmsg": ""}
        username = request.POST.get("username", "")
        password = request.POST.get("password", "")
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                next_url = request.GET.get("next") if request.GET.get("next", None) else "/"
                ret['next_url'] = next_url
                return HttpResponse(json.dumps(ret), content_type="application/json")
            else:
                ret["status"] = 1
                ret["errmsg"] = "用户被禁用"
                return HttpResponse(json.dumps(ret), content_type="application/json")

        else:
            ret["status"] = 1
            ret["errmsg"] = "用户名或密码错误"
            return HttpResponse(json.dumps(ret), content_type="application/json")
    else:
        return render(request, 'user/login.html')


# 登出
class UserLogoutView(LogoutView):
    next_page = reverse_lazy('opsuser:login')


# 用户列表
class UserListView(LoginRequiredMixin, View):
    template_name = 'user/user_list.html'

    def get(self, request):
        user_list = User.objects.all()
        return render(request, self.template_name, {
            'user_list': user_list
        })


# 以json方式放回 userlist
class GetUserListView(LoginRequiredMixin, View):
    def get(self, request):
        users = []
        for user in User.objects.all():
            users.append({"id": user.id,
                          "email": user.email,
                          "username": user.username})
        return JsonResponse(users, safe=False)


# 修改用户状态
class ModifyUserStatusView(LoginRequiredMixin, View):
    def post(self, request, *args, **kwargs):
        ret = {"status": 0, "errmsg": ""}
        uid = request.POST.get("uid")
        try:
            user = User.objects.get(pk=uid)
            user.is_active = False if user.is_active else True
            user.save()
        except User.DoesNotExist:
            ret['status'] = 1
            ret["errmsg"] = "该用户不存在"
        return HttpResponse(json.dumps(ret), content_type="application/json")
