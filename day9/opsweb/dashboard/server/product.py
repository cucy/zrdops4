#!/usr/bin/env python
# _*_ coding:utf8 _*_
__date__ = '2017/5/11 21:50'
__author__ = 'zhourudong'

import json

from django.views.generic import TemplateView, ListView, View
from django.contrib.auth.models import User
from django.http import HttpResponse, JsonResponse, QueryDict
from django.shortcuts import render
from django.core.urlresolvers import reverse
from django.conf import settings
from dashboard.models import Product
from dashboard.forms.product import ProductForm, ProductUpdateForm
import logging

logger = logging.getLogger('opsweb')


# 取到树的数据
class Ztree(object):
    def __init__(self):
        self.data = self._get_products()

    def _get_products(self):
        return Product.objects.all()

    def _get_second_product(self, pid):
        return [obj for obj in self.data if obj.p_product is not None and obj.p_product.id == pid]

    def get(self):
        ret = []
        one_products = [p_obj for p_obj in self.data if p_obj.p_product is None]
        for one_obj in one_products:
            two_product = self._get_second_product(one_obj.id)
            tmp = {}
            tmp['pid'] = 0
            tmp['id'] = one_obj.id
            tmp['name'] = one_obj.name
            tmp['children'] = []
            for child in two_product:
                tmp['children'].append({"pid": one_obj.id, "name": child.name, "id": child.id})
            ret.append(tmp)
        return ret


# 业务线页面展示
class ProductManagerView(TemplateView):
    template_name = "server/product_manager.html"

    def get_context_data(self, **kwargs):
        context = super(ProductManagerView, self).get_context_data(**kwargs)
        context['znodes'] = json.dumps(Ztree().get())
        return context

    def post(self, request):
        ret = { "status": 0, "next_url": reverse('product_manage')}
        post_data = {}

        post_data['dev_interface'] = request.POST.getlist('dev_interface[]', None)
        post_data['op_interface'] = request.POST.getlist('op_interface[]', None)
        post_data['name'] = request.POST.get('name', None)
        post_data['p_product'] = request.POST.get('p_id', None) # 取上级业务线的id
        post_data['id'] = request.POST.get('id', None)
        post_data['module_letter'] = request.POST.get('module_letter', None)

        _id = post_data.get('id', None)
        # 判断是否是顶级业务线
        if post_data['p_product'] == post_data['id']:
            post_data['p_product'] = 0

        form = ProductUpdateForm(post_data)
        if form.is_valid():
            try:
                product = Product.objects.filter(pk=_id).update(**form.cleaned_data)
            except Exception as e:
                msg = "用户{}修改业务线出错, {}".format(request.user.username, e.args)
                logger.error(msg)
                ret["status"] = 1
                ret["errmsg"] = msg
        else:
            msg = "用户{} 修改业务线验证失败, {}".format(request.user.username, form.errors.as_json())
            logger.error(msg)
            ret["status"] = 1
            ret["errmsg"] = msg
        return JsonResponse(ret, safe=True)


# 点击业务线展示详情数据
class ProductManageGetView(View):
    def get(self, request):
        ret = {"status": 0, "errmsg": ""}
        id = request.GET.get('id', 0)
        try:
            product_obj = Product.objects.values().get(pk=id)
        except Product.DoesNotExist:
            ret['status'] = 1
            ret['errmsg'] = "该记录不存在"
        else:
            product_data = dict(product_obj)
            if product_data['p_product_id'] is None:
                product_data['p_product_id'] = "顶级"
                product_data['p_product_id_'] = product_obj.get('id', None)
            else:
                product_data['p_product_id'] = Product.objects.get(pk=id).p_product.name
                product_data['p_product_id_'] = product_obj.get('p_product_id', None)
            ret['data'] = product_data
            tmp = []
            user_objs = User.objects.values('username', 'email')
            # for _user_obj in user_objs:
            #     tmp.append({'username': _user_obj['username'], 'email':  _user_obj['email'] })
            tmp = list(user_objs)
            ret['u_email_lists'] = tmp

        return JsonResponse(ret, safe=True)


# 添加业务线
class ProductAddView(TemplateView):
    template_name = "server/add_product.html"

    def get_context_data(self, **kwargs):
        context = super(ProductAddView, self).get_context_data(**kwargs)
        context["user_object_list"] = User.objects.all()
        context['p_products'] = Product.objects.filter(p_product__isnull=True)

        return context

    def post(self, request):
        ret = {"status": 0, "next_url": reverse('product_manage')}
        form = ProductForm(request.POST)
        if form.is_valid():
            try:
                product = Product(**form.cleaned_data)
                product.save()
            except Exception as e:
                msg = "用户{}添加业务线出错, {}".format(request.user, e.args)
                logger.error(msg)
                ret["status"] = 1
                ret["errmsg"] = msg
        else:
            msg = "用户{} 添加业务线验证失败, {}".format(request.user.username, form.errors.as_json())
            logger.error(msg)
            ret["status"] = 1
            ret["errmsg"] = msg
        return render(request, settings.TEMPLATE_JUMP, ret)
