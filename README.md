# LaProtectora
##F200

check django version:

python -m django --version

if not installed:

**pip install django**


To clone repository:

**git clone https://github.com/ivancarrascoq/LaProtectora**

**mysql -u root -p < laprotectora.sql**
**pip install numpy unicodecsv xlwt**
**pip install pip --upgrade**
**apt install python-mysqldb**
**pip install MySQL-python**

 _python2.7 manage.py runserver 0:8000_
 
 
 ###to run python as deamon###
 
screen

python2.7 manage.py runserver 0:8000

Now press Ctrl+A and then press d to exit from this screen.
This creates the server in a screen and then detaches it. This way you can simply go back in and type:

screen -r

-------------------
**to change admin password via CLI**

[root@CentOS-server]# /usr/local/bin/python2.7 manage.py shell
>>> from django.contrib.auth.models import User
>>> user = User.objects.get(username='admin')
>>> user.set_password('admin_pass')
>>> user.save()

-------------------
**to deploy production mode**
...edit, comment and delete SECRET_KEY and add "with open..." into settings.py

$ nano LaProtectora/settings.py
#SECRET_KEY = '****'
with open('/etc/secret_key.txt') as f:
    SECRET_KEY = f.read().strip()

$ nano /etc/secret_key.txt
(copy SECRET_KEY without quotes)

