# general Docker usage

* docker run
* docker start
* docker ps
* docker images
* docker rm
* docker rm1
* docker inspect
* docker attach
* docker events 
* docker ps -a | grep -i ${PWD##*/} | grep -i exited | awk '{print $1}' | xargs -i docker rm '{}'

