alias chrome='google-chrome'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias k=kubectl
complete -F __start_kubectl k
alias show-path='sed "s/:/\n/g" <<< "$PATH"'
