#!/usr/bin/env python
# _*_ coding:utf8 _*_ 
__date__ = '2017/9/24 11:25'
__author__ = 'zhourudong'

from .zb import zb


def get_zabbix_groups():
    groups = zb.zb.hostgroup.get(output=["groupid", "name"])
    return groups
