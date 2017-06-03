# coding:utf8
from django.db import models
from django.contrib.auth.models import User


class IDC(models.Model):
    name = models.CharField(max_length=10, unique=True, verbose_name=u'idc字母简称')
    idc_name = models.CharField(max_length=128, verbose_name=u'中文名')
    address = models.CharField(max_length=128, verbose_name=u'机房IP地址')
    user = models.CharField(max_length=32, verbose_name=u'机房联系人')
    user_phone = models.CharField(max_length=20, verbose_name=u'机房联系电话')
    user_email = models.EmailField(max_length=32, verbose_name=u'机房联系人邮箱地址')

    class Meta:
        db_table = "idc"
        permissions = (
            ("view_idc", "访问idc列表"),
        )


class Server(models.Model):
    supplier = models.IntegerField(null=True)
    manufacturers = models.CharField(max_length=50, null=True)
    manufacture_date = models.DateField(null=True)
    server_type = models.CharField(max_length=20, null=True)
    sn = models.CharField(max_length=60, db_index=True, null=True)
    idc = models.ForeignKey(IDC, null=True)
    os = models.CharField(max_length=50, null=True)
    hostname = models.CharField(max_length=50, db_index=True, null=True)
    inner_ip = models.CharField(max_length=32, null=True, unique=True)
    mac_address = models.CharField(max_length=50, null=True)
    ip_info = models.CharField(max_length=255, null=True)
    server_cpu = models.CharField(max_length=250, null=True)
    server_disk = models.CharField(max_length=100, null=True)
    server_mem = models.CharField(max_length=100, null=True)
    status = models.CharField(max_length=100, db_index=True, null=True)
    remark = models.TextField(null=True)
    # service_id      = models.IntegerField(db_index=True, null=True)
    # server_purpose  = models.ForeignKey(Product,null=True)
    check_update_time = models.DateTimeField(null=True)
    vm_status = models.IntegerField(db_index=True, null=True)
    uuid = models.CharField(max_length=100, db_index=True, null=True)

    def __str__(self):
        return "{} {}".format(self.hostname, self.inner_ip)

    class Meta:
        db_table = "server"
        permissions = (
            ("view_server", "访问服务器信息"),
        )


class Department(models.Model):
    name = models.CharField(max_length=11, null=True)

    class Meta:
        db_table = "department"


class Profile(models.Model):
    user = models.OneToOneField(User)
    phone = models.CharField(max_length=11, null=True)
    title = models.CharField(max_length=32, null=True)
    chinaname = models.CharField(max_length=32, default='', null=True)
    department = models.ForeignKey(Department, null=True)

    class Meta:
        db_table = "user_profile"
        default_related_name = "profile"


class Status(models.Model):
    name = models.CharField(max_length=32, unique=True, verbose_name=u"状态")

    class Meta:
        db_table = "status"


class Product(models.Model):
    name = models.CharField(max_length=32, verbose_name=u"业务线", unique=True)
    p_product = models.ForeignKey("self", null=True, verbose_name=u"上一级业务线")
    module_letter = models.CharField(max_length=10, verbose_name=u"字母简称")
    op_interface = models.CharField(max_length=255, verbose_name=u"运维负责人: username1,username2")
    dev_interface = models.CharField(max_length=255, verbose_name=u"业务负责人: username1,username2")
    p_to_server = models.ManyToManyField(Server, verbose_name=u"关联资产")

    def __str__(self):
        return "{}".format(self.module_letter)

    class Meta:
        db_table = "product"
        permissions = (
            ("view_product", "管理业务线"),
        )


# 业务线和主机资产关联
"""   
class ProductServer(models.Model):
    server = models.ForeignKey(Server, )
    product = models.ForeignKey(Product, )

    class Meta:
        db_table = 'server_product'
        permissions = (
            ("view_server_product", "业务线和主机资产查看"),
        )
        unique_together = (('server', 'product'),)
"""


class ZabbixHost(models.Model):
    server = models.OneToOneField(Server, null=True)
    hostid = models.IntegerField(db_index=True, null=True)
    host = models.CharField(max_length=50, db_index=True, null=True)
    ip = models.CharField(max_length=50, db_index=True, null=True)
    updatetime = models.DateTimeField(auto_now=True)

    def __str__(self):
        return "{} {}".format(self.hostid, self.host)

    def __unicode__(self):
        return "{} {}".format(self.hostid, self.host)

    class Meta:
        db_table = 'resources_zabbix_cache'
