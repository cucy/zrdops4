from django.conf.urls import include, url
from . import views
from dashboard import user, server
from dashboard.user import group
from dashboard.server import idc, product

urlpatterns = [
    url(r'^login/$', views.login_view),
    url(r'^logout/$', views.logout_view),
    url(r'^$', views.IndexView.as_view()),

    url(r'^permission/', include([
        url(r'^none/$', views.permission),
    ])),

    url(r'^user/', include([
        url(r'^userlist/$', user.UserListView.as_view()),
        url(r'^modifystatus/$', user.ModifyUserStatusView.as_view()),
        url(r'^modifydepartment/$', user.ModifyDepartmentView.as_view()),
        url(r'^modifyphone/$', user.ModifyUserPhoneView.as_view()),
    ])),

    url(r'^group/', include([
        url(r'^$', group.GroupView.as_view()),
        url(r'^list/$', group.GroupListView.as_view()),
        url(r'^usergroup/$', group.UserGroupView.as_view()),
        url(r'^permission/$', group.GroupPermissionListView.as_view()),
        url(r'^permissions/$', group.GroupPermissionView.as_view()),
    ])),

    url(r'^server/', include([
        url(r'^report/$',server.ServerInfoAutoReport.as_view()),
        url(r'^list/', server.ServerListView.as_view(), name="server_list"),
        url(r'^modify/', include([
            url(r'^status/$', server.ModifyServerStatusView.as_view(), name="modify_server_status"),
        ])),
        url(r'^idc/', include([
            url('^add/$', idc.AddIdcView.as_view(), name="idc_add"),
            url('^list/$', idc.IdcListView.as_view(), name="idc_list"),
        ])),
        url(r'^product/', include([
            url('^manage/$', product.ProductManageView.as_view(), name="product_manage"),
            url('^add/$', product.ProductAddView.as_view(), name="product_add"),
        ])),

    ])),
]
