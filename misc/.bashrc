export TERM=xterm-256color

alias ls='ls --color=auto'
alias mv='mv -i'
alias cp='cp -i' alias pacman='pacman --needed'
alias svndiff='svn diff --diff-cmd=colordiff'

PS1='[\u@\h \W]\$ '
export manpath=

bind '"\e[Z":menu-complete'

alias df='df -h'

export SVN_EDITOR=vim
export JAVA_HOME=/opt/java/

#export ftp_proxy=http://10.131.1.124:808
#export http_proxy=http://10.131.1.124:808
export ftp_proxy=
export http_proxy=

export PATH=${PATH}:/home/wyx/source/nativeclient/src/nacl/depot_tools:/usr/local/bin

# stty -ixoff -ixon

export IDIR=~/simplescalar 
export ODIR=~/simplescalar 
export CILHOME=/home/wyx/cil

export PS1='\[\e[38;5;39m\][\u@\h \W]\$\[\e[0m\] '

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

