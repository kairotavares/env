#!/bin/bash

install_dependencies() {
sudo -E apt update
sudo -E apt install -y vim \
                    htop \
                    linux-firmware \
                    intel-microcode \
                    firefox \
                    i3* \
                    pavucontrol \
                    libreoffice \
                    openconnect \
                    openvpn \
                    pptp-linux \
                    network-manager* \
                    git \
                    curl \
                    smartmontools \
                    blueman \
                    feh \
                    parcellite \
                    virtualbox \
                    vagrant \
                    dmenu \
                    libpcap0.8-dev \
                    make \
                    lxappearance \
                    tmux \
                    nvidia-367 \
                    openjdk-8-jdk
}


install_docker() {

# Install docker-ce
sudo -E apt-get update

sudo -E apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl --proxy $http_proxy -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo -E add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo -E apt-get update
sudo -E apt-get install -y docker-ce

sudo groupadd docker
sudo usermod -aG docker $USER

# Install docker compose
curl --proxy $http_proxy -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" | sudo tee /usr/local/bin/docker-compose > /dev/null
sudo chmod +x /usr/local/bin/docker-compose
sudo service docker restart
}

install_golang() {
GO_BIN="go1.7.linux-amd64.tar.gz"
GOROOT=/usr/local/go

curl --proxy $HTTP_PROXY -L "https://storage.googleapis.com/golang/$GO_BIN" > $GO_BIN

sudo tar -xvf $GO_BIN
sudo mv go /usr/local

echo "export GOROOT=$GOROOT" >> ~/.bashrc
echo "export PATH=$GOROOT/bin:$PATH" >> ~/.bashrc
}

install_dark_theme() {
sudo -E add-apt-repository ppa:noobslab/themes
sudo -E apt-get update
sudo -E apt-get install arc-theme
}

install_dependencies
install_docker
install_golang
