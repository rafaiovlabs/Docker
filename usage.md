
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

## Docker login
* Use docker login to login to specific registrys and or artfactories.

## Useful procedures
* docker stop
* docker ps -a | grep -i ${PWD##*/} | grep -i exited | awk '{print $1}' | xargs -i docker rm '{}'
* docker up -d
* on docker compose images should have the smae hash. check with docker images
* docker images |grep name ofprojectorcontainer
* docker rmi tagdeapp
### when a container is exited with error
* docker run CONTAINER /bin/bash
* docker run CONTAINER 

### Deploy with new python req
* $> dc build --no-cache clarodelivery-django-prod   (docker-compose = dc this is aliased) 
* $> dc stop
* $> docker ps -a | grep -i ${PWD##*/} | grep -i exited | awk '{print $1}' | xargs -i docker rm '{}'
* $> docker images | grep servicename-example1
* $> docker images | grep servicename-example2
* $> docker rmi delivery_delivery-celery-worker-prod
* $> docker rmi delivery_delivery-celery-beat-prod
* $> docker rmi delivery_delivery-celery-worker-dataimporter-prod #erase all minus initial image build. 
* $> dc up -d
* $> dc ps
* $> ./00-deploy.sh prod
#### On tests
* dct build --no-cache clarodelivery-test-django
* dct stop
* docker ps -a | grep -i ${PWD##*/} | grep -i exited | awk '{print $1}' | xargs -i docker rm '{}'
* docker images | grep delivery
* docker rmi clarodelivery_clarodelivery-test-celery-beat
* docker rmi clarodelivery_clarodelivery-test-celery-worker-dataimporter
* docker rmi clarodelivery_clarodelivery-test-celery-worker
* dct up -d
* dct ps 
* ./00-deploy.sh test

### iptables error

ERROR: for nginx  Cannot start service nginx: driver failed programming external connectivity on endpoint nginx_nginx_1 (63d885cf18aa273a8b6b7aebaad70687a7d923ae9418e9954090cfaf024e9bcf): iptables failed: iptables --wait -t nat -A DOCKER -p tcp -d 0/0 --dport 80 -j DNAT --to-destination 172.18.0.2:80 ! -i br-3fbe0f108c06:  (fork/exec /sbin/iptables: cannot allocate memory)
ERROR: Encountered errors while bringing up the project.
* $> iptable -F
* $> systemctl stop / start docker

### List of projects by container 

* docker ps --format '{{.Names}}' | cut -d'_' -f1 | sort | uniq

### View stats for a running project:
 $> docker stats $(docker ps|grep -v "NAMES" | grep __PROJECTNAME__ |awk '{ print $NF }'|tr "\n" " ")

### Remove all snapshots for a given project:
 $> docker ps -a |  grep -i $( echo ${PWD##*/} | sed 's%_%%g') | grep -i exited | awk '{print $1}' | xargs -i docker rm '{}'

## Remove all "none" docker images from server
* docker images |grep none|awk '{print $3}'| xargs -i docker rmi '{}'

## remove docker processes.
* docker stop  01630a27dae6  #hash ok docker ps  

## knowing space used by containers 

* docker ps --format "{{.ID}}" | xargs -i docker inspect '{}' | grep "json.log" | cut -d'"' -f4 | xargs -i du -sch '{}' | grep -v total | grep -v ^0 | grep -v ^4.0K
* docker ps |grep hashnumber


## dct build on container 
## change settings (database and rabbit)
## dct stop 
## rm exited containers.
## dct rmi other containers
## dct up -d


