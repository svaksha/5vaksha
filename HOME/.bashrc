#!/usr/bin/env bash
############################# METADATA #########################################
# FILENAME  : .bashrc
# TECHNICAL : Configuration file for BASH, save as ~/.bashrc to use.
# AUTHOR    : SVAKSHA <http://svaksha.com/pages/BIO>
# COPYRIGHT©: 2005-Now SVAKSHA (http://svaksha.com/pages/BIO) AllRightsReserved.
# LICENSE   : GNU AGPLv3 subject to all terms stated in the LICENSE.md file.
# REPOSITORY: http://svaksha.github.io/yaksha
# VERSION   : created:2005mar22, @svaksha, modified:2020jul14
############################# METADATA #########################################
#
# ~/.bashrc: executed by bash(1) for non-login shells. For examples
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# NOTES : LINKS for BASHRC samples, check github.com for more DOTFILES
# http://tldp.org/LDP/abs/html/sample-bashrc.html
#-------------------------------------------------------------------------------

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
### HISTORY
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹

# If not running interactively, don't do anything
#-------------------------------------------------------------------------------
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
#-------------------------------------------------------------------------------
export HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
#-----------------------------------------------
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#-------------------------------------------------------------------------------
HISTSIZE=50005
HISTFILESIZE=50005
export HISTTIMEFORMAT="%F[%H:%M] " # HISTTIMEFORMAT=’%c ‘ also does the same thing.

# After each command, save and reload history
#-------------------------------------------------------------------------------
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#-------------------------------------------------------------------------------
shopt -s checkwinsize

# Time, HistIgnore
#------------------------------
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTIGNORE="&:bg:fg:ll:h"
export HOSTFILE=$HOME/.hosts	# Put a list of remote hosts in ~/.hosts

# make less more friendly for non-text input files, see lesspipe(1)
#-------------------------------------------------------------------------------
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Debian Chroot
# set variable identifying the chroot you work in (used in the prompt below)
#-------------------------------------------------------------------------------
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Timeout
#-------------------------------------------------------------------------------
#timeout 10 "ls ${HOME}"

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Greetings, MOTD, etc...
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹

function _exit()	# function to run upon exit of shell
{
    echo -e "${RED}NAMASTE${NC}"
}
trap _exit EXIT


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# SOURCE(ing) will reload these BASH files to make changes active after editing
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
#
#source ~/.bash_aliases
#source ~/.bash_profile
source ~/.git-prompt.sh
source ~/.git-completion.bash
#-------------------------------------------------------------------------------
# ALIAS definitions and additions are in a separate file (see, ~/.bash_aliases).
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
#-------------------------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#-------------------------------------------------------------------------------
# https://github.com/jimeh/git-aware-prompt
# Display current Git branch name in the terminal, inside a Git working directory.
# Date: 2016mar17
#-------------------------------------------------------------------------------
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Process / system related functions:
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹

function host_zero()   # get current host related info
{
  echo -e "\nYou are logged on ${RED}$HOST"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Memory stats :$NC " ; free
  echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:-"Not connected"}
  echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:-"Not connected"}
  echo
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
### COLOURS
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
#
# set a fancy prompt (non-color, unless we know we "want" color)
#-------------------------------------------------------------------------------

# Define some colors first:
NC='\e[0m'              # Color Resets to NO Color state {{NC="\e[m"}}

# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BLACK='\e[1;30m'       # Black
RED='\e[1;31m'         # Red
GREEN='\e[1;32m'       # Green
YELLOW='\e[1;33m'      # Yellow
BLUE='\e[1;34m'        # Blue
PURPLE='\e[1;35m'      # Purple
CYAN='\e[1;36m'        # Cyan
WHITE='\e[1;37m'       # White

# Background
back_Black='\e[40m'       # Black
back_Red='\e[41m'         # Red
back_Green='\e[42m'       # Green
back_Yellow='\e[43m'      # Yellow
back_Blue='\e[44m'        # Blue
back_Purple='\e[45m'      # Purple
back_Cyan='\e[46m'        # Cyan
back_White='\e[47m'       # White

# Looks best on a black background.....
#-------------------------------------------------------------------------------
echo -e "${BLUE}This is BASH ${YELLOW}${BASH_VERSION%.*}\
${BLUE} - DISPLAY on ${YELLOW}$DISPLAY${NC}\n"
date
if [ -x /usr/games/fortune ]; then
    /usr/games/fortune -s     # makes our day a bit more fun.... :-)
fi


case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#-------------------------------------------------------------------------------
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
    #---------------------------------------------------------------------------
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# define color to additional file types
#-------------------------------------------------------------------------------
export LS_COLORS=$LS_COLORS:"*.wmv=01;35":"*.wma=01;35":"*.flv=01;35":"*.m4a=01;35"


#-------------------------------------------------------------------------------
# LINKS for COLOR CHART,
# http://www.arwin.net/tech/bash.php
# http://ubuntugenius.wordpress.com/2011/07/11/how-to-change-the-command-line-prompt-colour-in-the-ubuntulinux-terminal/
#-------------------------------------------------------------------------------
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]स्व\[\033[01;31m\]@क्ष\[\033[01;33m\]:\[\033[00;36m\]\w\[\033[0;37m\]\$ '
else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}svaksha@kheops:\w\$ '
fi
unset color_prompt force_color_prompt


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
### XTERM
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
export TERM=xterm-256color
export PROMPT_COMMAND="history -a; history -n"

# If this is an xterm set the title to user@host:dir
#-------------------------------------------------------------------------------
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
#########      Customize DEVEL ENVS                                   ##########
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
#
#-------------------------------------------------------------------------------
# GCC
#-------------------------------------------------------------------------------
# Enable gcc colours, available since gcc 4.8.0
export GCC_COLORS=1


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
## DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS DVCS
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
#
### GIT configurations || DATE: 2010feb22-2014dec30
#-------------------------------------------------------------------------------
git config --global user.name "SVAKSHA"
git config --global user.email svaksha@gmail.com
git config --global http.sslVerify false


#-------------------------------------------------------------------------------
# enable programmable completion features (Don't need to enable this, if it's
# already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
#-------------------------------------------------------------------------------
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
### PATH ### PATH ### PATH ### PATH ### PATH ### PATH ### PATH ### PATH ### PATH
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## GO: https://golang.org/doc/code.html ## GO: https://golang.org/doc/code.html
## DATE: 2015oct15-2015oct22
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# JavaScript PATH | created: 2012Nov11 | updated: 2015Jul14
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#export PATH="$(pwd)/usr/local/bin/grunt:$PATH"
#export PATH="$(pwd)/usr/local/lib/node_modules/grunt-cli:$PATH"


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# JULIA Symbolic links PATH
# DATE: 2012apr12-2017jul21
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
export PATH="$(pwd)/julia:$PATH"
$PWD/julia/bin
#export PATH="$(pwd)/devya/:$PATH" # devel work code
#export PATH="$(pwd)/divya/:$PATH" # devel code

# Concurrently install two versions of Julia. Check the juliarc file instead.
#-------------------------------------------------------------------------------
#sudo ln -s $(pwd)/julia /usr/local/lib/julia # symbolic link to julia

# The environment variable JULIA_PKGDIR can also do the above - install two versions of Julia.
#sudo export JULIA_PKGDIR=/usr/local/julia/julia-packages
#ENV["JULIA_PKGDIR"] = "..."

# Paths for other Julia packages
#-------------------------------------------------------------------------------
## jdp == DeclarativePackages.jl
export PATH="$(pwd)/julia/bin/jdp:$PATH"
PATH=$PATH:$(pwd)/julia/bin/jdp

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
### PYTHON
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# COMMAND LINE ENVIRONMENT, https://docs.python.org/3/using/cmdline.html
#-------------------------------------------------------------------------------
# set the Environment variable PYTHONSTARTUP to point to the start up script
# NOTE: PYTHONSTARTUP does *not* expand "~", so you have to put in the
# full path to your home directory.
export PATH="$HOME/:$PATH"
export PYTHONSTARTUP="$HOME/.pythonrc.py"
#export PYTHONSTARTUP=~/.pythonrc.py
export PYTHON_HISTORY_FILE="$HOME/.python_history"

#-------------------------------------------------------------------------------
# DATE: 2017sept22
#-------------------------------------------------------------------------------
# added by Anaconda3 4.4.0 installer
export PATH="$HOME/anaconda3/bin:$PATH"

# command to delete bytecode (.pyc) files, works with the global alias file
#-------------------------------------------------------------------------------
export PYTHONDONTWRITEBYTECODE=true # REF: https://twitter.com/wlonk/status/587431447222444033

### PIP bash completion start
# DATE: Fri, 03 May 2013 16:02:40 +0530
#-------------------------------------------------------------------------------
_pip_completion()
{
COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
COMP_CWORD=$COMP_CWORD \
PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
### PostgreSQL configurations.
# DATE: 2009jan26-2015aug25
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
export PATH=$PATH:/usr/local/pgsql/bin
PATH=$PATH:/usr/local/pgsql/bin
MANPATH=$MANPATH:/usr/local/pgsql/man
export PATH MANPATH
# Setting LD_LIBRARY_PATH in a bash shell
LD_LIBRARY_PATH=/usr/local/pgsql/lib
export LD_LIBRARY_PATH

