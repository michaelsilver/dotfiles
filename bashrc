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
    # alias b='cd ~/Documents/Dropbox/Education/BUA/11th/2nd-semester'
    alias b='cd /Users/michaelsilver/Documents/Dropbox/Education/BUA/College'
    alias gh='cd ~/Documents/GitHub/'

    # Useful tricks:
    alias d='mv ~/Downloads/* ./'
    alias jd='fire ~/sunspotfrcsdk/doc/javadoc/index.html'

    #aliases for os x applications
    alias fire='open /Applications/Firefox.app/'
    alias subl='open -a /Applications/Sublime\ Text\ 2.app'
    alias e='open -a /Applications/Emacs.app/'
    alias skm='open -a /Applications/Skim.app/'

    # Setting PATH for Python 2.7
    # The orginal version is saved in .bash_profile.pysave
    PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
    export PATH

    #eject all conneted volumes:
    function eject_all
    {
	find /Volumes -maxdepth 1 -not -user root -print0 | xargs -0 diskutil eject 
    }

    # Homebrew Cask defaults in this environment variable
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"

    ##
    # Your previous /Users/michaelsilver/.bash_profile file was backed up as /Users/michaelsilver/.bash_profile.macports-saved_2015-01-26_at_12:29:17
    ##

    # MacPorts Installer addition on 2015-01-26_at_12:29:17: adding an appropriate PATH variable for use with MacPorts.
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
    # Finished adapting your PATH environment variable for use with MacPorts.

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under Linux platform
    export LS_COLORS="di=33;40:ln=32;40:so=31;1;40:pi=31;1;40:ex=35;40:bd=36;40:cd=36;1;40:su=35;1;40:sg=35;1;40:tw=33;1;40:ow=33;1;40:"
    alias ls="ls --color=auto"
fi

bind "set completion-ignore-case on"

#write previous prompt to disk before showing prompt
export PROMPT_COMMAND="history -a"

#colors
CYAN='\[\033[0;36m\]'
PLAIN='\[\033[00m\]'
RED='\[\033[0;31m\]'
BLUE='\[\033[0;34m\]'

PS1="\u@$BLUE\h$CYAN:\w$PLAIN$ "
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

# some other things:
if [ -f ~/.silver ] ; then
    source ~/.silver
fi

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
export PATH=/usr/local/bin:$PATH

# Git Auto-complete 
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
