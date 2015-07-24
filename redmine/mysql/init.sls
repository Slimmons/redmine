python-mysqldb:
  pkg:
    - installed

mysql-server:
  pkg:
    - installed

libmysqlclient-dev:
  pkg:
    - installed

mysql-base:
  mysql_database.present:
    - name: redmine
    - require:
      - pkg: python-mysqldb
  mysql_user.present:
    - name: redmine
    - host: localhost
    - password: "password"
    - require:
      - pkg: python-mysqldb

redmineDB_Grants:
  mysql_grants.present:
    - grant: all privileges
    - database: redmine.*
    - user: redmine
    - host: localhost
