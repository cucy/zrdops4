import datetime
import json
import logging
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core import serializers
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, get_object_or_404, redirect

from django.urls import reverse_lazy

from django.views import View
from django.views.generic import UpdateView, CreateView

logger = logging.getLogger(__name__)

from .models import Server, Status, Product


# 服务器列表
class ServerListView(LoginRequiredMixin, View):
    template_name = 'server/server_list.html'

    def get(self, request):
        server_list = Server.objects.all()
        return render(request, self.template_name, {
            'server_list': server_list
        })


class ServerInfoAutoReport(LoginRequiredMixin, View):
    def post(self, request):
        ret = {"status": 0, "errmsg": ""}
        data = request.POST.dict()

        logger.debug("更新服务器数据： {}".format(json.dumps(data)))
        try:
            data['check_update_time'] = datetime.datetime.now()

            if Server.objects.get(uuid=data['uuid']):
                Server.objects.filter(uuid=data['uuid']).update(**data)
            logger.debug("数据更新成功")
        except Server.DoesNotExist as e:
            server = Server(**data)
            server.save()
            logger.debug("{} 服务器数据不存在，更新成功".format(server.hostname))
        except Exception as e:
            logger.error("更新服务器数据失败: {}".format(e.args))
            ret['status'] = 1
            ret['errmsg'] = e.args
        return JsonResponse(ret)


# 修改服务器状态
class ModifyStatusView(LoginRequiredMixin, UpdateView):
    template_name = 'server/server_modify_status.html'
    fields = ["hostname", "inner_ip", "status"]
    model = Server
    success_url = "/server/list/"

    def get_form(self, form_class=None):
        form = super(ModifyStatusView, self).get_form(form_class)
        form.fields['status'].widget.attrs.update({
            'class': 'chosen-select chosen-transparent form-control',
            'parsley - trigger': "change",
            'parsley-required': "true",
            ' parsley-error-container': "#select_status"
        })
        return form


# 修改业务线
class ModifyProductView(LoginRequiredMixin, UpdateView):
    template_name = "server/server_modify_product.html"
    model = Server
    fields = ["hostname", "inner_ip", "service_id", "server_purpose"]
    success_url = reverse_lazy("server_list")

    def get_context_data(self, **kwargs):
        kwargs.update({"products": Product.objects.all()})

        return super(ModifyProductView, self).get_context_data(**kwargs)


# 获取server 视图
class ServerGetView(LoginRequiredMixin, View):
    def get(self, request):
        queryset = Server.objects.all()
        server_purpose = request.GET.get('server_purpose', None)
        if server_purpose and server_purpose.isdigit():
            queryset = queryset.filter(server_purpose_id=server_purpose)
        return HttpResponse(serializers.serialize("json", queryset), content_type="application/json")


# 添加服务器状态视图
class StatusAddView(LoginRequiredMixin, CreateView):
    model = Status
    fields = ['name']
    template_name = 'server/add_status.html'
    success_url = reverse_lazy("server_list")
