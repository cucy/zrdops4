#!/usr/bin/env python
# -- coding: utf-8 --
# Time: 2017/6/3 18:00
# Author: zhourudong

from .zb import zb

def get_zabbix_groups():
    groups = zb.zb.hostgroup.get(output=["groupid","name"])
    return groups