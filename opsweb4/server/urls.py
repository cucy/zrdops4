from django.conf.urls import url, include
from .views import (
    ServerInfoAutoReport,
    ServerListView, ModifyStatusView, ModifyProductView, ServerGetView,
    StatusAddView
)

urlpatterns = [

    url(r'^server/report/$', ServerInfoAutoReport.as_view()),
    url(r'^server/list/$', ServerListView.as_view(), name='server_list'),
    url(r'^server/modify/status/(?P<pk>\w+)/$', ModifyStatusView.as_view(),
        name='modify_server_status'),
    url(r'^server/modify/product/(?P<pk>\w+)/$', ModifyProductView.as_view(),
        name='modify_server_product'),
    url(r'^server/get/$', ServerGetView.as_view(), name='server_get'),

    url(r'^status/add/$', StatusAddView.as_view(), name='statu_add'),

]
