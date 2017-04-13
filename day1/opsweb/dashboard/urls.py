#!/usr/bin/env python
#-- coding: utf-8 --
#Time: 2017/3/14 11:29
#Author: zhourudong

from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^hello/', views.hello),
    url(r'^login/', views.login_view),
    url(r'^logout/', views.logout_view),
]