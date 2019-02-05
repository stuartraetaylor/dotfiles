# Based on the example Ubuntu .bashrc 
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
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

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Colour aliases.
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ta='tmux attach'
alias gradle=./gradlew

if [ -f /usr/local/bin/thefuck ]; then
    eval $(thefuck --alias)
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Git completion.
if [ -f /etc/bash_completion.d/git-prompt ]; then
    source /etc/bash_completion.d/git-prompt
fi

# Git prompt options.
GIT_PS1_SHOWDIRTYSTATE=true      # unstaged (*) and staged (+)
GIT_PS1_SHOWSTASHSTATE=true      # '$'
GIT_PS1_SHOWUNTRACKEDFILES=true  # '%'
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWUPSTREAM="verbose"

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

