# color
export TERM="xterm-color"
alias grep='grep --color'
alias tmux='tmux -CC'

# ls needs to be setup differently for OSX (BSD) vs. Linux (GNU)
# Also separating Mac and Linux things
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    export BASH_SILENCE_DEPRECATION_WARNING=1

    export LSCOLORS="dxcxbAbAfxgxgAfAfAdAdA"
    alias ls="ls -G"

    # aliases to shorten paths
    alias gh='cd ~/Documents/GitHub/'

    # Useful tricks:
    alias d='mv ~/Downloads/* ./'
    alias jd='chrome ~/wpilib/java/current/javadoc/index.html'

    #aliases for os x applications
    alias chrome='open /Applications/Google\ Chrome.app/'
    alias fire='open /Applications/Firefox.app/'
    alias subl='open -a /Applications/Sublime\ Text.app'
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

    # PATH for brew
    export PATH=/usr/local/bin:/usr/local/sbin:$PATH
    export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

    # Extra scripts
    export PATH=~/.scripts:$PATH

    # brew autocompletion
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi

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

    # CHICKEN Scheme
    export CHICKEN_REPOSITORY=~/.chickeneggs/lib/chicken/6

    # RiseML
    export PATH=~/.riseml/bin:$PATH

    # Go
    export GOROOT="$(brew --prefix)/opt/go/libexec"

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under Linux platform
    export LS_COLORS="di=33:ln=32:so=31;1:pi=31;1:ex=35:bd=36:cd=36;1:su=35;1:sg=35;1:tw=33;1:ow=33;1"
    alias ls="ls --color=auto"

    # shell completion when using sudo
    complete -cf sudo

    SSH_ENV=$HOME/.ssh/environment

    # Python virtualenv location set in ~/.silver
    # when creating, set:
    # export WORKON_HOME=/path/where/you/want/.virtualenvs
    # export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python

    # Go
    if command -v go >/dev/null; then
        export GOROOT=`go env GOROOT`
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

# Minio Client Auto-complete
if [ -f ~/.mc-completion.bash ]; then
    . ~/.mc-completion.bash
fi

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# some other things:
if [ -f ~/.silver ] ; then
    source ~/.silver
fi

# iTerm Shell Integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# added by travis gem
[ -f /Users/michaelsilver/.travis/travis.sh ] && source /Users/michaelsilver/.travis/travis.sh

# get common InfoLab settings:
[ -f ~start/common-bashrc ] && source ~start/common-bashrc
#THIS COMMENT LINE IS IMPORTANT - make sure to copy this too

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/michaelsilver/google-cloud-sdk/path.bash.inc' ]; then source '/Users/michaelsilver/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/michaelsilver/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/michaelsilver/google-cloud-sdk/completion.bash.inc'; fi

# Go
if command -v go >/dev/null; then
    export GOPATH="${HOME}/.go"
    export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
fi
