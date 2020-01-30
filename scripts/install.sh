#!/bin/bash

# It is intended that the following script may be used to automate installation
# of programs. It is currently only tested on the Ubuntu:bionic platform.
#
# Usage: ./install.sh [-f | --full-install]

set -euo pipefail

# If FULL_INSTALL is set to PARTIAL, then certain items are skipped. This is
# useful for denoting items that shouldn't/can't be installed in Docker,
# CI or similar environments.
INSTALLATION_TYPE="PARTIAL"

if [[ ${1-} == "-f" ]] || [[ ${1-} == "--full-install" ]]; then
    INSTALLATION_TYPE="FULL"
    echo "Executing a full installation"
else
    echo "Executing a partial installation"
fi

# Basic installations. These are either dependencies for others, or do not
# require further actions to be taken. Must first install
# software-properties so that add-apt-repository can be called
apt install -y software-properties-common
apt update

add-apt-repository -y ppa:git-core/ppa
add-apt-repository -y ppa:peek-developers/stable
apt update
apt upgrade -y
apt install -y \
    binutils \
    bison \
    build-essential \
    curl \
    gcc \
    golang-go \
    git \
    jq \
    make \
    mercurial \
    npm \
    peek \
    vim \
    xclip

# DisplayLink USB Graphics requires dkms
if [ "$INSTALLATION_TYPE" == "FULL" ]; then
    apt install -y dkms
fi

# Docker
if [ "$INSTALLATION_TYPE" == "FULL" ]; then
    apt install -y apt-transport-https ca-certificates gnupg-agent
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
    apt update
    apt install -y docker-ce docker-ce-cli containerd.io
    
    # following creates a docker user so that sudo is not required
    usermod -aG docker $USER
    newgrp docker
fi

# Go/GVM
if [ "$INSTALLATION_TYPE" == "FULL" ]; then
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
fi

# Kubernetes
if [ "$INSTALLATION_TYPE" == "FULL" ]; then
    apt-get update && apt-get install -y apt-transport-https
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
    apt-get update
    apt-get install -y kubectl
fi

# NVM
if [ "$INSTALLATION_TYPE" == "FULL" ]; then
    # installs a specific version of nvm. Should be modified.
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
fi

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt update && apt install --no-install-recommends yarn

# Postgres (see https://wiki.postgresql.org/wiki/Apt#Quickstart)
touch /etc/apt/sources.list.d/pgdg.list  # if pkg sources are needed
apt install -y postgresql-common
sh /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
apt update
apt install pgadmin4
