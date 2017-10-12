from django.contrib import admin

# Register your models here.
from models import *

modelos = [
#User,
Subvencion,Categoria,Subcategoria,Contabilidad,ContabilidadHijo,CentroCosto,UsersCentroCostos,TipoFondo,Proveedor,TipoFormaPago,DocTipo,Rendicion,RendicionesGastoDetalles,RendicionesFondosDetalles,GastoDetalle,FondoDetalle]

admin.site.register(modelos)
