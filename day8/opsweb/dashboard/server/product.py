# coding:utf8
import json

from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required, permission_required
from django.views.generic import TemplateView, View, ListView
from django.http import HttpResponse, JsonResponse
from django.conf import settings
from django.core.urlresolvers import reverse
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.models import User
from dashboard.forms.product import ProductForm
from dashboard.models import Product
from django.shortcuts import redirect

import logging
logger = logging.getLogger("opsweb")


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
                tmp['children'].append({"pid":one_obj.id, "name":child.name,"id": child.id})
            ret.append(tmp)
        return ret

class ProductManageView(TemplateView):
    template_name = "server/product_manage.html"
    
    def get_context_data(self, **kwargs):
        context = super(ProductManageView, self).get_context_data(**kwargs)
        context['znodes'] = json.dumps(Ztree().get())
        return context


class ProductManageGetView(View):

    def get(self, request):
        ret = {"status":0, "errmsg": ""}
        id = request.GET.get('id',0)
        try:
            product_obj = Product.objects.get(pk=id)


        except Product.DoesNotExist:
            ret['status'] = 1
            ret['errmsg'] = "该记录不存在"
        else:

            product_data = product_obj.__dict__
            if product_data['p_product_id'] is None:
                product_data['p_product_id']="顶级"
            else:
                product_data['p_product_id'] = product_obj.p_product.name
            del product_data['_state']
            if product_data.has_key("_p_product_cache"):
                del product_data['_p_product_cache']
            ret['data'] = product_data
            print ret
        return JsonResponse(ret, safe=True)



class ProductAddView(TemplateView):
    template_name = "server/product_add.html"

    def get_context_data(self, **kwargs):
        context = super(ProductAddView, self).get_context_data(**kwargs)
        context["user_object_list"] = User.objects.all()
        context['p_products'] = Product.objects.filter(p_product__isnull=True)
        return context

    def post(self, request):
        ret = {"status": 0, "next_url": reverse("product_manage")}
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
        return render(request, settings.TEMPLATE_JUMP, ret)
