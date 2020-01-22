# It is intended that the following script may be used to automate installation
# of programs on Ubuntu.

# CLI Utilities
sudo apt install curl
sudo apt install xclip
sudo apt install jq

# DisplayLink USB Graphics
sudo apt install dkms

# Docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker $USER
newgrp docker

# Git
sudo apt install git

# Go/GVM
sudo apt-get install curl git mercurial make binutils bison gcc build-essential
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# Kubernetes
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Node
sudo apt install npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash # installs a specific version of nvm. Should be modified.

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - # this and the following are for yarn
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install --no-install-recommends yarn

# Peek (GIF Screen Recorder)
sudo add-apt-repository ppa:peek-developers/stable
sudo apt update
sudo apt install peek

# Vim
sudo apt install vim
