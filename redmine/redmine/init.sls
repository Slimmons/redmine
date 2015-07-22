git:
  pkg:
    - installed

git-core:
  pkg:
    - installed

subversion:
  pkg:
    - installed

imagemagick:
  pkg:
    - installed

libmagickwand-dev:
  pkg:
    - installed

/opt/redmine:
  file.directory:
    - user: simmons
    - group: simmons
    - mode: 755
    - makedirs: True

getRedmine:
  cmd.run:
    - name: svn co http://svn.redmine.org/redmine/branches/2.6-stable current
    - cwd: /opt/redmine/
    - user: simmons

/opt/redmine/current/tmp:
  file.directory:
    - user: www-data
    - group: simmons
    - mode: 775

/opt/redmine/current/tmp/pdf:
  file.directory:
    - user: www-data
    - group: simmons
    - mode: 775

/opt/redmine/current/public/plugin_assets:
  file.directory:
    - user: www-data
    - group: simmons
    - mode: 775

fixPermissions:
  cmd.run:
    - name: sudo chmod -R 775 files log tmp public/plugin_assets && sudo chown -R www-data:simmons files log tmp public/plugin_assets
    - cwd: /opt/redmine/current
    - user: root

/opt/redmine/repos/svn:
  file.directory:
    - user: www-data
    - group: www-data
    - makedirs: True

/opt/redmine/repos/git:
  file.directory:
    - user: www-data
    - group: www-data
    - makedirs: True

redmineTest:
  cmd.run:
    - name: echo "redmine" >> test.txt
    - cwd: /home/simmons
    - user: simmons

