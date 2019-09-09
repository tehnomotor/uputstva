ssh root@IP_ADDRESS -p PORT_NUMBER
IP_ADDRESS = 192.168.1.23
PORT_NUMBER = 22
ssh root@192.168.1.23 -p 22

apt-get update
apt-get upgrade

apt-get install postgresql -y

systemctl enable postgresql
wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
echo "deb http://nightly.odoo.com/12.0/nightly/deb/ ./" >> /etc/apt/sources.list.d/odoo.list

apt-get update

apt-get install odoo

systemctl status odoo

● odoo.service - Odoo Open Source ERP and CRM
Loaded: loaded (/lib/systemd/system/odoo.service; enabled; vendor preset: enabled)
Active: active (running) since Wed 2018-10-10 10:59:04 CDT; 4s ago
Main PID: 10951 (odoo)
CGroup: /system.slice/odoo.service
└─10951 /usr/bin/python3 /usr/bin/odoo --config /etc/odoo/odoo.conf --logfile /var/log/odoo/odoo-server.log

nano /etc/odoo/odoo.conf

admin_passwd = StrongPassword

admin_passwd = OdooLozinka1

systemctl restart odoo

http://192.168.1.32:8069

apt-get install apache2

systemctl enable apache2

http://192.168.1.25/

It works!

a2enmod proxy
a2enmod proxy_http

nano /etc/apache2/sites-available/my_domain.conf

<VirtualHost *:80>
ServerName my_domain.com
ServerAlias www.my_domain.com

ProxyRequests Off
<Proxy *>
Order deny,allow
Allow from all
</Proxy>

ProxyPass / http://my_domain.com:8069/
ProxyPassReverse / http://my_domain.com:8069/
<Location />
Order allow,deny
Allow from all
</Location>
</VirtualHost>

ln -s /etc/apache2/sites-available/my_domain.conf /etc/apache2/sites-enabled/my_domain.conf

my_domain.com

Odoo.local

service apache2 restart

