# list 
alias ll='ls -alFGP'
alias la='ls -AGP'
alias l='ls -CFGP'
alias ls='ls -CFGP'

# other vim installation
alias vim="/usr/local/bin/vim"

# single letters
alias c="clear"
alias g="git"
alias go="git"
alias v="vim"
alias p="cd ~ && pwd"
alias s="cd /Users/p/SCW/Git/Rules && pwd"
alias scw="cd /Users/p/SCW/Git && pwd && ls"
alias h="history"
alias j="jobs -l"

# vim
alias vi=vim
alias svi="sudo vi"
alias vis="vim '+set si'"
alias edit="vim"

# haskell
alias haskell="ghci"
alias ha="ghc"

# directory traversal
alias ..="cd .."
alias ...='cd ../..'
alias cd..="cd .."

# pipe to clipboard because I keep forgetting the actual command
alias clipboard="pbcopy"

# because I am forgetful
alias apt-get="sudo apt-get"
alias diff="colordiff"
alias ping="ping -c 5"
alias fasting"=ping -c 100 -s.2"
alias ipadd="ip"

# more
alias ports='netstat -tulanp'

#copy working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy' 

# tmux
alias tmuxk='tmux kill-session -t'
alias tmux="TERM=screen-256color-bce tmux"
alias tmuxls="tmux ls"
alias rules="tmuxs Rules"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

