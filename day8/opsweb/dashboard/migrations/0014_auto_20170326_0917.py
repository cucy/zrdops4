# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0013_auto_20170326_0916'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='department',
            field=models.ForeignKey(default=1, to='dashboard.Department'),
        ),
    ]
