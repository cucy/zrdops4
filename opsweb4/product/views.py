from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import User
import json

from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views import View
from django.core import serializers
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import CreateView, TemplateView

from server.models import Product


class Ztree(object):
    def __init__(self):
        self.data = self._get_product()

    def _get_product(self):
        return Product.objects.all()

    def _get_one_product(self):
        return [p for p in self.data if p.pid == 0]

    def _get_second_product(self, pid):
        return [p for p in self.data if p.pid == pid]

    def get(self, async=False):
        ret = []
        for record in self._get_one_product():
            tmp = self._get_ztree_attr(record)
            tmp['children'] = []
            for child in self._get_second_product(record.id):
                tmp['children'].append(self._get_ztree_attr(child, async))
            ret.append(tmp)
        return ret

    def _get_ztree_attr(self, obj, async=False):
        ret = {"name": obj.service_name,
               "pid": obj.pid,
               "id": obj.id}
        if async:
            ret['isParent'] = True
        return ret


# 获取product信息
class ProductsGetView(LoginRequiredMixin, View):
    def get(self, request):
        pid = request.GET.get("pid", 0)
        products = Product.objects.filter(pid__exact=pid)
        return HttpResponse(serializers.serialize("json", products), content_type="application/json")


class AddProductView(LoginRequiredMixin, CreateView):
    template_name = "product/add_product.html"
    model = Product
    fields = "__all__"
    success_url = reverse_lazy("index")

    def get_context_data(self, **kwargs):
        kwargs.update({
            "userlist": User.objects.all(),
            "products": Product.objects.all()}
        )

        return super(AddProductView, self).get_context_data(**kwargs)


class ProductManageView(LoginRequiredMixin, TemplateView):
    template_name = "product/product_manage.html"

    def get(self, request):
        ztree = Ztree()
        data = ztree.get()
        return render(request, self.template_name, {"ztree": json.dumps(data)})

    @csrf_exempt
    def post(self, request):
        ret = {"status": 0, "errmsg": ""}

        id = request.POST.get("id"),
        # {'service_name': 'monitor', 'module_letter': 'monitor', 'op_interface[]': 'daiqingyang@ucfgroup.com', 'dev_interface[]': 'rongjunfeng@ucfgroup.com'}
        data = {
            "service_name": request.POST.get("service_name", ''),
            "module_letter": request.POST.get("module_letter", ""),
            "op_interface": ",".join(request.POST.getlist("op_interface[]", [])),
            "dev_interface": ",".join(request.POST.getlist("dev_interface[]", [])),
        }
        try:
            Product.objects.filter(pk=id[0]).update(**data)
        except Exception as e:
            ret['status'] = 1
            ret['errmsg'] = e.args
        return JsonResponse(ret, safe=False)


# 获取product信息
class ProductManageGetView(LoginRequiredMixin, View):
    def get(self, request):
        id = request.GET.get("id", 0)
        ret = {"status": 0, "errmsg": ""}
        try:
            product = Product.objects.get(pk=id)
            data = product.__dict__
            if data['pid'] == 0:
                data['pid'] = "顶级"
            else:
                try:
                    p_product = Product.objects.get(pk=data['pid'])
                    data['pid'] = p_product.service_name
                except Product.DoesNotExist:
                    data['pid'] = "无"
            del data['_state']
            ret['data'] = data

        except Product.DoesNotExist as e:
            ret['status'] = 1
            ret['errmsg'] = e.args
        return HttpResponse(json.dumps(ret), content_type="application/json")
