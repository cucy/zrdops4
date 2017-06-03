#!/usr/bin/env python
# -- coding: utf-8 --
# Time: 2017/4/23 12:04
# Author: zhourudong
import json

from django.views.generic import TemplateView, ListView
from django.shortcuts import render
from django.core.urlresolvers import reverse
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required, permission_required
from django.conf import settings
from dashboard.forms import IdcForm
import logging

logger = logging.getLogger('opsweb')
from dashboard.models import IDC


class AddIdcView(TemplateView):
    template_name = "server/add_idc.html"

    @method_decorator(login_required)
    @method_decorator(permission_required("dashboard.view_idc", login_url=settings.PERMISSION_NONE_URL))
    def get(self, request, *args, **kwargs):
        return super(AddIdcView, self).get(request, *args, **kwargs)

    @method_decorator(login_required)
    @method_decorator(permission_required("dashboard.add_idc", login_url=settings.PERMISSION_NONE_URL))
    def post(self, request):
        ret = {"status": 0, "next_url": reverse('idc_list')}
        form = IdcForm(request.POST)

        if form.is_valid():
            try:
                idc = IDC(**form.cleaned_data)
                idc.save()
            except Exception as e:
                msg = "用户{}添加idc出错, {}".format(request.user, e.args)
                logger.error(msg)
                ret["status"] = 1
                ret["errmsg"] = msg
        else:
            msg = "用户{} 添加idc验证失败, {}".format(request.user, form.errors.as_json())
            logger.error(msg)
            ret["status"] = 1
            ret["errmsg"] = msg
        return render(request, settings.TEMPLATE_JUMP, ret)


class IdcListView(ListView):
    template_name = 'server/idc_list.html'
    model = IDC

    @method_decorator(login_required)
    @method_decorator(permission_required("dashboard.view_idc", login_url=settings.PERMISSION_NONE_URL))
    def get(self, request, *args, **kwargs):
        return super(IdcListView, self).get(request, *args, **kwargs)
