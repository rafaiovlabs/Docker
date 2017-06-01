# General Docker usage

* docker run
* docker start
* docker ps
* docker images
* docker rm
* docker rm1
* docker inspect
* docker attach
* docker events

## Useful procedures
* docker stop
* docker ps -a | grep -i ${PWD##*/} | grep -i exited | awk '{print $1}' | xargs -i docker rm '{}'
* docker up -d
* on docker compose images should have the smae hash. check with docker images
* docker images |grep name ofprojectorcontainer
* docker rmi tagdeapp
### Deploy with new python req
* $> dc build --no-cache clarodelivery-django-prod
* $> dc stop
* $> docker ps -a | grep -i ${PWD##*/} | grep -i exited | awk '{print $1}' | xargs -i docker rm '{}'
* $> docker images | grep delivery
* $> docker rmi delivery_delivery-celery-worker-prod
* $> docker rmi delivery_delivery-celery-beat-prod
* $> docker rmi delivery_delivery-celery-worker-dataimporter-prod
* $> dc up -d
* $> dc ps
* $> ./00-deploy.sh prod
#### on tests
* dct build --no-cache clarodelivery-test-django
* dct stop
* docker ps -a | grep -i ${PWD##*/} | grep -i exited | awk '{print $1}' | xargs -i docker rm '{}'
* docker images | grep delivery
* docker rmi clarodelivery_clarodelivery-test-celery-beat
* docker rmi clarodelivery_clarodelivery-test-celery-worker-dataimporter
* docker rmi clarodelivery_clarodelivery-test-celery-worker
* dct up -d
* dct ps 

### iptables error

ERROR: for nginx  Cannot start service nginx: driver failed programming external connectivity on endpoint nginx_nginx_1 (63d885cf18aa273a8b6b7aebaad70687a7d923ae9418e9954090cfaf024e9bcf): iptables failed: iptables --wait -t nat -A DOCKER -p tcp -d 0/0 --dport 80 -j DNAT --to-destination 172.18.0.2:80 ! -i br-3fbe0f108c06:  (fork/exec /sbin/iptables: cannot allocate memory)
ERROR: Encountered errors while bringing up the project.
* $> iptable -F
* $> systemctl stop / start docker

* ./00-deploy.sh test




