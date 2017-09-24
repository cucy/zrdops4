from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render
from django.views.generic import TemplateView


# 主页
class IndexView(LoginRequiredMixin, TemplateView):
    template_name = "index.html"


# 操作成功视图
@login_required
def success_view(request):
    if request.method == 'GET':
        next_url = request.GET.get("next_url", "/")
        return render(request, 'public/success.html', {"next_url": next_url})


# 错误页面视图
@login_required
def error_view(request):
    if request.method == 'GET':
        next_url = request.GET.get("next_url", "/")
        errmsg = request.GET.get("errmsg", "")
        return render(request, 'public/error.html', {"next_url": next_url, "errmsg": errmsg})
