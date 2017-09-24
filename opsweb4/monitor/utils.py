#!/usr/bin/env python
# _*_ coding:utf8 _*_ 
__date__ = '2017/9/24 11:17'
__author__ = 'zhourudong'

# coding:utf-8
from dashboard.monitor.zabbix.zb import zb

def get_zabbix_groups():
    groups = zb.zb.hostgroup.get(output=["groupid","name"])
    return groups