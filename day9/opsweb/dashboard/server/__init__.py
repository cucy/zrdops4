#!/usr/bin/env python
# -- coding: utf-8 --
# Time: 2017/4/23 12:04
# Author: zhourudong

import json, datetime
import logging

from django.core.urlresolvers import reverse
from django.shortcuts import get_object_or_404, render
from django.views.generic import TemplateView, View, ListView
from django.http import JsonResponse, HttpResponse, Http404
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required, permission_required
from django.conf import settings

from dashboard.models import Server, Status, Product

logger = logging.getLogger('opsweb')


class ServerInforReport(View):
    def post(self, request):
        data = request.POST.dict()
        try:
            Server.objects.get(uuid=data.get("uuid", ""))
            data["check_update_time"] = datetime.datetime.now()
            Server.objects.filter(uuid=data['uuid']).update(**data)
        except Server.DoesNotExist:
            s = Server(**data)
            s.save()

        except Exception as e:
            logger.error("sysinfo sync fail{}".format(e.args))

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

    def get_search_queryset(self, queryset):
        # 专门搜索函数
        hostname = self.request.GET.get("hostname", "").strip().lower()
        queryset = queryset.filter(hostname__contains=hostname)

        ip_info = self.request.GET.get("ip_info", "").strip().lower()
        queryset = queryset.filter(ip_info__contains=ip_info)

        return queryset

    def get_context_data(self, **kwargs):
        context = super(ServerListView, self).get_context_data(**kwargs)
        context['page_range'] = self.get_page_range(context['page_obj'])
        # 保留搜索状态
        context["uri"] = self.get_uri()
        context.update(self.request.GET.dict())

        return context

    def get_uri(self):
        """ 返回搜索参数 """
        args = self.request.GET.copy()
        if args.has_key("page"):
            args.pop("page")
        # context["uri"] = args.urlencode()
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


class ModityServerStatusView(TemplateView):
    template_name = "server/modify_server_status.html"

    def get_context_data(self, **kwargs):
        context = super(ModityServerStatusView, self).get_context_data(**kwargs)
        context["status_obj_list"] = Status.objects.all()

        context["obj"] = get_object_or_404(Server, pk=self.request.GET.get("id", None))
        context['product_obj'] = Product.objects.filter(p_product__isnull=False)
        return context

    def post(self, request):
        ret = {"status": 0, "next_url": reverse("server_list")}
        # 修改完成 返回之前的搜索页
        next_url = self.request.GET.get("next", "")

        s_id = request.POST.get("id", None)
        product_id = request.POST.get('product_id', None)
        try:
            product_obj = get_object_or_404(Product, pk=product_id)
            server_obj = get_object_or_404(Server, pk=s_id)

            # 一个资产对象只保存一个项目
            server_obj.product_set.clear()
            server_obj.product_set.add(product_obj)
        except Exception as e:
            logger.error(e.args)
            ret["status"] = 1
            ret["errmsg"] = e.args


        if next_url:
            ret["next_url"] = next_url
        object = get_object_or_404(Server, pk=request.POST.get("id", None))
        try:
            object.status = request.POST.get("status", "")  # 应该验证传过来的status字符 是否在模型Status里
            object.save()
        except Exception as e:
            ret["status"] = 1
            ret["errmsg"] = e.args
        return render(request, settings.TEMPLATE_JUMP, ret)
