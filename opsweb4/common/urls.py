from django.conf.urls import url
from django.contrib import admin
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import TemplateView

from common.views import success_view, error_view, IndexView

urlpatterns = [

    # 通用视图
    # 主页
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^success/$', success_view, name='success'),
    url(r'^error/$', error_view, name='error'),

]
