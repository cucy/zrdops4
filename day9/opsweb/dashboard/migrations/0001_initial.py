# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Department',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=11, null=True)),
            ],
            options={
                'db_table': 'department',
            },
        ),
        migrations.CreateModel(
            name='IDC',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(unique=True, max_length=10, verbose_name='idc\u5b57\u6bcd\u7b80\u79f0')),
                ('idc_name', models.CharField(max_length=128, verbose_name='\u4e2d\u6587\u540d')),
                ('address', models.CharField(max_length=128, verbose_name='\u673a\u623fIP\u5730\u5740')),
                ('user', models.CharField(max_length=32, verbose_name='\u673a\u623f\u8054\u7cfb\u4eba')),
                ('user_phone', models.CharField(max_length=20, verbose_name='\u673a\u623f\u8054\u7cfb\u7535\u8bdd')),
                ('user_email', models.EmailField(max_length=32, verbose_name='\u673a\u623f\u8054\u7cfb\u4eba\u90ae\u7bb1\u5730\u5740')),
            ],
            options={
                'db_table': 'idc',
                'permissions': (('view_idc', '\u8bbf\u95eeidc\u5217\u8868'),),
            },
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(unique=True, max_length=32, verbose_name='\u4e1a\u52a1\u7ebf')),
                ('module_letter', models.CharField(max_length=10, verbose_name='\u5b57\u6bcd\u7b80\u79f0')),
                ('op_interface', models.CharField(max_length=255, verbose_name='\u8fd0\u7ef4\u8d1f\u8d23\u4eba: username1,username2')),
                ('dev_interface', models.CharField(max_length=255, verbose_name='\u4e1a\u52a1\u8d1f\u8d23\u4eba: username1,username2')),
                ('p_product', models.ForeignKey(verbose_name='\u4e0a\u4e00\u7ea7\u4e1a\u52a1\u7ebf', to='dashboard.Product', null=True)),
            ],
            options={
                'db_table': 'product',
                'permissions': (('view_product', '\u7ba1\u7406\u4e1a\u52a1\u7ebf'),),
            },
        ),
        migrations.CreateModel(
            name='ProductServer',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('product', models.ForeignKey(to='dashboard.Product')),
            ],
            options={
                'db_table': 'server_product',
                'permissions': (('view_server_product', '\u4e1a\u52a1\u7ebf\u548c\u4e3b\u673a\u8d44\u4ea7\u67e5\u770b'),),
            },
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('phone', models.CharField(max_length=11, null=True)),
                ('title', models.CharField(max_length=32, null=True)),
                ('chinaname', models.CharField(default=b'', max_length=32, null=True)),
                ('department', models.ForeignKey(to='dashboard.Department', null=True)),
                ('user', models.OneToOneField(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'user_profile',
                'default_related_name': 'profile',
            },
        ),
        migrations.CreateModel(
            name='Server',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('supplier', models.IntegerField(null=True)),
                ('manufacturers', models.CharField(max_length=50, null=True)),
                ('manufacture_date', models.DateField(null=True)),
                ('server_type', models.CharField(max_length=20, null=True)),
                ('sn', models.CharField(max_length=60, null=True, db_index=True)),
                ('os', models.CharField(max_length=50, null=True)),
                ('hostname', models.CharField(max_length=50, null=True, db_index=True)),
                ('inner_ip', models.CharField(max_length=32, unique=True, null=True)),
                ('mac_address', models.CharField(max_length=50, null=True)),
                ('ip_info', models.CharField(max_length=255, null=True)),
                ('server_cpu', models.CharField(max_length=250, null=True)),
                ('server_disk', models.CharField(max_length=100, null=True)),
                ('server_mem', models.CharField(max_length=100, null=True)),
                ('status', models.CharField(max_length=100, null=True, db_index=True)),
                ('remark', models.TextField(null=True)),
                ('check_update_time', models.DateTimeField(null=True)),
                ('vm_status', models.IntegerField(null=True, db_index=True)),
                ('uuid', models.CharField(max_length=100, null=True, db_index=True)),
                ('idc', models.ForeignKey(to='dashboard.IDC', null=True)),
            ],
            options={
                'db_table': 'server',
                'permissions': (('view_server', '\u8bbf\u95ee\u670d\u52a1\u5668\u4fe1\u606f'),),
            },
        ),
        migrations.CreateModel(
            name='Status',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(unique=True, max_length=32, verbose_name='\u72b6\u6001')),
            ],
            options={
                'db_table': 'status',
            },
        ),
        migrations.AddField(
            model_name='productserver',
            name='server',
            field=models.ForeignKey(to='dashboard.Server'),
        ),
    ]
