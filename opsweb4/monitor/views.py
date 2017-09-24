import json

from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse, QueryDict, HttpResponse
from django.views import View
from django.views.generic import ListView, TemplateView

from product.views import Ztree
from server.models import Server, ZabbixHost
from monitor.zabbix.hostgroup import get_zabbix_groups
from monitor.zabbix.host import create_host, ZabbixCacheHost
from monitor.zabbix.zb import zb
from monitor.zabbix.template import unlink_tempaltes, link_templates


class HostRsyncView(LoginRequiredMixin, ListView):
    http_method_names = ['get', 'post', 'put', 'patch', 'delete', 'head', 'options', 'trace', 'search', "async"]
    template_name = "monitor/host_rsync.html"
    model = ZabbixHost

    def get_context_data(self, **kwargs):
        context = super(HostRsyncView, self).get_context_data(**kwargs)
        context['ztree'] = json.dumps(Ztree().get(async=True))
        context['groups'] = get_zabbix_groups()
        context['servers'] = Server.objects.values("id", "hostname")[0:10]
        return context

    def search(self, request):
        data = QueryDict(request.body)
        key = data.get('key', None)
        data = []
        if key is not None:
            data = Server.objects.filter(hostname__contains=key).values("id", "hostname")[:10]
        return JsonResponse(list(data), safe=False)

    def post(self, request):
        ret = {"status": 0, "errmsg": ""}
        groupid = request.POST.get('group', None)
        serverids = request.POST.getlist("server", [])
        ret_data = create_host(serverids, groupid)
        ret['data'] = ret_data
        return JsonResponse(ret, safe=False)

    def async(self, request):
        params = QueryDict(request.body)
        server_purpose = params.get("id")
        data = []
        try:

            for server in Server.objects.filter(server_purpose_id=server_purpose):
                z_data = {}
                z_data['id'] = server.id
                z_data['name'] = server.hostname
                z_data['open'] = True
                data.append(z_data)
        except Exception as  e:
            pass
        return JsonResponse(data, safe=False)


class HostGroupGetView(LoginRequiredMixin, View):
    def get(self, request):
        hostgroups = get_zabbix_groups()
        return JsonResponse(hostgroups, safe=False)


class CacheZabbixHostView(LoginRequiredMixin, View):
    def get(self, request):
        zc = ZabbixCacheHost()
        zc.cache_zabbix()
        return HttpResponse("")


class LinkTemplateView(LoginRequiredMixin, TemplateView):
    http_method_names = ['get', 'post', 'put', 'patch', 'delete', 'head', 'options', 'trace', 'zabbix']
    template_name = "monitor/link_template.html"

    def get_context_data(self, **kwargs):
        context = super(LinkTemplateView, self).get_context_data(**kwargs)
        context['ztree'] = json.dumps(Ztree().get())
        context['templates'] = zb.get_template()
        return context

    def get(self, request, *args, **kwargs):
        return super(LinkTemplateView, self).get(request, *args, **kwargs)

    def zabbix(self, request):
        params = QueryDict(request.body)
        zabbix_data = []
        servers = Server.objects.filter(server_purpose_id=params.get("id", '0'))
        for server in servers:
            data = {}
            data['hostname'] = server.hostname
            data['id'] = server.id
            if hasattr(server, "zabbixhost"):
                data['monitor'] = True
                hostid = server.zabbixhost.hostid
                templates = zb.get_template(ids=hostid)
                if templates:
                    data['templates_flag'] = True
                    data['templates'] = templates
                else:
                    data['templates_flag'] = False
            else:
                data['monitor'] = False
            zabbix_data.append(data)
        return JsonResponse(zabbix_data, safe=False)

    def delete(self, request):
        ret = {"status": 0}
        params = QueryDict(request.body)
        hostid = params.get('hostid', "")
        templateid = params.get('templateid', "")
        if not hostid:
            ret['status'] = 1
            ret['errmsg'] = "参数错误，没有指定主机"
        if not templateid:
            ret['status'] = 1
            ret['errmsg'] = "参数错误，没有指定模板"
        try:
            unlink_tempaltes(hostid, templateid)
        except Exception as e:
            ret['status'] = 1
            ret['errmsg'] = e.args
        return JsonResponse(ret)

    def post(self, request):
        ret = {"status": 0}
        hostids = request.POST.getlist("hostids[]", [])
        templates = request.POST.getlist("templateids[]", [])

        if not hostids:
            ret['status'] = 1
            ret['errmsg'] = "没有选择主机"
            return JsonResponse(ret)

        if not templates:
            ret['status'] = 1
            ret['errmsg'] = "没有选择模板"
            return JsonResponse(ret)
        ret['data'] = link_templates(hostids, templates)
        return JsonResponse(ret)
