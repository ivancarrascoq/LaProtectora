from __future__ import unicode_literals

from django.db import models

from django.contrib.auth.models import User

# Create your models here.

#class User(models.Model):
#    nombre = models.CharField(max_length=100, blank=True, null=True)
#    password = models.CharField(max_length=100, blank=True, null=True)
#    admin = models.IntegerField()
#    created_at = models.DateTimeField(auto_now_add=True)
#    updated_at = models.DateTimeField(auto_now=True)
#    def __str__(self):
#        return self.nombre
    
class Subvencion(models.Model):
    nombre = models.CharField(max_length=100, blank=True, null=True)
    
class Categoria(models.Model):
    code = models.CharField(max_length=100, blank=True, null=True)
    nombre = models.CharField(max_length=100, blank=True, null=True)
    #subvencion_id = models.IntegerField(blank=True, null=True)
    subvencion = models.ForeignKey(Subvencion)#, blank=True, null=True)
    
class Subcategoria(models.Model):
    code = models.CharField(max_length=100, blank=True, null=True)
    nombre = models.CharField(max_length=100, blank=True, null=True)
    #categoria_id = models.IntegerField(blank=True, null=True)
    categoria = models.ForeignKey(Categoria)

class Contabilidad(models.Model):
    nombre = models.CharField(max_length=100, blank=True, null=True)
    
class ContabilidadHijo(models.Model):
    nombre = models.CharField(max_length=100, blank=True, null=True)
    #contabilidad_id = models.IntegerField(blank=True, null=True)
    contabilidad = models.ForeignKey(Contabilidad)

class CentroCosto(models.Model):
    nombre = models.CharField(max_length=100, blank=True, null=True)
    rbd = models.CharField(max_length=100, blank=True, null=True)
    
class UsersCentroCostos(models.Model):
    user = models.ForeignKey(User)
    #centro_costo_id = models.IntegerField(blank=True, null=True)
    centro_costo = models.ForeignKey(CentroCosto)

class TipoFondo(models.Model):
    nombre = models.CharField(max_length=100, blank=True, null=True)
    
class Proveedor(models.Model):
    nombre = models.CharField(max_length=100, blank=True, null=True)
    rut = models.CharField(max_length=100, blank=True, null=True)
    
class TipoFormaPago(models.Model):
    nombre = models.CharField(max_length=100, blank=True, null=True)
    area = models.CharField(max_length=100, blank=True, null=True)
    
class DocTipo(models.Model):
    sigla = models.CharField(max_length=100, blank=True, null=True)
    nombre = models.CharField(max_length=100, blank=True, null=True)
    
class Rendicion(models.Model):
    user = models.ForeignKey(User)
    fecha_subida = models.DateTimeField()
    #centro_costo_id = models.IntegerField(blank=True, null=True)
    centro_costo = models.ForeignKey(CentroCosto)
    #subvencion_id = models.IntegerField(blank=True, null=True)
    subvencion = models.ForeignKey(Subvencion)
    tipo_fondo = models.ForeignKey(TipoFondo)
    mes_gasto = models.CharField(max_length=100, blank=True, null=True)
    monto = models.IntegerField(blank=True, null=True)
    locked = models.IntegerField(blank=True, null=True)


class GastoDetalle(models.Model):
    detalle = models.CharField(max_length=100, blank=True, null=True)
    deposito_no = models.CharField(max_length=100, blank=True, null=True)
    fecha = models.DateTimeField()
    monto = models.IntegerField(blank=True, null=True)   

class RendicionesGastoDetalles(models.Model):
    #rendicion_id = models.IntegerField(blank=True, null=True)
    rendicion = models.ForeignKey(Rendicion)
    #gastos_detalles_id = models.IntegerField(blank=True, null=True)
    gastos_detalles = models.ForeignKey(GastoDetalle)
    
class FondoDetalle(models.Model):
    cheque = models.CharField(max_length=100, blank=True, null=True)
    #categoria_id = models.IntegerField(blank=True, null=True)
    categoria = models.ForeignKey(Categoria)
    #subcategoria_id = models.IntegerField(blank=True, null=True)
    subcategoria = models.ForeignKey(Subcategoria)
    #doc_tipo_id = models.IntegerField(blank=True, null=True)
    doc_tipo = models.ForeignKey(DocTipo)
    doc_no = models.CharField(max_length=100, blank=True, null=True)
    doc_no_cheque = models.CharField(max_length=100, blank=True, null=True)
    doc_fecha = models.DateTimeField()
    doc_fecha_pago = models.DateTimeField()
    doc_detalle = models.CharField(max_length=100, blank=True, null=True)
    #proveedor_id = models.IntegerField(blank=True, null=True)
    proveedor = models.ForeignKey(Proveedor)
    proveedor_nombre = models.CharField(max_length=100, blank=True, null=True)
    proveedor_rut = models.CharField(max_length=100, blank=True, null=True)
    doc_monto = models.IntegerField(blank=True, null=True)
    gasto = models.IntegerField(blank=True, null=True)
    #contabilidad_id = models.IntegerField(blank=True, null=True)
    contabilidad = models.ForeignKey(Contabilidad)
    #contabilidad_hijo_id = models.IntegerField(blank=True, null=True)
    contabilidad_hijo = models.ForeignKey(ContabilidadHijo)

class RendicionesFondosDetalles(models.Model):
    #rendicion_id = models.IntegerField(blank=True, null=True)
    rendicion = models.ForeignKey(Rendicion)
    #fondos_detalles_id = models.IntegerField(blank=True, null=True)
    fondos_detalles = models.ForeignKey(FondoDetalle)
