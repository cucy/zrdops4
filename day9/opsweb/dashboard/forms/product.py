#!/usr/bin/env python
# _*_ coding:utf8 _*_ 
__date__ = '2017/5/11 22:58'
__author__ = 'zhourudong'

from django import forms
from django.shortcuts import get_object_or_404
from dashboard.models import Product
from django.contrib.auth.models import User


class ProductForm(forms.Form):
    # choices_list =[(user_obj.username, user_obj.email) for user_obj in User.objects.all()]
    choices_list = [(user_obj.email,user_obj.email) for user_obj in User.objects.all()]

    name = forms.CharField(max_length=32, required=True,
                           error_messages={'required': '业务线不能为空', 'max_length': '长度必须小于32'})
    module_letter = forms.CharField(max_length=10, required=True,
                                    error_messages={'required': '字母简称不能为空', 'max_length': '长度必须小于10'})
    p_product = forms.CharField(required=True, )
    op_interface = forms.MultipleChoiceField(choices=choices_list)
    dev_interface = forms.MultipleChoiceField(choices=choices_list)

    # form通过验证后
    # 自定义字段验证  返回的数据经过加工 将数据全部变小写 大写 修改数据 等等
    # 函数名必须以clean_  加字段名开头
    def clean_module_letter(self):
        module_letter = self.cleaned_data.get("module_letter")
        module_letter.strip().lower()
        return module_letter

    def clean_p_product(self):
        p_product = self.cleaned_data.get("p_product")
        try:
            p_id = int(p_product)
        except ValueError:
            forms.ValidationError("上级业务线错误")
        else:
            if p_id == 0:
                return None
            try:
                p_obj = get_object_or_404(Product, pk=p_id)
                return p_obj
            except Product.DoesNotExist:
                forms.ValidationError("上级业务线不存在")

    def clean_op_interface(self):
        op_interface = self.cleaned_data.get("op_interface")
        return ",".join(op_interface)

    def clean_dev_interface(self):
        dev_interface = self.cleaned_data.get("dev_interface")
        return ",".join(dev_interface)


class ProductUpdateForm(ProductForm):
    pass
