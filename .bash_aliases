alias cgroot='cd $(groot)'
alias chrome='google-chrome'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias docker-bash='docker exec -it $(docker ps -q) bash'
alias docker-clean-img='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias show-path='sed "s/:/\n/g" <<< "$PATH"'
alias upgradable='sudo apt list --upgradable'
alias upgrade='sudo apt upgrade'
