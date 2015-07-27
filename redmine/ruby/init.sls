createTestFile:
  cmd.run:
    - name: touch test.txt
    - cwd: /home/simmons/

curl:
  pkg:
    - installed

curlComplete:
  cmd.run:
    - name: echo "curl" >> test.txt
    - cwd: /home/simmons/
 
#The commands on the tutorial for here are:
# sudo apt-get install curl
# curl -sSL https://get.rvm.io | bash -s stable --ruby=2.0.0
# source /home/$USER/.rvm/scripts/rvm

#These commands don't work on the actual server.  The results are below


# curl -sSL https://get.rvm.io | bash -s stable --ruby=2.0.0
#Downloading https://github.com/rvm/rvm/archive/1.26.11.tar.gz
#Downloading https://github.com/rvm/rvm/releases/download/1.26.11/1.26.11.tar.gz.asc
#gpg: failed to create temporary file `/home/simmons/.gnupg/.#lk0x248b050.jsimmons-vmbase.5753': Permission denied
#gpg: keyblock resource `/home/simmons/.gnupg/pubring.gpg': general error
#gpg: Signature made Mon 30 Mar 2015 04:52:13 PM CDT using RSA key ID BF04FF17
#gpg: Can't check signature: public key not found
#Warning, RVM 1.26.0 introduces signed releases and automated check of signatures when GPG software found.
#Assuming you trust Michal Papis import the mpapis public key (downloading the signatures).

#GPG signature verification failed for '/home/simmons/.rvm/archives/rvm-1.26.11.tgz' - 'https://github.com/rvm/rvm/releases/download/1.26.11/1.26.11.tar.gz.asc'!
#try downloading the signatures:
#
#    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
#
#or if it fails:
#
#    command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
#
#the key can be compared with:
#
#    https://rvm.io/mpapis.asc
#    https://keybase.io/mpapis


#If I run the suggested commands, they sometimes work, and sometimes don't.  I definitely need a better way to do this.



#using port 80 here for firewall reasons
FixRVMProblem:
  cmd.run:
    - name: sudo gpg --keyserver hkp://keys.gnupg.net:80 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    - cwd: /home/simmons

####REMOVE THIS LATER####
fixRVMProblemComplete:
  cmd.run:
    - name: echo "FixRVMProblem" >> test.txt
    - cwd: /home/simmons/
#The above solution works sometimes (not all the time), another thing (that sometimes works, is this below)
#FixRVMProblem:
#  cmd.run:
#    - name: command curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -
#    - cwd: /home/simmons

rubyWithRVM:
  cmd.run:
    - name: curl -sSL https://get.rvm.io | bash -s stable --ruby=2.0.0
    - cwd: /home/simmons

####REMOVE THIS LATER####
rubyWithRVMComplete:
  cmd.run:
    - name: echo "rubyWithRVM" >> test.txt
    - cwd: /home/simmons/

rubyPermissions:
  cmd.run:
    - name: sudo chmod -R 777 /usr/local/rvm/gems/ruby-2.0.0-p643
    - cwd: /home/simmons
    - user: root

####REMOVE THIS LATER####
rubyPermissionsComplete:
  cmd.run:
    - name: echo "rubyPermissions" >> test.txt
    - cwd: /home/simmons/

useRVM:
  cmd.run:
    - name: source /usr/local/rvm/scripts/rvm
    - cwd: /home/simmons
    - user: simmons

useRVMComplete:
  cmd.run:
    - name: echo "useRVM" >> test.txt
    - cwd: /home/simmons/
#I tried using the method here: http://docs.saltstack.com/en/latest/ref/states/all/salt.states.rvm.html
#but I had no success in setting up rvm using that state.  I'd love input on how to do that better.
