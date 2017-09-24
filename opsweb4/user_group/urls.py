from django.conf.urls import url
from .views import (
    login_view, UserLoginView,GetUserListView ,UserLogoutView, UserListView, ModifyUserStatusView
)

urlpatterns = [
    url(r'^user/login/$', UserLoginView.as_view(), name='login'),
    # url(r'^user/login/$', login_view, name='login'),
    url(r'^user/logout/$', UserLogoutView.as_view(), name='logout'),

    url(r'^user/list/$', UserListView.as_view(), name='user_list'),
    url(r'^user/list/get/$', GetUserListView.as_view(), name="get_user_list_json"),
    url(r'^user/list/modify/status/$', ModifyUserStatusView.as_view(), name='modify_user_status'),

]
