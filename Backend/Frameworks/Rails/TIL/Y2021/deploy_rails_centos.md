[source](https://ngaunhien.net/blog/dbb7d1)
[source](https://tohyongcheng.github.io/learn/ruby%20on%20rails/digitalocean/capistrano/postgresql/2016/01/10/deploying-ror-on-digitalocean.html)

[install postgresql](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-centos-8)



### errors

https://prograils.com/capistrano-deploy-to-ubuntu-with-systemd-nginx-puma-and-rbenv

[systemd](https://viblo.asia/p/cai-dat-server-chay-rails-app-tren-production-su-dung-puma-nginx-m68Z0zPd5kG)



```html
nginx error permission on nginx user

I faced similar issue while restarting Nginx and found it to be a cause of SeLinux. Be sure to give a try after either disabling SeLinux or temporarily setting it to Permissive mode using below command:

setenforce 0

I hope it helps :)
```
