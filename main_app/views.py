from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponse

from .models import *
from .forms import LoginForm, EditForm
from django.contrib.auth import authenticate, login, logout
 
import datetime
import numpy as np
import json 
import unicodecsv as csv
#import csv
import xlwt

from django.http import JsonResponse
from django.forms.models import model_to_dict
from django.db.models import Sum, Count

#upload
from django.core.files.storage import FileSystemStorage
import glob
import os

#WizardForm
#from formtools.wizard.views import SessionWizardView
#import logging


# Create your views here.

def index(request):
    user = request.user
    auth = request.user.is_authenticated()
    if auth == False:
        return HttpResponseRedirect('/login')     
    if user.is_superuser:
      try:
        filtro = user.username.split('@')[1]
      except:
        filtro = ''
      filtro_users = User.objects.all().filter(username__contains = filtro)
      rendicion = Rendicion.objects.filter(user_id__in = filtro_users).order_by('-id').filter(locked = 0)[:100]
      #rendicion = Rendicion.objects.all().order_by('user_id').filter(locked = 0)[:100]
      rendicion_c = Rendicion.objects.filter(user_id__in = filtro_users).order_by('-id').filter(locked = 1)[:100]
      #rendicion_c = Rendicion.objects.all().order_by('user_id').filter(locked = 1)[:100]
      subvencion = Subvencion.objects.all()
      #if user.id == 1:
      if user.username == 'admin':
        centrocosto = CentroCosto.objects.all()
        #centrocosto = UsersCentroCostos.objects.select_related('user','centro_costo').filter(user_id = user.id)
      else:
        centrocosto = UsersCentroCostos.objects.select_related('user','centro_costo').filter(user_id = user.id)
    else:
      rendicion = Rendicion.objects.filter(user_id = user.id, locked = 0).order_by('-id')[:20]
      rendicion_c = Rendicion.objects.filter(user_id = user.id, locked = 1).order_by('-id')[:20]
    #auth = request.user.is_authenticated()

#    for j in context:
    print auth
    print "usuario: " + str(user.id)
    if user.is_superuser:
      return render(request, 'index.html', {'context': rendicion, 'r_close': rendicion_c, 'auth':auth, 'subvencion': subvencion, 'centrocosto': centrocosto, })
    else:
      return render(request, 'index.html', {'context': rendicion, 'auth':auth, 'r_close': rendicion_c})

def profile(request, username):
    user = User.objects.get(username=username)
    print user.id
    rendicion = Rendicion.objects.filter(user=user)
    return render(request, 'profile.html', {'username': username, 'rendicion': rendicion})

def detail(request):
    return render(request, 'index.html')

def edit(request, rid):
    print 'Edit.html'
    user = request.user

    if user.is_superuser == True:
      try:
        filtro = user.username.split('@')[1]
      except:
        filtro = ''
      filtro_users = User.objects.all().filter(username__contains = filtro)
      filtro_rendicion = Rendicion.objects.filter(user_id__in = filtro_users, id = rid, locked = 0)
      if filtro_rendicion.exists():
        print filtro_rendicion
      else:
        return HttpResponseRedirect('/')    
    else:
    #if user.is_superuser == False:
      if (Rendicion.objects.filter(id = rid,user_id = user.id).exists() == False) or Rendicion.objects.filter(id = rid).first().locked == 1:
        return HttpResponseRedirect('/')

    #centrocosto = CentroCosto.objects.all()
    centrocosto = UsersCentroCostos.objects.select_related('user','centro_costo').filter(user_id = user.id)
    #print centrocosto.first().centro_costo.nombre
    mes = ['enero','febrero','marzo','abril','mayo','junio','julio','agosto','septiembre','octubre','noviembre','diciembre']
    tipofondo = TipoFondo.objects.all()
    subvencion = Subvencion.objects.all()
    cheque = [['0','Efectivo'],['1','Cheque'],['2','']]
    #cheque = [['0','Efectivo'],['1','Cheque']]
    doctipo = DocTipo.objects.all()
    contabilidad = Contabilidad.objects.all()
    rall = Rendicion.objects.filter(user_id = user.id, locked = 0).order_by('-id')[:20]
    rid = Rendicion.objects.get(pk=rid)
    categoria = Categoria.objects.filter(subvencion_id = rid.subvencion_id)
    #fondo
    rfd = RendicionesFondosDetalles.objects.filter(rendicion_id = rid)
    rfd_count = rfd.count()
    rfd_array = list()#range(rfd_count))
    subcat_tuples = ()
    conhijo_tuples = ()
    for j in rfd:##        print 'RFD '+str(j.id)+' fondo_id: '+str(j.fondos_detalles_id)+', rendicion id: '+str(j.rendicion_id)
      #rfd_array.append(FondoDetalle.objects.select_related('doc_tipo','proveedor','contabilidad', 'contabilidad_hijo','categoria','subcategoria').filter(id = int(j.fondos_detalles_id)))
      rfd_array.append(
        list(FondoDetalle.objects.select_related('doc_tipo','proveedor','contabilidad', 'contabilidad_hijo','categoria','subcategoria').filter(id = int(j.fondos_detalles_id)).values()  )
      )
      #     print 'test',FondoDetalle.objects.select_related('doc_tipo','proveedor','contabilidad', 'contabilidad_hijo','categoria','subcategoria').filter(j.fondos_detalles_id)
      #        rfd_array.append(FondoDetalle.objects.select_related('doc_tipo').select_related('proveedor').#        select_related('contabilidad').select_related('contabilidad_hijo').#        select_related('categoria').select_related('subcategoria').#        filter(id = int(j.fondos_detalles_id)))##    print rfd_array##    print "for in array"#    for a in rfd_array:#        print a[0]    #gasto: devolucion
      subcat_tuples = subcat_tuples + (rfd_array[-1][0]['subcategoria_id'],)
      conhijo_tuples = conhijo_tuples + (rfd_array[-1][0]['contabilidad_hijo_id'],)
    #print rfd_array
    #print 'lista: ', type(rfd_array) #to delete
    #restricciones para cerrar rendicion
    close_rid = 0
    close_rid_f = 0
    close_rid_g = 0
    fdid = RendicionesFondosDetalles.objects.filter(rendicion_id = rid).values_list('fondos_detalles_id')
    consolidado = FondoDetalle.objects.filter(id__in = fdid).select_related('contabilidad','contabilidad_hijo').order_by('contabilidad_id', 'contabilidad_hijo_id')
    gdid = RendicionesGastoDetalles.objects.filter(rendicion_id = rid).values_list('gastos_detalles_id')
    consolidadog = GastoDetalle.objects.filter(id__in = gdid)
    #print list(consolidadog.values())

    if rid.monto:
      total_rendir = rid.monto
      #print 'monto ok'
    if FondoDetalle.objects.filter(id__in = fdid).values_list('gasto').aggregate(suma = Sum('gasto'))['suma']:
      sum_fondos = FondoDetalle.objects.filter(id__in = fdid).values_list('gasto').aggregate(suma = Sum('gasto'))['suma']
      #print 'fondos ok'
    else:
      sum_fondos = 0
      #print 'NO fondo'
    if GastoDetalle.objects.filter(id__in = gdid).values_list('monto').aggregate(suma = Sum('monto'))['suma']:
      sum_gastos = GastoDetalle.objects.filter(id__in = gdid).values_list('monto').aggregate(suma = Sum('monto'))['suma']
      #print 'gastos ok'
    else:
      sum_gastos = 0
      #print 'NO gasto'
    try:
      resultado = total_rendir - sum_fondos - sum_gastos
    except:
      resultado = -1
    #print 'resultado: ' + str(resultado)
    #print 'total_rendir'
    #print total_rendir
    #print 'sum_fondos'
    #print sum_fondos
    #print 'sum_gastos'
    #print sum_gastos
    #print 'resultado'
    #print resultado

    if consolidado.exists():
      for i in list(consolidado.values()):
        for j in i:
          if (i[j] is None or i[j] == '' or i['cheque'] == '2') and j != 'doc_no_cheque':
              #'vacio'
              close_rid_f = 0
              break
          else:
              #'lleno f'
              close_rid_f = 1
    else:
      close_rid_f = 2
    #print close_rid_f

    if consolidadog.exists():
      for i2 in list(consolidadog.values()):
        for j2 in i2:
          if (i2[j2] is None or i2[j2] == ''):
              #"vacio"
              close_rid_g = 0
              break
          else:
              #"lleno"
              close_rid_g = 1
    else:
      close_rid_g = 2
    #print close_rid_g

    if (resultado == 0) and ((close_rid_g == 1 and close_rid_f == 1) or (close_rid_f == 1 and close_rid_g == 2) or (close_rid_f == 2 and close_rid_g == 1) ):
        close_rid = '1'
    else:
        close_rid = '0'
    #print close_rid

    rgd = RendicionesGastoDetalles.objects.filter(rendicion_id = rid)
    rgd_count = rgd.count()
    rgd_array = list()
    for j in rgd:
    ##        print 'RGD '+str(j.id)+' gasto_id: '+str(j.gastos_detalles_id)+', rendicion id: '+str(j.rendicion_id)
      rgd_array.append(GastoDetalle.objects.filter(id = int(j.gastos_detalles_id)))
    ##    print rgd_array##    print "for in array"
    #    for a in rgd_array:
    #        print a[0]

    xrendir = 0
    ##    xrendir = rid.monto
    sum_gasto = 0
    sum_dev = 0
    for x in rfd.select_related('fondos_detalles'):
        try:
            sum_gasto += x.fondos_detalles.gasto
        except:
            sum_gasto = 0
    ##    print "sum gasto " + str(sum_gasto)
    for x in rgd.select_related('gastos_detalles'):
        try:
            sum_dev += x.gastos_detalles.monto
        except:
            sum_dev = 0
    ##    print "sum dev " + str(sum_dev)
    xrendir = rid.monto - sum_gasto - sum_dev
    proveedores = Proveedor.objects.all().order_by('nombre')
    #print 'proveedores',proveedores

    #fechas limites inferiores
    one_month = datetime.timedelta(30)
    two_month = datetime.timedelta(60)
    now = datetime.date.today()
    date_low_limit = (now - one_month).strftime("%Y-%m-%d")
    date_low_month = (now - one_month).strftime("%m")
    if now.month == 12:
      mes = mes['noviembre','diciembre','enero']
    elif now.month == 1:
      mes = ['diciembre','enero','febrero']
    else:
      mes = mes[int(date_low_month)-3:int(date_low_month)+2]
    #mes = mes[int(date_low_month)-1:]
    min_fecha_doc = (rid.fecha_subida - two_month).strftime("%Y-%m-%d")
    #print subcat_tuples
    subcat_tuples2 = list(Subcategoria.objects.filter(id__in = subcat_tuples))
    conhijo_tuples2 = list(ContabilidadHijo.objects.filter(id__in = conhijo_tuples)) 
    print conhijo_tuples2
    return render(request, 'edit.html', {'centrocosto': centrocosto, 'mes': mes, 'tipofondo': tipofondo, 
    'subvencion': subvencion, 'rid': rid, 'rall':rall, 'rfd_array': rfd_array, 'rgd_array': rgd_array,
    'cheque': cheque, 'doctipo': doctipo, 'contabilidad': contabilidad, 'categoria': categoria,
    'xrendir': xrendir, 'close_rid': close_rid, 'proveedores': proveedores, 'min': date_low_limit, 'min_fecha_doc': min_fecha_doc, 'subcategoria': subcat_tuples2, 'conta_hijo': conhijo_tuples2 })

def addfd(request):
    print 'Add FD:'
    rid = request.GET['rid']
    print rid
    print 'crear fd'
    fd = FondoDetalle.objects.create(categoria_id = '55', contabilidad_id = '24', contabilidad_hijo_id = '57',
         doc_tipo_id = '19', proveedor_id = '3', subcategoria_id = '234')
    fd_id = str(fd.id)
    print 'FondoDetalle.id: ' + str(fd_id)
    rfd = RendicionesFondosDetalles.objects.create(fondos_detalles_id = fd_id,rendicion_id = rid)
#    return HttpResponse(0)
    return HttpResponseRedirect('/rendicion/'+rid)

def addfdjs(request): 
    print 'Add FD:'
    rid = request.GET['rid']
    print rid          
    print 'crear fd' 
    new_date = Rendicion.objects.get(id = rid).fecha_subida.replace(day=1)
    print new_date
    fd = FondoDetalle.objects.create(cheque = 2, categoria_id = 55, contabilidad_id = 24, contabilidad_hijo_id = 57,
         doc_tipo_id = '19', proveedor_id = '1000', proveedor_nombre = '-', proveedor_rut = '-', subcategoria_id = 234, doc_fecha = new_date,
         doc_fecha_pago = new_date, doc_monto = 0, gasto = 0)
    fd_id = str(fd.id)
    print 'FondoDetalle.id: ' + str(fd_id)
    rfd = RendicionesFondosDetalles.objects.create(fondos_detalles_id = fd_id,rendicion_id = rid)
    return HttpResponse(fd_id)

def delfd(request):
    print 'Del FD:'
    rid = request.GET['rid']
    fd_id = request.GET['fd_id']
#    print rid
    print 'borrar registro: rid' + str(rid) + ', fd: ' + str(fd_id)
    FondoDetalle.objects.filter(id = fd_id).delete()
    RendicionesFondosDetalles.objects.filter(rendicion_id = rid, fondos_detalles_id = fd_id).delete()
#    return HttpResponseRedirect('/rendicion/'+rid)
    return HttpResponse(0)

def addgd(request):
    print 'Add GD:'
    rid = request.GET['rid']
    print rid
    print 'crear gd'
    gd = GastoDetalle.objects.create(fecha = '2017-01-01', monto = 0)
    gd_id = str(gd.id)
    print 'GastoDetalle.id: ' + str(gd_id)
    rfd = RendicionesGastoDetalles.objects.create(gastos_detalles_id = gd_id,rendicion_id = rid)
#    return HttpResponseRedirect('/rendicion/'+rid)
    return HttpResponse(0)

def addgdjs(request):
    print 'Add GD:'
    rid = request.GET['rid']
    print rid
    print 'crear gd'
    gd = GastoDetalle.objects.create(fecha = '2017-01-01', monto = 0)
    gd_id = str(gd.id)
    print 'GastoDetalle.id: ' + str(gd_id)
    rgd = RendicionesGastoDetalles.objects.create(gastos_detalles_id = gd_id,rendicion_id = rid)
    return HttpResponse(gd_id)

def delgd(request):
    print 'Del GD:'
    rid = request.GET['rid']
    gd_id = request.GET['gd_id']    
    print 'borrar registro: rid' + str(rid) + ', gd: ' + str(gd_id)
    GastoDetalle.objects.filter(id = gd_id).delete()
    RendicionesGastoDetalles.objects.filter(rendicion_id = rid, gastos_detalles_id = gd_id).delete()
    return HttpResponseRedirect('/rendicion/'+rid)

def new(request):
    print 'New.html'
    user = request.user
    #rendicion = Rendicion.objects.all()
    #centrocosto = CentroCosto.objects.all()
    centrocosto = UsersCentroCostos.objects.select_related('user','centro_costo').filter(user_id = user.id)
    mes = ['enero','febrero','marzo','abril','mayo','junio','julio','agosto','septiembre','octubre','noviembre','diciembre']
    #print mes[11]
    tipofondo = TipoFondo.objects.all()
    subvencion = Subvencion.objects.all()

    one_month = datetime.timedelta(30)
    #now = datetime.date.now().strftime("%Y-%m-%d") 
    now = datetime.date.today()#.strftime("%Y-%m-%d")
    date_low_limit = (now - one_month).strftime("%Y-%m-%d")
    date_low_month = (now - one_month).strftime("%m")
    if now.month == 12:
      mes = mes['noviembre','diciembre','enero']
    elif now.month == 1:
      mes = ['diciembre','enero','febrero']
    else:
      mes = mes[int(date_low_month)-3:int(date_low_month)+2]

    return render(request, 'new.html', {'centrocosto': centrocosto, 'mes': mes, 'tipofondo': tipofondo, 'subvencion': subvencion, 'min': date_low_limit })



def login_view(request):
#    print 'login_view'
    if request.method == 'POST':
#        print 'if post'
        form = LoginForm(request.POST)
        if form.is_valid():
            u = form.cleaned_data
            p = form.cleaned_data
#            print u['username']
            user = authenticate(username = u['username'], password = p['password'])
            print user
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return HttpResponseRedirect('/')
                else:
                    print("Esta cuenta esta deshabilitada") #consola por ahora
            else:
                print("El usuario o/y contrasena estan incorrectas")
                return HttpResponseRedirect('/')
    else:
#        print 'else...'
        form = LoginForm()
        return render(request, 'login.html', {'form':form})

def logout_view(request):
    logout(request)
    return HttpResponseRedirect('/')


def post_rendicion(request):
    form = request.POST
    print form 
    a = int(form['user_id'])
    b = datetime.datetime.strptime(str(form['fecharendicion']), '%Y-%m-%d')
#, '%d/%m/%Y').strftime('%Y-%m-%d')
#    b = datetime.datetime.strptime(str(form['fecharendicion']), '%Y-%m-%d')
    c = str(form['mes_gasto'])
    d = int(form['monto'])
    e = int(form['centro_costo'])
    f = int(form['subvencion'])
    g = int(form['tipo_fondo'])
    print "fecha", b
    rendicion = Rendicion( user_id = a, fecha_subida = b, mes_gasto = c, monto = d, centro_costo_id = e, subvencion_id = f, tipo_fondo_id =  g, locked = 0)
    print rendicion
    rendicion.save()
    rid = str(rendicion.id)
#    print "rendicion: ", rendicion.id
#    return HttpResponseRedirect('/') 
    return HttpResponseRedirect('rendicion/' + rid )


def save_rendicion(request):
    form = request.POST
    rid =  form['rid']
    #print 'Rendicion: ' + str(rid)
    #print '===== SAVE Rendicion ====='
    #print form
    #print '--------values()--------'
    form = dict(form.iterlists())
    
    for i in form:
        try:
	    i = int(i)
#seccion II
            if type(i) == int and i > 0:
#                print 'ID fondos - seccion II: ' + str(i)
                #print form[str(i)]
                #print 'registro',i,':', form[str(i)]#[10]
#                print '########cheque###########' + form[str(i)][0]
                FondoDetalle.objects.filter(id = i).update(
                 categoria_id = form[str(i)][0],
                 subcategoria_id = form[str(i)][1],
                 cheque = int(form[str(i)][2]),
                 doc_no_cheque = form[str(i)][3],
                 doc_tipo_id = form[str(i)][4],
                 doc_no = form[str(i)][5],
                 doc_fecha = form[str(i)][6], 
                 doc_fecha_pago = form[str(i)][7],
                 doc_detalle = form[str(i)][8],
                 proveedor_rut = form[str(i)][9],
                 proveedor_nombre = form[str(i)][10],
                 #proveedor_nombre = Proveedor.objects.get(id=(form[str(i)][10].split("|")[0])).nombre,
                 #proveedor_id = form[str(i)][10].split("|")[0],
                 proveedor_id = Proveedor.objects.filter(rut = form[str(i)][9]).first().id,
                 #
                 gasto = form[str(i)][12],
                 doc_monto = form[str(i)][11],
                 contabilidad_id = form[str(i)][13],
                 contabilidad_hijo_id = form[str(i)][14],
#                 categoria_id = form[str(i)][13],
#                 subcategoria_id = form[str(i)][14],
                )
            else:
#seccion I
#                print 'ID general - seccion I: ' + str(i)
#                if form[str(i)][5] == '' or form[str(i)][5] == None:
#                  r_monto = 
                Rendicion.objects.filter(id=rid).update(
                 fecha_subida = form[str(i)][2],
                 mes_gasto = form[str(i)][1],
                 monto = form[str(i)][5],
                 centro_costo_id = form[str(i)][0],
                 subvencion_id = form[str(i)][4],
                 tipo_fondo_id = form[str(i)][3],
                )
        except:
#seccion III
            i = str(i)
            if i.startswith('g'):
                j = i[1:]
#                print 'ID gastos - seccion III: ' + j
#                print form[i] 
                if form[i][3]:
                  monto = form[i][3]
                else:
                  monto = 0
                GastoDetalle.objects.filter(id=j).update(
                 detalle = form[i][0],
                 deposito_no = form[i][1],
                 fecha = form[i][2],
                 monto = monto,
                )
            pass
    return HttpResponseRedirect('rendicion/' + rid)

def jscontahijo(request):
    contaid = request.GET['contaid']
#    print 'jscontahijo, conta id: ' + str(contaid)
    contahijo = list(ContabilidadHijo.objects.filter(contabilidad_id = contaid).values('nombre', 'id'))
    return HttpResponse(json.dumps(contahijo),content_type="application/json")

def jssubcat(request):
    catid = request.GET['catid']
    #print catid
    subcat = list(Subcategoria.objects.filter(categoria_id = catid).values('nombre', 'id'))
    #print subcat
    return HttpResponse(json.dumps(subcat),content_type="application/json")

def post_upload(request):
    if request.method == 'POST' and request.FILES['myfile']:
      myfile = request.FILES['myfile']
      form = request.POST
      rid = form['rid']
      if glob.glob('media/' + rid + '.*'):
        os.remove(glob.glob('media/' + rid + '.*')[0])
      mf = rid + '.' + myfile.name.split('.')[1] 
      fs = FileSystemStorage()
      filename = fs.save(mf, myfile)
      uploaded_file_url = fs.url(filename)
      print 'url upload: ',uploaded_file_url
    return HttpResponseRedirect('/reportes/' + rid)

def reports(request, id):
    print "reports.html"
    user = request.user
    #print 'is super user:', user.is_superuser

    if user.is_superuser == True:
      try:
        filtro = user.username.split('@')[1]
      except:
        filtro = ''
      filtro_users = User.objects.all().filter(username__contains = filtro)
      filtro_rendicion = Rendicion.objects.filter(user_id__in = filtro_users, id = id, locked = 1)
      if filtro_rendicion.exists():
        print filtro_rendicion
      else:
        return HttpResponseRedirect('/')
    else:
    #if user.is_superuser == False:
      if id != '0':
        if (Rendicion.objects.filter(id = id,user_id = user.id).exists() == False) or Rendicion.objects.filter(id = id).first().locked == 0:
            return HttpResponseRedirect('/') 

    rall = Rendicion.objects.filter(user_id = user.id, locked = 1).order_by('-id')[:40]
    if user.is_superuser:
      rid = Rendicion.objects.filter(id = id, locked = 1).select_related(
          'centro_costo','subvencion','tipo_fondo').first()
    else:
      rid = Rendicion.objects.filter(id = id, user_id = user.id, locked = 1).select_related(
	  'centro_costo','subvencion','tipo_fondo').first()

    rfd = RendicionesFondosDetalles.objects.filter(rendicion_id = id)
    rfd_count = rfd.count()
    rfd_array0 = list()
    rfd_array1 = list()

    #cheque
    for j in rfd:
        if FondoDetalle.objects.filter(id = int(j.fondos_detalles_id)).filter(cheque = '0' ).first():
            rfd_array0.append(FondoDetalle.objects.select_related('doc_tipo','proveedor','contabilidad',
            'contabilidad_hijo','categoria','subcategoria').filter(id = int(j.fondos_detalles_id)).filter(cheque = '0' ))
    #efectivo
    for j in rfd:
        if FondoDetalle.objects.filter(id = int(j.fondos_detalles_id)).filter(cheque = '1' ).first():
            rfd_array1.append(FondoDetalle.objects.select_related('doc_tipo','proveedor','contabilidad',
            'contabilidad_hijo','categoria','subcategoria').filter(id = int(j.fondos_detalles_id)).filter(cheque = '1' ))

    fdid = RendicionesFondosDetalles.objects.filter(rendicion_id = id).values_list('fondos_detalles_id')
    #print fdid
    sum_efectivo = FondoDetalle.objects.select_related('doc_tipo','proveedor','contabilidad','contabilidad_hijo','categoria','subcategoria').filter(id__in = fdid).filter(cheque = 0).aggregate(sum=Sum('gasto'))
    sum_cheque = FondoDetalle.objects.select_related('doc_tipo','proveedor','contabilidad','contabilidad_hijo','categoria','subcategoria').filter(id__in = fdid).filter(cheque = 1).aggregate(sum=Sum('gasto'))
    if sum_cheque['sum'] is None:
      sum_cheque_1 = 0
    else:
      sum_cheque_1 = sum_cheque['sum']
    if sum_efectivo['sum'] is None:
      sum_efectivo_1 = 0
    else:
      sum_efectivo_1 = sum_efectivo['sum']
    sum_cheque_efectivo = sum_cheque_1 + sum_efectivo_1
    #print sum_cheque['sum']
    #devolucion
    rgd = RendicionesGastoDetalles.objects.filter(rendicion_id = id)
    rgd_array = list()
    for j in rgd:
        rgd_array.append(GastoDetalle.objects.filter(id = int(j.gastos_detalles_id)))
    gdid = RendicionesGastoDetalles.objects.filter(rendicion_id = id).values_list('gastos_detalles_id')
    #print gdid
    sum_dev = GastoDetalle.objects.filter(id__in = gdid).aggregate(sum=Sum('monto'))
    #print sum_dev['sum']
    consolidado = FondoDetalle.objects.filter(id__in = fdid).select_related('contabilidad','contabilidad_hijo').order_by('contabilidad_id', 'contabilidad_hijo_id')
    #.values('contabilidad_id','contabilidad_hijo_id','gasto','cheque')
    #.annotate(count = Count('contabilidad_hijo_id'))
    #.select_related('contabilidad','contabilidad_hijo').filter(id__in = fdid).values('contabilidad_hijo_id').annotate(hijo = 'contabilidad_hijo_id')
    #, total = Sum('gasto') )
    #.aggregate(sum = Sum('gasto'))
    #print consolidado
    c_count = consolidado.count()
    #conta_id,conta_id.nombre,totalxcuenta,conta_hijo_id, contahijo.nombre, totalefec,totalcheque, tota cheque+efec, rowspan_conta, rowspan_hijo
    #c_array = np.zeros((c_count, 7))
    c_array = list()
    j = 0
    for i in consolidado:
    #    print j
        if j > 0:
            c_array.append([i.contabilidad_id,i.contabilidad.nombre,i.gasto,i.contabilidad_hijo_id,i.contabilidad_hijo.nombre,i.gasto,i.gasto,i.cheque,0,0])
            if i.contabilidad_id == c_array[j-1][0]:
                c_array[j][2] = int(c_array[j-1][2]) + int(i.gasto)
		#c_array[j-1][7] = int(c_array[j-1][7]) + 1
                if i.contabilidad_hijo_id == c_array[j-1][3]:
                    c_array[j][6] = int(c_array[j-1][5]) + int(i.gasto)
                    #c_array[j-1][8] = int(c_array[j-1][8]) + 1
                else:
                    c_array[j][6] = int(i.gasto)
            else:
                c_array[j][2] = int(i.gasto)
        else:
            c_array.append([i.contabilidad_id,i.contabilidad.nombre,i.gasto,i.contabilidad_hijo_id,i.contabilidad_hijo.nombre,i.gasto,i.gasto,i.cheque,0,0])
        j = j + 1
    #print c_array

    #########################################################test
    #print 'array2.........................test'
    #print 'conta_id, conta_nombre, gasto_total'
    c_array2 = list()
    for i in consolidado.values('contabilidad_id','contabilidad_hijo_id').annotate(count = Count('contabilidad_id')):
        #print i['count']
        c_array2.append([i['contabilidad_id'],0,i['contabilidad_hijo_id'],0,0,0,'-','-',1])
    #print c_array2
    j = 0
    for i in c_array2:        
        k = FondoDetalle.objects.filter(id__in = fdid, contabilidad_id = i[0], contabilidad_hijo_id = i[2], cheque = '0')#.aggregate(sum=Sum('gasto'))
        if k:
            i[4] = int(k.aggregate(suma = Sum('gasto'))['suma']) + i[4]
        l = FondoDetalle.objects.filter(id__in = fdid, contabilidad_id = i[0], contabilidad_hijo_id = i[2], cheque = '1')#.aggregate(sum=Sum('gasto'))   
        if l:         
            i[3] = int(l.aggregate(suma = Sum('gasto'))['suma']) + i[3]
        m = FondoDetalle.objects.filter(id__in = fdid, contabilidad_id = i[0], contabilidad_hijo_id = i[2])
        if m:
            i[5] = m.aggregate(suma = Sum('gasto'))['suma']
        n = FondoDetalle.objects.filter(id__in = fdid, contabilidad_id = i[0])
        if n:
            i[1] = n.aggregate(suma = Sum('gasto'))['suma']
        i[6] = Contabilidad.objects.filter(id = i[0]).first()
        i[7] = ContabilidadHijo.objects.filter(id = i[2]).first()
        if j > 0:
            if i[0] == c_array2[j-1][0]:
                i[8] = i[8] + c_array2[j-1][8]
                c_array2[j-1][8] = 0
    #            else:
    #                i[8] = 1
    #        else:
    #            i[8] = 1
        j = j + 1
    #print c_array2
    #    j = 0
    #    for i in list(reversed(c_array2)):
    #        if j > 0:
    #            i.contabilidad_id == 
    j = 0
    #    for i in consolidado:
    #    print j
    #        if j > 0:
    #            c_array2.append([i.contabilidad_id,i.contabilidad.nombre,i.gasto,
    #                             i.contabilidad_hijo_id,i.contabilidad_hijo.nombre,i.gasto,
    #                             i.cheque])
    #            if i.contabilidad_id == c_array2[j-1][0]:
    #                c_array2[j][2] = int(c_array2[j-1][2]) + int(i.gasto)
    #                #c_array[j-1][7] = int(c_array2[j-1][7]) + 1
    #                if i.contabilidad_hijo_id == c_array2[j-1][3]:
    #                    c_array2[j][0] = int(c_array2[j-1][0]) + int(i.gasto)
    #                    #c_array2[j-1][8] = int(c_array2[j-1][8]) + 1
    #                else:  
    #                    c_array2[j][6] = int(i.gasto)
    #            else:      
    #                c_array2[j][2] = int(i.gasto)
    #        else:
    #            c_array2.append([i.contabilidad_id,i.contabilidad.nombre,i.gasto,
    #                             i.contabilidad_hijo_id,i.contabilidad_hijo.nombre,i.gasto,
    #                             i.cheque])
    #        j = j + 1
    #print c_array2
    ##########################################################end test
    #    print c_array[0]
    #.aggregate(sum=Sum('gasto'))
    #print id
    #glob.glob('media/13.*')
    #if glob.glob('media/' + id + '.*'):
    file_up = glob.glob('media/' + id + '.*')
    if file_up:
      url_upload = file_up[0]
      name_upload = url_upload.split('/')[1]
    else:
      url_upload = file_up
      name_upload = file_up
    print url_upload
    return render(request, 'reportes.html', {'rall': rall, 'rid': rid, 'rfd_array0': rfd_array0, 'rfd_array1': rfd_array1, 'rgd_array': rgd_array, 'sum_cheque': sum_cheque['sum'], 'sum_efectivo': sum_efectivo['sum'], 'sum_cheque_efectivo': sum_cheque_efectivo, 'sum_dev': sum_dev['sum'], 'consolidado': consolidado, 'c_array': c_array, 'c_array2': list(reversed(c_array2)), 'url_upload': url_upload, 'name_upload': name_upload })


def lock_rendicion(request, id):
    print 'lock rid: ' + str(id)
    rid = Rendicion.objects.get(pk=id)
    fdid = RendicionesFondosDetalles.objects.filter(rendicion_id = id).values_list('fondos_detalles_id')
    consolidado = FondoDetalle.objects.filter(id__in = fdid).select_related('contabilidad','contabilidad_hijo').order_by('contabilidad_id', 'contabilidad_hijo_id')
    gdid = RendicionesGastoDetalles.objects.filter(rendicion_id = id).values_list('gastos_detalles_id')
    consolidadog = GastoDetalle.objects.filter(id__in = gdid)
    close_rid = 0
    close_rid_f = 0
    close_rid_g = 0
 
    if rid.monto:
      total_rendir = rid.monto
      #print 'existe monto'
    if FondoDetalle.objects.filter(id__in = fdid).values_list('gasto').aggregate(suma = Sum('gasto'))['suma']:
      sum_fondos = FondoDetalle.objects.filter(id__in = fdid).values_list('gasto').aggregate(suma = Sum('gasto'))['suma']
      #print 'hay fondo'
    else:
      sum_fondos = 0
      #print 'no hay fondos'
    if GastoDetalle.objects.filter(id__in = gdid).values_list('monto').aggregate(suma = Sum('monto'))['suma']:
      sum_gastos = GastoDetalle.objects.filter(id__in = gdid).values_list('monto').aggregate(suma = Sum('monto'))['suma']
      #print 'hay gastos'
    else:
      sum_gastos = 0
      #print 'no hay gastos'
    try:
      resultado = total_rendir - sum_fondos - sum_gastos
    except:
      resultado = -1

    #print 'resultado: ' + str(resultado)

    if consolidado.exists():
      for i in list(consolidado.values()):
        for j in i:
          if (i[j] is None or i[j] == '') and j != 'doc_no_cheque':
              close_rid_f = 0
              break 
          else:
              close_rid_f = 1
    else:
      close_rid_f = 2
    if consolidadog.exists():
      for i2 in list(consolidadog.values()):        
        for j2 in i2:           
          if (i2[j2] is None or i2[j2] == ''):          
              close_rid_g = 0
              break            
          else:            
              close_rid_g = 1
    else:
      close_rid_g = 2

    if (resultado == 0) and ((close_rid_g == 1 and close_rid_f == 1) or (close_rid_f == 1 and close_rid_g == 2) or (close_rid_f == 2 and close_rid_g == 1) ):
        close_rid = '1'
    else:
        close_rid = '0'
#    print 'close_rid_f: ' + close_rid_f
#    print 'close_rid_g: ' + close_rid_g 
    print 'close_rid: ' + close_rid
    if close_rid == '1':
            Rendicion.objects.filter(id = id).update(locked = 1)
            return HttpResponseRedirect('/')
    else:
            return HttpResponseRedirect('/rendicion/'+id)

def post_filter(request):
    print 'post_filter - xls'
    user = request.user
    form = request.POST
    date_s = form['f_date_s'] #pago doc
    date_f = form['f_date_f'] #pago doc
    f_cc = list(str(form['f_cc']).split(","))
    f_sub = list(str(form['f_sub']).split(","))
    #print user.username
    # if user.is_superuser:
    #  filtro = user.username.split('@')[1]
    #  filtro_users = User.objects.all().filter(username__contains = filtro)
    #PENDIENTE FILTROS
    #  rall = Rendicion.objects.filter(user_id__in = filtro_users).order_by('fecha_subida').filter(locked = 1).filter(centro_costo_id = )
    #    rendicion_c = Rendicion.objects.filter(user_id__in = filtro_users).order_by('-id').filter(locked = 1)[:100]
    #query_filter = FondoDetalle.objects.filter(doc_fecha_pago__gte = date_s, doc_fecha_pago__lte = date_f).select_related('')
    print 'date_s, date_f, f_cc, f_sub: ', date_s, date_f, f_cc, f_sub
    print 'tipo: ', type(f_cc)
    if user.is_superuser:
      try:
        filtro = user.username.split('@')[1]
      except:
        filtro = ''
      #filtro_users = User.objects.all().filter(username__contains = filtro)
    else:
      return HttpResponseRedirect('/')

    filtro_users = User.objects.all().filter(username__contains = filtro)

    
    query_filter = RendicionesFondosDetalles.objects.select_related('fondos_detalles','rendicion').filter(
		   fondos_detalles__doc_fecha_pago__gte = date_s, fondos_detalles__doc_fecha_pago__lte = date_f,
		   rendicion__centro_costo_id__in = f_cc, rendicion__subvencion_id__in = f_sub,
		   rendicion__user_id__in = filtro_users, rendicion__locked = 1)
    print 'cantidad de registros encontrados: ', query_filter.count()

#    for j in query_filter:
#      print 'centrocosto',CentroCosto.objects.get(id = j.rendicion.centro_costo_id).rbd

    activate = 2
    if activate == 1:
      response = HttpResponse(content_type='text/csv')
      response['Content-Disposition'] = 'attachment; filename="rendiciones.csv"'
      writer = csv.writer(response)
      writer.writerow(['RBD','Subvencion','Codigo Sub-Cuenta','Codigo Documento','No. documento','fecha documento','fecha de pago',
	'Descripcion del gasto','Rut Proveedor','Nombre Proveedor','Monto Gasto','Monto Documento','Cuenta Presupuesto',
	'Sub Cuenta Presupuesto','Efectivo/Cheque','# Rendicion'])
      print '--------csv--------'
      for j in query_filter:
        if j.fondos_detalles.cheque == '1':
          che_efe = 'Cheque'
        else:
          che_efe = 'Efectivo'
        print che_efe
        writer.writerow([CentroCosto.objects.get(id = j.rendicion.centro_costo_id).rbd, Subvencion.objects.get(id=j.rendicion.subvencion_id).nombre,
                Subcategoria.objects.get(id=j.fondos_detalles.subcategoria_id).code, DocTipo.objects.get(id = j.fondos_detalles.doc_tipo_id).sigla ,
                j.fondos_detalles.doc_no , j.fondos_detalles.doc_fecha.strftime("%d-%m-%Y") ,j.fondos_detalles.doc_fecha_pago.strftime("%d-%m-%Y") ,
                j.fondos_detalles.doc_detalle.capitalize() ,j.fondos_detalles.proveedor_rut ,j.fondos_detalles.proveedor_nombre ,
                j.fondos_detalles.gasto ,j.fondos_detalles.doc_monto ,Contabilidad.objects.get(id=j.fondos_detalles.contabilidad_id).nombre ,
                ContabilidadHijo.objects.get(id=j.fondos_detalles.contabilidad_hijo_id).nombre ,che_efe])
      return response
    elif activate == 2:
      print 'activate is 2 -------xls------'
      response = HttpResponse(content_type='application/ms-excel')
      response['Content-Disposition'] = 'attachment; filename="rendicion_xls.xls"'
      wb = xlwt.Workbook(encoding='utf-8')
      ws = wb.add_sheet('Rendicion')
      row_num = 0
      font_style = xlwt.XFStyle()
      font_style.font.bold = True

      columns = ['RBD','Subvencion','Codigo Sub-Cuenta','Codigo Documento','No. documento','fecha documento','fecha de pago',
        'Descripcion del gasto','Rut Proveedor','Nombre Proveedor','Monto Gasto','Monto Documento','Cuenta Presupuesto',
        'Sub Cuenta Presupuesto','Efectivo/Cheque','# Rendicion']

      for col_num in range(len(columns)):
        ws.write(row_num, col_num, columns[col_num], font_style)

      font_style = xlwt.XFStyle()

      #rows = User.objects.all().values_list('username', 'first_name', 'last_name', 'email')
      #rows = [CentroCosto.objects.get(id = j.rendicion.centro_costo_id).rbd, 
      #Subvencion.objects.get(id=j.rendicion.subvencion_id).nombre, Subcategoria.objects.get(id=j.fondos_detalles.subcategoria_id).code, 
      #DocTipo.objects.get(id = j.fondos_detalles.doc_tipo_id).sigla ,j.fondos_detalles.doc_no , 
      #j.fondos_detalles.doc_fecha.strftime("%d-%m-%Y") ,j.fondos_detalles.doc_fecha_pago.strftime("%d-%m-%Y") ,
      #j.fondos_detalles.doc_detalle.capitalize() ,j.fondos_detalles.proveedor_rut ,j.fondos_detalles.proveedor_nombre , j.fondos_detalles.gasto,
      #j.fondos_detalles.doc_monto ,Contabilidad.objects.get(id=j.fondos_detalles.contabilidad_id).nombre ,
      #ContabilidadHijo.objects.get(id=j.fondos_detalles.contabilidad_hijo_id).nombre ,che_efe]
      for j in query_filter:
        row_num += 1
        if j.fondos_detalles.cheque == '1':
          che_efe = 'Cheque'
        else:
          che_efe = 'Efectivo'
        rend_no1 = RendicionesFondosDetalles.objects.get(id = j.fondos_detalles.id).rendicion_id
        #print rend_no1
        rend_no = '-'
        row = [CentroCosto.objects.get(id = j.rendicion.centro_costo_id).rbd, Subvencion.objects.get(id=j.rendicion.subvencion_id).nombre, Subcategoria.objects.get(id=j.fondos_detalles.subcategoria_id).code, DocTipo.objects.get(id = j.fondos_detalles.doc_tipo_id).sigla ,j.fondos_detalles.doc_no , j.fondos_detalles.doc_fecha.strftime("%d-%m-%Y") ,j.fondos_detalles.doc_fecha_pago.strftime("%d-%m-%Y") ,j.fondos_detalles.doc_detalle.capitalize() ,j.fondos_detalles.proveedor_rut ,j.fondos_detalles.proveedor_nombre , j.fondos_detalles.gasto,j.fondos_detalles.doc_monto ,Contabilidad.objects.get(id=j.fondos_detalles.contabilidad_id).nombre ,ContabilidadHijo.objects.get(id=j.fondos_detalles.contabilidad_hijo_id).nombre ,che_efe, rend_no1]
        for col_num in range(len(row)):
            #print row_num, col_num, row[col_num]
            ws.write(row_num, col_num, row[col_num], font_style)


      wb.save(response)
      return response

    else:
      return HttpResponseRedirect('/')
##start filtro2
def post_filter2(request):
    print 'post_filter2 - xls'
    user = request.user
    form = request.POST
    rend2 = form['rend2'].split(',') #rendicion
    print rend2
    print 'tipo: ', type(rend2)
    if user.is_superuser:
      try:
        filtro = user.username.split('@')[1]
      except:
        filtro = ''
    else:
      return HttpResponseRedirect('/')
    filtro_users = User.objects.all().filter(username__contains = filtro)
    query_filter = RendicionesFondosDetalles.objects.select_related('fondos_detalles','rendicion').filter(
		   rendicion_id__in = rend2, rendicion__user_id__in = filtro_users, rendicion__locked = 1)
    print 'cantidad de registros encontrados: ', query_filter.count()
###
    activate = 2
    if activate == 1:
      response = HttpResponse(content_type='text/csv')
      response['Content-Disposition'] = 'attachment; filename="rendiciones.csv"'
      writer = csv.writer(response)
      writer.writerow(['RBD','Subvencion','Codigo Sub-Cuenta','Codigo Documento','No. documento','fecha documento','fecha de pago',
	'Descripcion del gasto','Rut Proveedor','Nombre Proveedor','Monto Gasto','Monto Documento','Cuenta Presupuesto',
	'Sub Cuenta Presupuesto','Efectivo/Cheque','# Rendicion'])
      print '--------csv--------'
      for j in query_filter:
        if j.fondos_detalles.cheque == '1':
          che_efe = 'Cheque'
        else:
          che_efe = 'Efectivo'
        print che_efe
        writer.writerow([CentroCosto.objects.get(id = j.rendicion.centro_costo_id).rbd, Subvencion.objects.get(id=j.rendicion.subvencion_id).nombre,
                Subcategoria.objects.get(id=j.fondos_detalles.subcategoria_id).code, DocTipo.objects.get(id = j.fondos_detalles.doc_tipo_id).sigla ,
                j.fondos_detalles.doc_no , j.fondos_detalles.doc_fecha.strftime("%d-%m-%Y") ,j.fondos_detalles.doc_fecha_pago.strftime("%d-%m-%Y") ,
                j.fondos_detalles.doc_detalle.capitalize() ,j.fondos_detalles.proveedor_rut ,j.fondos_detalles.proveedor_nombre ,
                j.fondos_detalles.gasto ,j.fondos_detalles.doc_monto ,Contabilidad.objects.get(id=j.fondos_detalles.contabilidad_id).nombre ,
                ContabilidadHijo.objects.get(id=j.fondos_detalles.contabilidad_hijo_id).nombre ,che_efe])
      return response
    elif activate == 2:
      print 'activate is 2 -------xls------'
      response = HttpResponse(content_type='application/ms-excel')
      response['Content-Disposition'] = 'attachment; filename="rendicion_xls.xls"'
      wb = xlwt.Workbook(encoding='utf-8')
      ws = wb.add_sheet('Rendicion')
      row_num = 0
      font_style = xlwt.XFStyle()
      font_style.font.bold = True

      columns = ['RBD','Subvencion','Codigo Sub-Cuenta','Codigo Documento','No. documento','fecha documento','fecha de pago',
        'Descripcion del gasto','Rut Proveedor','Nombre Proveedor','Monto Gasto','Monto Documento','Cuenta Presupuesto',
        'Sub Cuenta Presupuesto','Efectivo/Cheque','# Rendicion']

      for col_num in range(len(columns)):
        ws.write(row_num, col_num, columns[col_num], font_style)

      font_style = xlwt.XFStyle()
      for j in query_filter:
        row_num += 1
        if j.fondos_detalles.cheque == '1':
          che_efe = 'Cheque'
        else:
          che_efe = 'Efectivo'
        rend_no1 = RendicionesFondosDetalles.objects.get(id = j.fondos_detalles.id).rendicion_id
        rend_no = '-'
        row = [CentroCosto.objects.get(id = j.rendicion.centro_costo_id).rbd, Subvencion.objects.get(id=j.rendicion.subvencion_id).nombre, Subcategoria.objects.get(id=j.fondos_detalles.subcategoria_id).code, DocTipo.objects.get(id = j.fondos_detalles.doc_tipo_id).sigla ,j.fondos_detalles.doc_no , j.fondos_detalles.doc_fecha.strftime("%d-%m-%Y") ,j.fondos_detalles.doc_fecha_pago.strftime("%d-%m-%Y") ,j.fondos_detalles.doc_detalle.capitalize() ,j.fondos_detalles.proveedor_rut ,j.fondos_detalles.proveedor_nombre , j.fondos_detalles.gasto,j.fondos_detalles.doc_monto ,Contabilidad.objects.get(id=j.fondos_detalles.contabilidad_id).nombre ,ContabilidadHijo.objects.get(id=j.fondos_detalles.contabilidad_hijo_id).nombre ,che_efe,
rend_no1]
        for col_num in range(len(row)):
            ws.write(row_num, col_num, row[col_num], font_style)
      wb.save(response)
      return response
    else:
      return HttpResponseRedirect('/')


##end filtro2
def open_rendicion(request,id):
    user = request.user
    if user.is_superuser:
      Rendicion.objects.filter(id = id).update(locked = 0)
      return HttpResponseRedirect('/rendicion/'+id)
    else:
      print 'buen intento mugriento'
      return HttpResponseRedirect('/')

def perfil(request):
    user = request.user
    auth = request.user.is_authenticated()
    if auth == False:
        return HttpResponseRedirect('/')
    if user.is_superuser:
      try:
        filtro = user.username.split('@')[1]
      except:
        filtro = ''
      if user.id == 1:
        filtro_users = User.objects.all().exclude(id = user.id)
      else:
        filtro_users = User.objects.all().filter(username__contains = filtro).exclude(id = user.id)
      return render(request, 'perfil.html', {'users': filtro_users })     #, {'context': rendicion, 'r_close': rendicion_c,}) 
    else:
      return render(request, 'perfil.html')

#def admin_change_pass(request,id):
#    user = request.user
    

def save_perfil(request):
    print 'save perfil'
    form = request.POST 
    #print form
    user = request.user
    auth = request.user.is_authenticated()
    if auth and (user.username == form['username'] or user.is_superuser):
      #print 'auth y username'
      perfil = User.objects.get(id = user.id)
      if form['password'] != '' and form['password'] != None:
        perfil.set_password(form['password'])
      perfil.last_name = form['last_name']
      perfil.first_name = form['first_name']
      perfil.save()
      print 'se ha actualizado el perfil del user id: ', perfil.id
      return HttpResponseRedirect('/perfil')
    else:
      print 'operacion bloqueada'
      return HttpResponseRedirect('/')

def change_perfil(request, id):
    user = request.user
    auth = request.user.is_authenticated()
    if auth == False:
        return HttpResponseRedirect('/')
    form = request.POST
    print 'user id:', id, 'form', form
    #print 'id', id
    usuario = User.objects.get(id = id)
    if 'superuser' in form:
      usuario.is_superuser = True
    else:
      usuario.is_superuser = False
    if 'active' in form:
      usuario.is_active = True
    else:
      usuario.is_active = False
    if form['password']:
      usuario.set_password(form['password'])
    usuario.save()
    return HttpResponseRedirect('/perfil')

def perfiles(request):
    user = request.user
    auth = request.user.is_authenticated()
    if auth == False or user.is_superuser == False:
        return HttpResponseRedirect('/')
#    if user.is_superuser:
    return render(request, 'perfiles.html', {})

def proveedores(request):
    user = request.user
    auth = request.user.is_authenticated()
    if auth == False or user.is_superuser == False:
        return HttpResponseRedirect('/')
    else:
        proveedores = Proveedor.objects.all().order_by('nombre').exclude(id = 1000)
#    if user.is_superuser:
    return render(request, 'proveedores.html', {'proveedores':proveedores})

#new proveedor
def save_proveedor(request):
    print 'save proveedor'
    form = request.POST 
    print form
    user = request.user
    auth = request.user.is_authenticated()
    if auth and user.is_superuser:
      #print 'auth y username'
      #proveedores = Proveedor.objects.get(id = user.id)
      if form['rut'] and form['nombre']:
        if form['id']:
          pc = Proveedor.objects.filter(id = form['id']).update(
          nombre = form['nombre'],
          rut = form['rut']
          )
          print 'se ha editado el proveedor con id: ',form['id']
        else:
          pc = Proveedor.objects.create(nombre = form['nombre'], rut = form['rut'])
          #perfil.save()
          print 'se ha creado un nuevo proveedor el perfil del user id: ',pc.id
        return HttpResponseRedirect('/proveedores')
      else:
        print 'no ha escrito datos para ser registrados'
        return HttpResponseRedirect('/proveedores')
    else:
      print 'operacion bloqueada'
      return HttpResponseRedirect('/')

def del_proveedor(request,id):
    print 'del proveedor'
    user = request.user
    auth = request.user.is_authenticated()
    if auth and user.is_superuser:
      Proveedor.objects.get(id = id).delete()
      print 'borrar proveedor id:', id
      return HttpResponseRedirect('/proveedores')
    else:
      print 'operacion bloqueada'
      return HttpResponseRedirect('/')
