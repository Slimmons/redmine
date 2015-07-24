apache2:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: apache2

apache2-dev:
  pkg:
    - installed

libcurl4-gnutls-dev:
  pkg:
    - installed

libapache2-svn:
  pkg:
    - installed

libapache-dbi-perl:
  pkg:
    - installed

libapache2-mod-perl2:
  pkg:
    - installed

libdbd-mysql-perl:
  pkg:
    - installed

libauthen-simple-ldap-perl:
  pkg:
    - installed

openssl:
  pkg:
    - installed

enableModules:
  cmd.run:
    - name: sudo a2enmod ssl perl dav dav_svn dav_fs rewrite
    - cwd: /opt/redmine/current
    - user: root

InstallPassenger:
  cmd.run:
    - name: gem install passenger
    - cwd: /opt/redmine/current
    - user: simmons


passengerApacheModule:
  cmd.run:
    - name: passenger-install-apache2-module
    - cwd: /opt/redmine/current
    - user: simmons

#put the passenger.conf file in server-config, and put it in the right place here
/etc/apache2/conf-available/passenger.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://server-config/passenger.conf

enableConfiguration:
  cmd.run:
    - name: sudo a2enconf passenger
    - cwd: /opt/redmine/current
    - user: root

loadLibrary:
  cmd.run:
    - name: sudo ln -s /opt/redmine/current/extra/svn/Redmine.pm /usr/lib/perl5/Apache/
    - cwd: /opt/redmine/current
    - user: root
