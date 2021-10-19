```bash
#On Ubuntu
adduser deploy
gpasswd -a deploy sudo

#On Centos
adduser deploy
# Set password for deploy user
passwd deploy
usermod -aG wheel deploy
```