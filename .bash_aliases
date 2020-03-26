alias chrome='google-chrome'
alias clean-docker='docker system prune -a'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias k=kubectl
complete -F __start_kubectl k
alias show-path='sed "s/:/\n/g" <<< "$PATH"'
