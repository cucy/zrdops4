#!/usr/bin/env python
# -- coding: utf-8 --
# Time: 2017/4/23 12:04
# Author: zhourudong

import json, datetime

from django.views.generic import TemplateView, View, ListView
from django.http import JsonResponse, HttpResponse, Http404
import logging
from dashboard.models import Server

logger = logging.getLogger('opsweb')


class ServerInforReport(View):
    def post(self, request):
        data = request.POST.dict()
        try:
            Server.objects.get(uuid=data.get("uuid", ""))
            data["check_update_time"] = datetime.datetime.now()
            Server.objects.filter(uuid=data['uuid']).update(**data)
        except Server.DoesNotExist:
            s = Server(**data)
            s.save()

        except Exception as e:
            logger.error("sysinfo sync fail{}".format(e.args))

        return HttpResponse("")
