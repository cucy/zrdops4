from django.conf.urls import url
from .views import (
    HostRsyncView, HostGroupGetView, CacheZabbixHostView, LinkTemplateView
)

urlpatterns = [

    url(r'^monitor/zabbix/hostrsync/$', HostRsyncView.as_view()),
    url(r'^monitor/zabbix/hostgroup/get/$', HostGroupGetView.as_view()),
    url(r'^monitor/zabbix/cachehost/$', CacheZabbixHostView.as_view()),
    url(r'^monitor/zabbix/linktemplate/$', LinkTemplateView.as_view()),
]
