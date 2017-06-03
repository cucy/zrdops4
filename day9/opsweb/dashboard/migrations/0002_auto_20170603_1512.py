# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='productserver',
            name='product',
        ),
        migrations.RemoveField(
            model_name='productserver',
            name='server',
        ),
        migrations.AddField(
            model_name='product',
            name='p_to_server',
            field=models.ManyToManyField(to='dashboard.Server', verbose_name='\u5173\u8054\u8d44\u4ea7'),
        ),
        migrations.DeleteModel(
            name='ProductServer',
        ),
    ]
