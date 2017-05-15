# coding:utf8
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required, permission_required
from django.views.generic import TemplateView, View, ListView
from django.http import HttpResponse
from django.conf import settings
from django.core.urlresolvers import reverse
from django.shortcuts import render

from dashboard.forms import IdcForm
from dashboard.models import Idc

import json
import logging

logger = logging.getLogger('opsweb')

class AddIdcView(TemplateView):
    template_name = "server/add_idc.html"

    @method_decorator(login_required)
    @method_decorator(permission_required("dashbord.add_idc", login_url=settings.PERMISSION_NONE_URL))
    def get(self,request, *args, **kwargs):
        return super(AddIdcView, self).get(request, *args, **kwargs)

    @method_decorator(login_required)
    @method_decorator(permission_required("dashbord.add_idc", login_url=settings.PERMISSION_NONE_URL))
    def post(self, request):
        ret = {"status": 0, "next_url": reverse("idc_list")}
        form = IdcForm(request.POST)
        if form.is_valid():
            try:
                idc = Idc(**form.cleaned_data)
                idc.save()
            except Exception as e:
                msg = "用户 {} 添加IDC出错：{}".format(request.user.username, e.args)
                logger.error(msg)
                ret['status'] = 1
                ret['errmsg'] = msg
        else:

            msg = "用户 {} 添加IDC验证失败：{}".format(request.user.username,form.errors.as_json())
            logger.error(msg)

            ret['status'] = 1
            ret['errmsg'] = msg
        return render(request, settings.TEMPLATE_JUMP, ret)

class IdcListView(ListView):
    model = Idc
    template_name = "server/idc_list.html"

    @method_decorator(login_required)
    @method_decorator(permission_required("dashbord.view_idc", login_url=settings.PERMISSION_NONE_URL))
    def get(self, request, *args, **kwargs):
        return super(IdcListView, self).get(request, *args, **kwargs)
