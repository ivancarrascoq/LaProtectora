from django import forms
from .models import *

class LoginForm(forms.Form):
    username = forms.CharField(label='Username', max_length=64)
    password = forms.CharField(label='Password', widget=forms.PasswordInput())

class EditForm(forms.Form):
#    user_id = forms.IntegerField()
#    fecha_subida = forms.TimeField()
    mes_gasto = forms.CharField()
    monto = forms.IntegerField()
    tipo_fondo_id = forms.IntegerField()
    centro_costo_id = forms.IntegerField()
    subvencion_id = forms.IntegerField()
#    locked = forms.IntegerField()

#class NewForm(forms.Form):
#    user_id = 
#    centro_costo =
#    mes_gasto =
#    tipo_fondo = 
#    subvencion = 
#    monto = forms.IntegerField()



#WizardForm
#
#class Newform1(forms.Form):
#    subject = forms.CharField(max_length=100)
#
#class Newform2(forms.Form):
#    sender = forms.CharField()
#
#class Newform3(forms.Form):
#    message = forms.CharField(max_length=100)
