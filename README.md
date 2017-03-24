# Docker
Docker info, scripts and development

## Docker install on a raspberry pi 3. 

* $ curl -s https://packagecloud.io/install/repositories/Hypriot/Schatzkiste/script.deb.sh | sudo bash
* $ sudo apt-get install docker-hypriot=1.10.3-1
* $ sudo sh -c 'usermod -aG docker $SUDO_USER'
* $ sudo systemctl enable docker.service
* $ systemctl unmask docker.service
* $ systemctl unmask docker.socket
* $ systemctl start docker.service

