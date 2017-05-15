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
8 docker rmi tagdeapp

