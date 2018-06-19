from django.conf.urls import url
from . import views
from django.conf.urls.static import static
from django.conf import settings
from django.views.static import serve

#wizard
#from .forms import NewForm1,NewForm2,NewForm3
#from .views import ContactWizard


urlpatterns = [
    url(r'^$', views.index, name='index'),  
#    url(r'^/$', views.index),
    url(r'login/', views.login_view, name='login'),
    url(r'logout/', views.logout_view, name='logout'),
    url(r'user/(\w+)/$', views.profile, name='profile'),
#    url(r'([0-9+]/$)', views.detail),
    url(r'^rendicion/([0-9]+)/$', views.edit, name='rendicion'),
    url(r'new/$', views.new),
    url(r'post_rendicion$',views.post_rendicion, name='post_rendicion'),
#add fd y gd
    url(r'^addfd/$', views.addfd, name='addfd'),
    url(r'^addgd/$', views.addgd, name='addgd'),
#test ajax fd
    url(r'^addfdjs/$', views.addfdjs, name='addfdjs'),
    url(r'^addgdjs/$', views.addgdjs, name='addgdjs'),
    url(r'^delfd/$', views.delfd, name='delfd'),
    url(r'^delgd/$', views.delgd, name='delgd'),
#save rendicion
    url(r'^save_rendicion$', views.save_rendicion, name='save_rendicion'),
#dropdown contahjo
    url(r'^jscontahijo/$', views.jscontahijo, name='jscontahijo'),
#dropdown subcat
    url(r'^jssubcat/$', views.jssubcat, name='jssubcat'),
#reportes
    url(r'^reportes/([0-9]+)/$', views.reports, name='reportes'),
#lock_rendicion
    url(r'^lock_rendicion/([0-9]+)/$', views.lock_rendicion, name='lock_rendicion'),
#post_filter
    url(r'post_filter$', views.post_filter, name='post_filter_csv'),
#post_filter2
    url(r'post_filter2$', views.post_filter2, name='post_filter2_csv'),
#open_rendicion
    url(r'^open_rendicion/([0-9]+)/$', views.open_rendicion, name='open_rendicion'),
#admin-users
    url(r'^perfil$', views.perfil, name='perfil'),
#user-profile
    url(r'^perfiles$', views.perfiles, name='perfiles'),
    url(r'^save_perfil$', views.save_perfil, name='save_perfil'),
    url(r'^change_perfil/([0-9]+)/$', views.change_perfil, name='change_perfil'),
#post_upload
    url(r'post_upload$', views.post_upload, name='post_upload'),
#proveedores
    url(r'^proveedores$', views.proveedores, name='proveedores'),
    url(r'^save_proveedor$', views.save_proveedor, name='save_proveedor'),
    url(r'^del_proveedor/([0-9]+)/$', views.del_proveedor, name='del_proveedor'),

]

if settings.DEBUG:
#    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += [
        url(r'^media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT,}),
]
