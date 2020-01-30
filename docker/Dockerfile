FROM ubuntu:bionic

# Alias for ~
ENV HOME /home

# Work from ~
WORKDIR $HOME

# APT packages needed in order to install upstream dotfiles
RUN apt-get update && apt-get install -y git wget

# Adds .gitignore to ~ before cloning
RUN wget https://raw.githubusercontent.com/vapurrmaid/dotfiles/master/.gitignore

# Clone a bare repository stored in ~/.cfg
RUN git clone --bare https://github.com/vapurrmaid/dotfiles $HOME/.cfg

# These lines store Ubuntu defaults that conflict with upstream dotfiles in ~/.config-backup
RUN mkdir -p .config-backup
RUN /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | \
  egrep "\s+\." | \
  awk {'print $1'} | \
  xargs -I{} mv {} .config-backup/{}

RUN /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
RUN ./scripts/install.sh
