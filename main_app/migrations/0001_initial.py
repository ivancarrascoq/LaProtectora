# -*- coding: utf-8 -*-
# Generated by Django 1.10.4 on 2017-01-26 12:38
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Categoria',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(blank=True, max_length=100, null=True)),
                ('nombre', models.CharField(blank=True, max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='CentroCosto',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=100, null=True)),
                ('rbd', models.CharField(blank=True, max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Contabilidad',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='ContabilidadHijo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=100, null=True)),
                ('contabilidad', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.Contabilidad')),
            ],
        ),
        migrations.CreateModel(
            name='DocTipo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sigla', models.CharField(blank=True, max_length=100, null=True)),
                ('nombre', models.CharField(blank=True, max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='FondoDetalle',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cheque', models.CharField(blank=True, max_length=100, null=True)),
                ('doc_no', models.CharField(blank=True, max_length=100, null=True)),
                ('doc_fecha', models.DateTimeField()),
                ('doc_fecha_pago', models.DateTimeField()),
                ('doc_detalle', models.CharField(blank=True, max_length=100, null=True)),
                ('proveedor_nombre', models.CharField(blank=True, max_length=100, null=True)),
                ('proveedor_rut', models.CharField(blank=True, max_length=100, null=True)),
                ('doc_monto', models.IntegerField(blank=True, null=True)),
                ('gasto', models.IntegerField(blank=True, null=True)),
                ('categoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.Categoria')),
                ('contabilidad', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.Contabilidad')),
                ('contabilidadhijo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.ContabilidadHijo')),
                ('doc_tipo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.DocTipo')),
            ],
        ),
        migrations.CreateModel(
            name='GastoDetalle',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('detalle', models.CharField(blank=True, max_length=100, null=True)),
                ('deposito_no', models.CharField(blank=True, max_length=100, null=True)),
                ('fecha', models.DateTimeField()),
                ('monto', models.IntegerField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Proveedor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=100, null=True)),
                ('rut', models.CharField(blank=True, max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Rendicion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha_subida', models.DateTimeField()),
                ('mes_gasto', models.CharField(blank=True, max_length=100, null=True)),
                ('monto', models.IntegerField(blank=True, null=True)),
                ('centro_costo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.CentroCosto')),
            ],
        ),
        migrations.CreateModel(
            name='RendicionesFondosDetalles',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fondos_detalles', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.FondoDetalle')),
                ('rendicion', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.Rendicion')),
            ],
        ),
        migrations.CreateModel(
            name='RendicionesGastoDetalles',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('gastos_detalles', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.GastoDetalle')),
                ('rendicion', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.Rendicion')),
            ],
        ),
        migrations.CreateModel(
            name='Subcategoria',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(blank=True, max_length=100, null=True)),
                ('nombre', models.CharField(blank=True, max_length=100, null=True)),
                ('categoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.Categoria')),
            ],
        ),
        migrations.CreateModel(
            name='Subvencion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='TipoFondo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='TipoFormaPago',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=100, null=True)),
                ('area', models.CharField(blank=True, max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='UsersCentroCostos',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('centro_costo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.CentroCosto')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='rendicion',
            name='subvencion',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.Subvencion'),
        ),
        migrations.AddField(
            model_name='rendicion',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='fondodetalle',
            name='proveedor',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.Proveedor'),
        ),
        migrations.AddField(
            model_name='fondodetalle',
            name='subcategoria',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.Subcategoria'),
        ),
        migrations.AddField(
            model_name='categoria',
            name='subvencion',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main_app.Subvencion'),
        ),
    ]
