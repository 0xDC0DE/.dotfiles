# ~/.bashrc: executed by bash(1) for non-login shells.G
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Function definitions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# login secrets
if [ -f ~/.bash_logins ]; then
    . ~/.bash_logins
fi
# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -x /usr/bin/mint-fortune ]; then
     /usr/bin/mint-fortune
fi

# minimalist prompt
PS1='${debian_chroot:+($debian_chroot)}\[$(tput setaf 4)\]\u\[$(tput setaf 6)\] $(parse_git_branch)\[$(tput setaf 2)\] > \[$(tput sgr0)\] '

# terminal title
PROMPT_COMMAND='echo -en "\033]0;$(whoami)@$(hostname):$( pwd|cut -d "/" -f 4-100 ) \a"'

# vi in terminal, use ctrl+v
set -o vi

# shopt options
# Entering a directory name as a bare word will change into that directory
shopt -s autocd
# Automatically correct off-by-one typing mistakes when changing directories
shopt -s cdspell
# Make Bash wrap text properly if the terminal size changes
shopt -s checkwinsize
# Store multi-line commands in shell history as one-liners for easy editing
shopt -s cmdhist
# Correct off-by-one typing mistakes when tab-completing directories
shopt -s dirspell
# Allow aliases to be expanded even in non-interactive sessions
shopt -s expand_aliases
# Don't try to complete on empty lines
shopt -s no_empty_cmd_completion
# Globs won't consider case
shopt -s nocaseglob
# Globs will consider hidden files, too
shopt -s dotglob

# Base 16 color schemes
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/p/.sdkman"
[[ -s "/home/p/.sdkman/bin/sdkman-init.sh" ]] && source "/home/p/.sdkman/bin/sdkman-init.sh"
[ -f ~/.fzf.colors ] && source ~/.fzf.colors


export ANDROID_HOME=~/Library/Android/sdk/
export PATH=$PATH:~/android-sdks/platform-tools/
export PATH=$PATH:~/android-sdks/tools/
export PATH="$HOME/Library/Haskell/bin:$PATH"
