# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0003_auto_20170414_1737'),
    ]

    operations = [
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
    ]
