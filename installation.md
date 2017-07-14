## Docker install on a raspberry pi 3. 

* $ curl -s https://packagecloud.io/install/repositories/Hypriot/Schatzkiste/script.deb.sh | sudo bash
* $ sudo apt-get install docker-hypriot=1.10.3-1
* $ sudo sh -c 'usermod -aG docker $SUDO_USER'
* $ sudo systemctl enable docker.service
* $ systemctl unmask docker.service
* $ systemctl unmask docker.socket
* $ systemctl start docker.service



# docker instalation in a Linux OS

```
#!/usr/bin/env bash
GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"


echo "==> ${GREEN}UPDATE BASE PACKAGES ${RESET} (1/8)"
apt-get update
KERNEL=$(dpkg -l | grep "linux-image-[0-9]" | awk '{print $2}')
apt-mark hold $KERNEL
apt-get -o Dpkg::Progress-Fancy="1" -o Dpkg::Use-Pty="0" upgrade -y

echo "==> ${GREEN}CONFIGURE DOCKER REPOSITORY AND INSTALL DOCKER DEPEDENCIES ${RESET} (2/8)"
apt-get -o Dpkg::Progress-Fancy="1" -o Dpkg::Use-Pty="0" install -y apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list
apt-get update

echo "==> ${GREEN}INSTALL DOCKER ${RESET} (3/8)"
apt-get -o Dpkg::Progress-Fancy="1" -o Dpkg::Use-Pty="0" install -y docker-engine

echo "==> ${GREEN}INSTALL DOCKER-COMPOSE ${RESET} (4/8)"
curl -L https://github.com/docker/compose/releases/download/1.9.0-rc1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "==> ${GREEN}CONFIGURE DOCKER PROXY ${RESET} (5/8)"
mkdir -p /etc/systemd/system/docker.service.d/
echo -e "[Service]\nEnvironment=\"HTTP_PROXY=http://proxyip:8080\"\nEnvironment=\"HTTPS_PROXY=http://proxyip:8080\"" > /etc/systemd/system/docker.service.d/http-proxy.conf
systemctl daemon-reload
systemctl show --property Environment docker
systemctl restart docker


echo "==> ${GREEN}RUNNING HELLO-WORLD IMAGE ${RESET} (6/8)"
docker run hello-world

echo "==> ${GREEN}REMOVING HELLO-WORLD IMAGE ${RESET} (7/8)"
docker ps -a --format "{{.Names}}" | xargs -i docker rm '{}'
docker rmi hello-world

echo "==> ${GREEN}ALL DONE ! ${RESET} (8/8)"
```
