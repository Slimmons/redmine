createConfigFiles:
  cmd.run:
    - name: |
        cp config/configuration.yml.example config/configuration.yml
        cp config/database.yml.example config/database.yml
    - cwd: /opt/redmine/current
    - user: simmons

#need to put a copy of the database.yml and possibly the configuration.yml file in server-config, and copy over from here.

gemInstallBundler:
  cmd.run:
    - name: gem install bundler
    - user: simmons
    - cwd: /opt/redmine/current

bundleInstall:
  cmd.run:
    - name: bundle install --without development test
    - user: simmons
    - cwd: /opt/redmine/current

bundleExecRake:
  cmd.run:
    - name: bundle exec rake generate_secret_token
    - user: simmons
    - cwd: /opt/redmine/current

rakeDB:
  cmd.run:
    - name: RAILS_ENV=production bundle exec rake db:migrate
    - user: simmons
    - cwd: /opt/redmine/current

rakeRedmine:
  cmd.run:
    - name: RAILS_ENV=production bundle exec rake redmine:load_default_data
    - user: simmons
    - cwd: /opt/redmine/current
