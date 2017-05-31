# color
export TERM="xterm-color"
alias grep='grep --color'

# ls needs to be setup differently for OSX (BSD) vs. Linux (GNU)
# Also separating Mac and Linux things
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    export LSCOLORS="dxcxbAbAfxgxgAfAfAdAdA"
    alias ls="ls -G"

    # aliases to shorten paths
    alias gh='cd ~/Documents/GitHub/'

    # Useful tricks:
    alias d='mv ~/Downloads/* ./'
    alias jd='chrome ~/wpilib/java/current/javadoc/index.html'

    #aliases for os x applications
    alias chrome='open /Applications/Google\ Chrome.app/'
    alias subl='open -a /Applications/Sublime\ Text\ 2.app'
    alias e='open -a /Applications/Emacs.app/'
    alias skm='open -a /Applications/Skim.app/'

    # Python virtualenv
    # set where virutal environments will live
    export WORKON_HOME=$HOME/.virtualenvs

    # Ex:  make; growl "make finished"
    # sends a notification center alert to remind you
    # requires: brew install terminal-notifier
    function growl() {
	      terminal-notifier -activate com.googlecode.iterm2 -message "$@"
    }

    #eject all conneted volumes:
    function eject_all
    {
	      find /Volumes -maxdepth 1 -not -user root -print0 | xargs -0 diskutil eject 
    }

    # Homebrew Cask defaults in this environment variable
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"

    # MacPorts Installer addition on 2015-01-26_at_12:29:17: adding an appropriate PATH variable for use with MacPorts.
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
    # Finished adapting your PATH environment variable for use with MacPorts.

    # PATH for brew
    export PATH=/usr/local/bin:/usr/local/sbin:$PATH
    export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

    # Extra scripts
    export PATH=~/.scripts:$PATH

    # brew autocompletion
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi

    # CHICKEN Scheme
    export CHICKEN_REPOSITORY=~/.chickeneggs/lib/chicken/6

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under Linux platform
    export LS_COLORS="di=33:ln=32:so=31;1:pi=31;1:ex=35:bd=36:cd=36;1:su=35;1:sg=35;1:tw=33;1:ow=33;1"
    alias ls="ls --color=auto"

    SSH_ENV=$HOME/.ssh/environment

    # Python virtualenv location set in ~/.silver

    # start the ssh-agent
    function start_agent {
	      echo "Initializing new SSH agent..."
	      # spawn ssh-agent
	      /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
	      echo succeeded
	      chmod 600 ${SSH_ENV}
	      . ${SSH_ENV} > /dev/null
	      /usr/bin/ssh-add
    }

    if [ -f "${SSH_ENV}" ]; then
	      . ${SSH_ENV} > /dev/null
	      ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
            start_agent;
	      }
    else
	      start_agent;
    fi
fi

bind "set completion-ignore-case on"

#write previous prompt to disk before showing prompt
export PROMPT_COMMAND="history -a"

#colors
CYAN='\[\033[0;36m\]'
PLAIN='\[\033[00m\]'
RED='\[\033[0;31m\]'
BLUE='\[\033[0;34m\]'
MAGENTA='\[\033[0;35m\]'

# Git Prompt
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
    PS1="\u@$BLUE\h$CYAN:\w\[\033[m\]$MAGENTA\$(__git_ps1)$PLAIN$ "
else
    PS1="\u@$BLUE\h$CYAN:\w$PLAIN$ "
fi

#make host red for root
if [ "$EUID" == 0 ]; then
    export PS1=$RED$PS1
else
    export PS1=$BLUE$PS1
fi

# setup
export EDITOR=emacs

# aliases to humanize bash
alias ll="ls -hal"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias du="du -h"
alias df="df -h"

# Use case-insensitive filename globbing
shopt -s nocaseglob > /dev/null
# Make bash append rather than overwrite the history on disk
shopt -s histappend > /dev/null
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s > /dev/null
# Don't put duplicate lines in the history.
export HISTCONTROL="ignoredups"
# Ignore some controlling instructions
export HISTIGNORE="[   ]*:&:bg:fg:exit"

# Git Auto-complete
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# some other things:
if [ -f ~/.silver ] ; then
    source ~/.silver
fi

# iTerm Shell Integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Python virtualenvs
# ensure all new environments are isolated from the site-packages directory
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# use the same directory for virtualenvs as virtualenvwrapper
export PIP_VIRTUALENV_BASE=$WORKON_HOME
# makes pip detect an active virtualenv and install to it
export PIP_RESPECT_VIRTUALENV=true
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

# added by travis gem
[ -f /Users/michaelsilver/.travis/travis.sh ] && source /Users/michaelsilver/.travis/travis.sh

# get common InfoLab settings:
[ -f ~start/common-bashrc ] && source ~start/common-bashrc
#THIS COMMENT LINE IS IMPORTANT - make sure to copy this too
