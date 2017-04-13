# -- coding: utf-8 --

from django.shortcuts import render
from django.http import HttpResponse, HttpRequest, JsonResponse
from django.contrib.auth import authenticate, login, logout


# Create your views here.

def hello(request):
    data = {'name': 'suse', 'age': 1991}
    # data = [1,2,3]
    return JsonResponse(data, safe=False)


def login_view(request):
    if request.method == 'GET':
        return render(request, 'user/login.html', {'title': '运维平台'})
    elif request.method == 'POST':
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)
        # 验证用户名和密码
        user = authenticate(username=username, password=password)
        print(user)
        if user is not None:
            if user.is_active:
                login(request=request, user=user)  # 写入cookie  session
                return HttpResponse('登录成功')
        else:
            return HttpResponse('登录失败')


def logout_view(request):
    print(request.user)
    logout(request)
    return HttpResponse('用户成功退出')
