# coding:utf8
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required, permission_required
from django.views.generic import TemplateView, View, ListView
from django.http import HttpResponse
from django.conf import settings
from django.core.urlresolvers import reverse
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.models import User
from dashboard.forms.product import ProductForm
from dashboard.models import Product

import logging
logger = logging.getLogger("opsweb")


class ProductManageView(TemplateView):
    template_name = "server/product_manage.html"

class ProductAddView(TemplateView):
    template_name = "server/product_add.html"

    def get_context_data(self, **kwargs):
        context = super(ProductAddView, self).get_context_data(**kwargs)
        context["user_object_list"] = User.objects.all()
        return context

    def post(self, request):
        ret = {"status": 0, "next_url": reverse("idc_list")}
        print request.POST
        form = ProductForm(request.POST)
        if form.is_valid():
            try:
                product = Product(**form.cleaned_data)
                product.save()
            except Exception as e:
                msg = "用户 {} 业务线出错：{}".format(request.user.username, e.args)
                logger.error(msg)
                ret['status'] = 1
                ret['errmsg'] = msg
        else:
            msg = "用户 {} 添加业务线验证失败：{}".format(request.user.username, form.errors.as_json())
            logger.error(msg)

            ret['status'] = 1
            ret['errmsg'] = msg
        #return render(request, settings.TEMPLATE_JUMP, ret)
        return  HttpResponse("")