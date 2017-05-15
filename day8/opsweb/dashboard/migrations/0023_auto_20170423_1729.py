# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0022_auto_20170423_1728'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='server',
            name='idc',
        ),
        migrations.DeleteModel(
            name='Server',
        ),
    ]
