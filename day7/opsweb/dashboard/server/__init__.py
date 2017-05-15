# coding:utf8
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required, permission_required
from django.views.generic import TemplateView, View, ListView
from django.http import HttpResponse
from django.conf import settings
from django.core.urlresolvers import reverse
from django.shortcuts import render, get_object_or_404


from dashboard.models import Server, Status

import datetime
import json
import logging

logger = logging.getLogger('opsweb')

class ServerInfoAutoReport(View):

    def post(self, request):
        data = request.POST.dict()
        try:
            Server.objects.get(uuid=data.get('uuid', ""))
            data['check_update_time'] = datetime.datetime.now()
            Server.objects.filter(uuid=data['uuid']).update(**data)
        except Server.DoesNotExist:
            s = Server(**data)
            s.save()
        except Exception as e:
            logger.error("sysinfo 同步失败：{}".format(e.args))
        return HttpResponse("")


class ServerListView(ListView):
    model = Server
    template_name = "server/server_list.html"
    paginate_by = 10
    before_index = 6
    after_index = 5

    def get_queryset(self):
        queryset = super(ServerListView, self).get_queryset()
        queryset = self.get_search_queryset(queryset)
        return queryset


    def get_search_queryset(self,queryset):
        hostname = self.request.GET.get('hostname', '').strip().lower()
        queryset = queryset.filter(hostname__contains=hostname)

        inner_ip = self.request.GET.get('inner_ip', '').strip().lower()
        queryset = queryset.filter(inner_ip__contains=inner_ip)

        return queryset

    def get_context_data(self, **kwargs):
        context = super(ServerListView, self).get_context_data(**kwargs)
        context['page_range'] = self.get_page_range(context['page_obj'])
        context.update(self.request.GET.dict())
        context['uri'] = self.get_uri()
        return context

    def get_uri(self):
        args = self.request.GET.copy()
        if args.has_key("page"):
            args.pop("page")
        return args.urlencode()

    def get_page_range(self, page_obj):
        start_index = page_obj.number - self.before_index
        if start_index < 0:
            start_index = 0
        return page_obj.paginator.page_range[start_index: page_obj.number + self.after_index]

    @method_decorator(login_required)
    @method_decorator(permission_required("dashboard.view_server", login_url=settings.PERMISSION_NONE_URL))
    def get(self, request, *args, **kwargs):
        return super(ServerListView, self).get(request, *args, **kwargs)


class ModifyServerStatusView(TemplateView):
    template_name = "server/modify_server_status.html"
    
    def get_context_data(self, **kwargs):

        context = super(ModifyServerStatusView, self).get_context_data(**kwargs)
        context['obj'] = get_object_or_404(Server,pk=self.request.GET.get("id", None))
        context['status_obj_list'] = Status.objects.all()
        return context

    def post(self, request):
        ret =  {"status": 0, "next_url": reverse("server_list")}
        next_url = request.GET.get('next', "")
        if next_url:
            ret['next_url'] = next_url
        obj = get_object_or_404(Server, pk=request.POST.get('id', None))
        try:
            obj.status = request.POST.get('status', "")
            obj.save()
        except Exception as e:
            ret['status'] = 1
            ret['errmsg'] = e.args
        return render(request, settings.TEMPLATE_JUMP, ret)
