#!/usr/bin/env python
# -- coding: utf-8 --
# Time: 2017/4/23 11:44
# Author: zhourudong

from django import forms
from dashboard.models import IDC


class IdcForm(forms.Form):
    name = forms.CharField(max_length=10, required=True,
                           error_messages={'required': '机房简称不能为空', 'max_length': '长度必须大于10'})
    idc_name = forms.CharField(required=True, max_length=128)
    address = forms.CharField(required=True, max_length=128)
    user = forms.CharField(required=True, max_length=32)
    user_phone = forms.CharField(required=True, max_length=20)
    user_email = forms.EmailField(required=True, max_length=32)

    # form通过验证后
    # 自定义字段验证  返回的数据经过加工 将数据全部变小写 大写 修改数据 等等
    # 函数名必须以clean_  加字段名开头
    def clean_name(self):
        name = self.cleaned_data.get('name')

        return name.lower()
