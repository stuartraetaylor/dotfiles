# Based on the example Ubuntu .bashrc 
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# History.
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Vi mode!
#set -o vi

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar
shopt -s autocd
shopt -s cdspell
shopt -s direxpand
shopt -s dirspell

bind 'set bell-style visible'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

eval "$(dircolors -b)"

# Colour aliases.
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lh='ls -lhF'
alias ta='tmux attach'

alias bashrc='source ~/.bashrc'

alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias gf='git fetch'
alias gp='git pull'
alias gm='git merge'
alias gb='git branch'

alias vir='vim -M'
alias f='fish'
alias rsync='rsync --progress'
alias less='less -R'

# Completion.
if [ -f /usr/share/bash-completion/bash_completion ]; then
. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

# Git completion.
[ -f /etc/bash_completion.d/git-prompt ] && source /etc/bash_completion.d/git-prompt

# Gradle completion.
[ -f /etc/bash_completion.d/gradle-completion.bash ] && source /etc/bash_completion.d/gradle-completion.bash

# Git prompt options.
if [ "$machine" != "MinGw" ]; then
    GIT_PS1_SHOWDIRTYSTATE=true      # unstaged (*) and staged (+)
    GIT_PS1_SHOWSTASHSTATE=true      # '$'
    GIT_PS1_SHOWUNTRACKEDFILES=true  # '%'
    GIT_PS1_SHOWCOLORHINTS=true
    GIT_PS1_SHOWUPSTREAM="verbose"
fi

# Prompt.
PS1='\[\033]0;\u@\h:${PWD//[^[:ascii:]]/?}\007\]' # set window title
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'\[\033[32m\]'       # change to green
PS1="$PS1"'\u'                 # 'user'
PS1="$PS1"'\[\033[0m\]'        # change to white
PS1="$PS1"'@'                  # '@'
PS1="$PS1"'\[\033[35m\]'       # change to purple
PS1="$PS1"'\h'                 # 'host'
PS1="$PS1"'\[\033[0m\]'        # change to white
PS1="$PS1"':'                  # ':'
PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
PS1="$PS1"'\w'                 # current working directory
PS1="$PS1"'\[\033[36m\]'       # change color to cyan
PS1="$PS1"'`__git_ps1`'        # Git bash function
PS1="$PS1"'\[\033[0m\]'        # change to white
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'$ '                 # '$'
