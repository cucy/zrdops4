# coding:utf-8

from django.db import models
from django.contrib.auth.models import User


# Create your models here.


class Idc(models.Model):
    """ IDC 表 """
    name = models.CharField("idc 字母简称", max_length=10)
    idc_name = models.CharField("idc 中文名", max_length=30)
    address = models.CharField("具体地址, 云厂商可以不填", max_length=255, null=True)
    phone = models.CharField("联系电话", max_length=15, null=True)
    email = models.EmailField("联系邮件地址", max_length=255, null=True)
    username = models.CharField("联系人姓名", max_length=50, null=True)
    user_phone = models.CharField("联系人电话", max_length=20, null=True)
    rel_cabinet_num = models.IntegerField("实际机柜数", null=True)
    pact_cabinet_num = models.IntegerField("合同机柜数", null=True)

    class Meta:
        db_table = "resources_idc"


class Product(models.Model):
    """业务线表"""
    service_name = models.CharField(verbose_name="业务线名字，可以是中文", max_length=32)
    pid = models.IntegerField(verbose_name="上级业务线", db_index=True)
    module_letter = models.CharField("该业务线字母简称", max_length=32)
    dev_interface = models.CharField("业务负责人", max_length=100, null=True)
    op_interface = models.CharField("运维负责人", max_length=100, null=True)

    def __str__(self):
        return self.service_name

    class Meta:
        db_table = "resources_product"


class Status(models.Model):
    """
        状态信息表
    """
    name = models.CharField(max_length=100, unique=True, db_index=True)

    def __str__(self):
        return self.name


    class Meta:
        db_table = 'resources_status'



class Server(models.Model):
    """服务器表"""
    supplier = models.IntegerField(null=True, verbose_name='供应商')
    manufacturers = models.CharField(max_length=50, null=True, verbose_name='制造商')
    manufacture_date = models.DateField(null=True)
    server_type = models.CharField(max_length=20, null=True)
    sn = models.CharField(max_length=60, db_index=True, null=True)
    idc = models.ForeignKey(Idc, null=True)
    os = models.CharField(max_length=50, null=True)
    hostname = models.CharField(max_length=50, db_index=True, null=True, verbose_name='主机名')
    inner_ip = models.CharField(max_length=32, null=True, unique=True)
    mac_address = models.CharField(max_length=50, null=True)
    ip_info = models.CharField(max_length=255, null=True)
    server_cpu = models.CharField(max_length=250, null=True)
    server_disk = models.CharField(max_length=100, null=True)
    server_mem = models.CharField(max_length=100, null=True)
    status = models.ForeignKey(Status, verbose_name='状态')
    remark = models.TextField(null=True)
    service_id = models.IntegerField(db_index=True, null=True, verbose_name="业务线")
    server_purpose = models.ForeignKey(Product, null=True, verbose_name='产品线')
    check_update_time = models.DateTimeField(null=True)
    vm_status = models.IntegerField(db_index=True, null=True)
    uuid = models.CharField(max_length=100, db_index=True, null=True)

    @property
    def all_status(self):
        return Status.objects.all()

    def __str__(self):
        return self.hostname

    class Meta:
        db_table = 'resources_server'
        ordering = ['id']




class ZabbixHost(models.Model):
    server = models.OneToOneField(Server, null=True)
    hostid = models.IntegerField(db_index=True, null=True)
    host = models.CharField(max_length=50, db_index=True, null=True)
    ip = models.CharField(max_length=50, db_index=True, null=True)
    updatetime = models.DateTimeField(auto_now=True)

    def __str__(self):
        return "{} {}".format(self.hostid, self.host)

    class Meta:
        db_table = 'resources_zabbix_cache'
