# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0019_profile_name'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='server',
            options={'permissions': (('view_server', '\u8bbf\u95ee\u670d\u52a1\u5668\u4fe1\u606f'),)},
        ),
    ]
