curl:
  pkg:
    - installed

#using port 80 here for firewall reasons
FixRVMProblem:
  cmd.run:
    - name: sudo gpg --keyserver hkp://keys.gnupg.net:80 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    - cwd: /home/simmons

#The above solution seems to work better.
#FixRVMProblem:
#  cmd.run:
#    - name: command curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -
#    - cwd: /home/simmons

rubyWithRVM:
  cmd.run:
    - name: curl -sSL https://get.rvm.io | bash -s stable --ruby=2.0.0
    - cwd: /home/simmons

rubyPermissions:
  cmd.run:
    - name: sudo chmod -R 777 /usr/local/rvm/gems/ruby-2.0.0-p643
    - cwd: /home/simmons
    - user: root

useRVM:
  cmd.run:
    - name: source /usr/local/rvm/scripts/rvm
    - cwd: /home/simmons
    - user: simmons

#I tried using the method here: http://docs.saltstack.com/en/latest/ref/states/all/salt.states.rvm.html
#but I had no success in setting up rvm using that state.  I'd love input on how to do that better.
