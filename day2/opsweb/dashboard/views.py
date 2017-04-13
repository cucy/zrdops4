# -- coding: utf-8 --

from django.shortcuts import render
from django.http import HttpResponse, HttpRequest, JsonResponse
from django.contrib.auth import authenticate, login, logout
from django.views.generic import View


# Create your views here.

def login_view(request):
    if request.method == 'GET':
        return render(request, 'user/login.html', {'title': '运维平台'})
    elif request.method == 'POST':
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)
        ret = {"status": 0}
        # 验证用户名和密码
        user = authenticate(username=username, password=password)
        print(user)
        if user is not None:
            if user.is_active:
                login(request=request, user=user)  # 写入cookie  session
                ret['next_url'] = '/'
            else:
                ret['status'] = 1
                ret['errmsg'] = '用户禁用'
        else:
            ret['status'] = 2
            ret['errmsg'] = '用户或密码错误'
        return JsonResponse(ret, safe=True)


def logout_view(request):
    print(request.user)
    logout(request)
    return HttpResponse('用户成功退出')


class IndexViews(View):
    def get(self, request):
        return render(request, 'public/index.html')

    def post(self, request):
        return ''

# def test_form(request):
#     if request.method == 'GET':
#         return render(request, 'test/test_form.html')
#     elif request.method == 'POST':
#         username = request.POST.get('username', '')
#         fav = request.POST.getlist('fav', '')
#
#         print 'username: ', username, ' fav:', fav
#
#         # return HttpResponse('')
