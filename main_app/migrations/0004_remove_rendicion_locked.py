# -*- coding: utf-8 -*-
# Generated by Django 1.10.4 on 2017-01-26 12:47
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main_app', '0003_auto_20170126_1245'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='rendicion',
            name='locked',
        ),
    ]
