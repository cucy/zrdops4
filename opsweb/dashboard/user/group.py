#coding:utf8
from django.views.generic import TemplateView, View, ListView
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.models import Group,User, Permission
from django.http import JsonResponse

class GroupListView(ListView):
    model = Group
    template_name = 'user/grouplist.html'
    def post(self, request):
        ret = {'status':0}
        name =  request.POST.get('name', '')
        if name:
            try:
                group = Group()
                group.name = name
                group.save()
            except Exception as e:
                ret['status'] = 1
                ret['ermsg'] = e.args
                
        return JsonResponse(ret, safe=True)
    pass