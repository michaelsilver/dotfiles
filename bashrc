# color
export TERM="xterm-color"
#on lion this causes build output to turn black mysteriously so i've disabled it
#export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger' 
alias grep='grep --color'

#ls needs to be setup differently for osx vs std. linux with gnu ls
if echo $MACHTYPE | grep darwin > /dev/null
then
	alias ls="ls -G"
	export LSCOLORS="dxcxbAbAfxgxgAfAfAdAdA"
	#make mac os x do case insensitive file name globbing
	bind "set completion-ignore-case on"
else
    alias ls="ls --color=auto"
    #eval `dircolors "$SCRIPTS_DIR/.colourrc"`
fi

#write previous prompt to disk before showing prompt
export PROMPT_COMMAND="history -a"
if [ "$TERM" != 'dumb' ] && [ -n "$BASH" ] && [ -n "$PS1" ]
then
        #colors
          CYAN='\[\033[4;36m\]'
         CYAN2='\[\033[0;36m\]'
         PLAIN='\[\033[00m\]'
           RED='\[\033[4;31m\]'
          RED2='\[\033[0;31m\]'
          BLUE='\[\033[4;34m\]'
 
        PS1="\h$CYAN\w$CYAN2"
        #make host red for root
        if [ `/usr/bin/whoami` = 'root' ]
        then
                export PS1=$RED$PS1
        else
                export PS1=$BLUE$PS1
        fi
        #append return code with zero stripped
        PS1=$PS1\ $RED2'${?/0/}'$PLAIN\\n

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

# aliases to shorten paths
alias b='cd ~/Documents/Dropbox/Education/BUA/11th/2nd-semester'
alias gh='cd ~/Documents/GitHub/'

# Useful tricks:
alias d='mv ~/Downloads/* ./'
alias jd='fire ~/sunspotfrcsdk/doc/javadoc/index.html'
alias fuck='$(thefuck $(fc -ln -1))'

#aliases for os x applications
alias first='open /Applications/FirstClass.app/'
alias fire='open /Applications/Firefox.app/'
alias subl='open -a /Applications/Sublime\ Text\ 2.app'
alias e='open -a /Applications/Emacs.app/'
alias skm='open -a /Applications/Skim.app/'

# some other things:
if [ -f ~/.silver ] ; then
    source ~/.silver
fi

#eject all conneted volumes:
function eject_all
{
  find /Volumes -maxdepth 1 -not -user root -print0 | xargs -0 diskutil eject 
}

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

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Git Auto-complete 
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


test -r /sw/bin/init.sh && . /sw/bin/init.sh

# Homebrew Cask defaults in this environment variable
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

##
# Your previous /Users/michaelsilver/.bash_profile file was backed up as /Users/michaelsilver/.bash_profile.macports-saved_2015-01-26_at_12:29:17
##

# MacPorts Installer addition on 2015-01-26_at_12:29:17: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
