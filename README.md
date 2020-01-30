# Vapurrmaid's Dotfiles :wrench:

Configurations that should be tracked for consistency across different machines.

> **Warning**: Some of these configurations may be specific to me and my credentials (such as my username)

## Requirements

The following are needed if the [Installation](#installation) step is used verbatim. For a complete
manual install, `git` is all that's needed.

- `awk`
- `git`
- `grep`
- `xargs`
- `wget`

## Installation

There are 2 options:

1. Full Install (recommended on local machines)
2. Partial Install (recommended in containers or other virtualized environments)

To fully install, follow the script below. This script will add a `.gitignore` to your `~` directory.
It will then clone a bare repository into `~/.cfg` and backup your current dotfiles in a directory
called `.config-backup`. Lastly, it will run a full installation. I you'd like to run a partial
installation, just call `./scripts/install.sh` without the `--full-install` flag.

```bash
cd $HOME
wget https://raw.githubusercontent.com/vapurrmaid/dotfiles/master/.gitignore
git clone --bare https://github.com/vapurrmaid/dotfiles $HOME/.cfg
mkdir -p .config-backup
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | \
    egrep "\s+\." | \
    awk {'print $1'} | \
    xargs -I{} mv {} .config-backup/{}

/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
./scripts/install.sh --full-install
```

## Try It Out With Docker! :whale:

```bash
docker build -t vapurrmaids-dotfiles https://raw.githubusercontent.com/vapurrmaid/dotfiles/master/docker/Dockerfile
docker run -it vapurrmaids-dotfiles bash
```
