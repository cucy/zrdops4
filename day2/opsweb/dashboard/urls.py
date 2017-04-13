#!/usr/bin/env python
#-- coding: utf-8 --
#Time: 2017/3/14 11:29
#Author: zhourudong

from django.conf.urls import include, url
from . import views
from . import user
urlpatterns = [

    url(r'^login/', views.login_view),
    url(r'^logout/', views.logout_view),
    url(r'^$',views.IndexViews.as_view()),
    url(r'^user/',include([
        url(r'^userlist/$', user.UserListView.as_view()),
        url(r'^modifystatus/$', user.ModifyUserStatusView.as_view()),
    ])),

]