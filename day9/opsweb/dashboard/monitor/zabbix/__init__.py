#!/usr/bin/env python
# -- coding: utf-8 --
# Time: 2017/6/3 17:29
# Author: zhourudong

import json
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views.generic import TemplateView, ListView, View
from django.http import HttpResponse, JsonResponse, QueryDict

from dashboard.models import ZabbixHost, Server
from dashboard.server.product import Ztree

from .host import ZabbixCacheHost
from .hostgroup import get_zabbix_groups
from .host import create_host
from .zb import zb
from .template import link_templates, unlink_tempaltes

__all__ = ["HostRsyncView","LinkTemplateView" ]


class HostRsyncView(ListView):
    http_method_names = ['get', 'post', 'put', 'patch', 'delete', 'head', 'options', 'trace', 'search', "async"]
    template_name = 'monitor/zabbix_hostrsync.html'
    model = ZabbixHost



class LinkTemplateView(TemplateView):
    template_name = 'monitor/zabbix_linktemplate.html'