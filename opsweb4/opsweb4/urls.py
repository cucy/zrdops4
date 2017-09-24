"""opsweb4 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import TemplateView

from common.views import success_view, error_view

urlpatterns = [

    url(r"^", include('user_group.urls', namespace='opsuser')),  # 用户，组

    url(r'^admin/', admin.site.urls),

    url(r'^', include('server.urls'), ),    # 服务器
    url(r'^', include('product.urls'), ),   # 业务线
    url(r'^', include('monitor.urls'), ),   # 监控
    url(r"^", include("common.urls")),      # 通用视图

]
