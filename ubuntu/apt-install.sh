#!/usr/bin/env bash
.ONESHELL:
SHELL := /bin/bash
############################ METADATA ##########################################
#1.PROGRAM   : apt-install.sh
#2.COPYRIGHT©: 2005-Present, SVAKSHA, http://svaksha.github.io/yaksha
#3.AUTHOR    : SVAKSHA, http://svaksha.com/pages/Bio
#4.LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE file:
#              https://github.com/svaksha/yaksha/blob/master/LICENSE.md
#5.REPOSITORY: http://svaksha.github.io/yaksha
#6.TECHNOTES : Bash script to install packages on a fresh Ubuntu system.
#              Installs all the packages in <1 hour on a good internet bandwidth.
#7.DATE(S)   : 2005mar22-2019feb04
################################################################################
#
# References:
# https://github.com/svaksha/aksh/blob/master/cs-debian.md
# https://github.com/svaksha/aksh/blob/master/cs-devops.md
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹

yaksha_dir=~/yaksha/ubuntu

# DEBUG your BASH script 
# From, https://twitter.com/b0rk/status/1312413779951595531
trap '(read -p "[$BASH_SOURCE:§LINENO] $BASH_COMMAND?")' DEBUG


# Log the date and time of execution of bash script into the `out` files.

date +"%c|started running $(apt): " >> out-apt-install.log
date +"%c|completed running: $?" >> out-apt-install.log

# The SET bulletin
# Tip: Using "+" causes these flags to be turned off.
set -a  # Mark variables which are modified or created for export.
set -b  # Notify of job termination immediately.
# Unless you want to babysit the installation process for each package dont use this.
#set -e  # Exit immediately if a command exits with a non-zero status.
set -m  # Job control is enabled.
set -v  # Verbose mode to print shell input lines as they are read.
set -x  # Print commands and their arguments as they are executed.

# Set debug mode
#exec 5> >(logger -t $0) # uses logger command
#BASH_XTRACEFD="5"
#PS4='$LINENO: '


# Keep it alive & update existing `sudo` time stamp until the script has finished running.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# UBUNTU package utilities
# Check for release names: https://wiki.ubuntu.com/Releases
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_ubuntu() {
    sudo apt -y install wget
    sudo apt -y install curl
    sudo apt -y install whois
    sudo apt -y install zip
    sudo apt -y install unzip
    sudo apt -y install unrar
    # sendmail or postfix
    sudo apt -y install sendmail
    sudo apt -y install postfix
    # universal packaging system
    sudo apt -y install flatpak
    sudo apt install gnome-software-plugin-flatpak
    # SSH
    sudo apt -y install openssh-server
    sudo apt -y install cron-apt
    # BASH script checker: http://m.jakstys.lt/tech/2016/08/bash
    sudo apt -y install shellcheck
    # https://askubuntu.com/questions/892076/how-to-selectively-purge-old-kernels-all-at-once/892077#892077
    sudo apt -y install dialog # DEP of server version of "rm-kernels-server"
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# AUDIO VIDEO utilities
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_vani() {
    sudo apt -y install audacity
    sudo apt -y install alsamixer
    sudo apt -y install Rhythmbox
    sudo apt -y install isomaster
    sudo apt -y install pavucontrol
    sudo apt -y install gTranscribe
    sudo apt -y install transcriber # for manual transcription
    sudo apt -y install vokoscreen #screencasting
    #
    #---------------------------------------------------------------------------
    ## media codecs, video and audio (music - mpto mp3) converters
    #---------------------------------------------------------------------------
    sudo apt -y install papcl
    sudo apt -y install ubuntu-restricted-extras # install the MP3 codec from the Ubuntu Restricted Extras package
    sudo apt -y install soundconverter # install the Sound Converter program
    # get the github source (https://github.com/rg3/youtube-dl)
    sudo pip3 install youtube_dl    # sudo pip install --upgrade youtube_dl  #(to upgrade if its already installed)
    # Taking Notes
    sudo apt -y install tomboy transmission
    ## Communication Tools
    sudo apt -y install jitsi # Skype alternative
    # STARTUP DISK CREATOR
    sudo apt -y install unetbootin
    # Time Tracker, https://github.com/TailorDev/Watson
    sudo pip3 install td-watson
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Gnome general system utilities
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_gnome() {
    #---------------------------------------------------------------------------
    # Tweak Clock settings in 18.04
    #---------------------------------------------------------------------------
    sudo apt -y install gnome-tweak-tool
    #---------------------------------------------------------------------------
        ## general cli tools for web, search
    #---------------------------------------------------------------------------
    sudo apt -y install silversearcher-ag
    sudo apt -y install ctags
    sudo apt -y install exuberant-ctags ack-grep
    sudo apt -y install screen
    ln -s  ${yaksha_dir}.screenrc ~/.screenrc # copy the old file, dont create new one
    ## Tools for dependency check and PPA removal
    sudo apt -y install equivs
    sudo apt -y install ppa-purge
    sudo apt -y install nmap
    # SSH
    sudo apt -y install sshpass
    # Install Augeas - http://augeas.net/download.html
    # An editing tool API to automate the configuration editing on remote servers.
    #---------------------------------------------------------------------------
    sudo apt -y install augeas-dbg python3-augeas augeas-tools augeas-lenses
    #
    #---------------------------------------------------------------------------
    ## UTILITIES
    #---------------------------------------------------------------------------
    ## BibTeX Reference software
    sudo apt -y install pybliographer
    sudo apt -y install referencer    #IGNORE, https://launchpad.net/referencer
    # hierarchical notebook : http://hnb.sourceforge.net/Documentation/
    sudo apt -y install hnb
    #-----------------------------------------------
    # PDF Editor - package dependencies
    # http://www.ubuntugeek.com/list-of-pdf-editing-tools-for-ubuntu.html
    #-----------------------------------------------
    sudo apt -y install pdfedit
    sudo apt -y install flpsed pdftk
    sudo apt -y install pdfjam
    sudo apt -y install xournal
    sudo apt -y install cups-pdf
    # PDF to MarkDown
    # http://www.howtogeek.com/228531/how-to-convert-a-pdf-file-to-editable-text-using-the-command-line-in-linux/
    sudo apt -y install poppler-utils
    # Markdown to PDF conversion - JS tool (better than the py tool 'grip')
    sudo npm install -g markdown-pdf
    # Markdown to PDF conversion - Python tool
    sudo pip3 install grip
    ## HP printer stuff
    sudo apt -y install hplip
    sudo apt -y install mtink  # http://xwtools.automatix.de/
    sudo apt -y install hp-toolbox
    sudo apt -y install hp-setup
    sudo apt -y install hplip-plugin
    ## Reactivate HP LaserJet 1018/1020 after reloading paper
    sudo apt -y install printer-driver-foo2zjs-common   #20140209dfsg0-1kubuntu1
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Git, LibreOffice and Diff
# http://stackoverflow.com/questions/8795538/how-to-share-odt-doc-documents-over-git
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_databinary() {
    sudo apt -y install odt2txt
    sudo apt -y install oodiff

}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# HARDWARE: CPU and HDD utils
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
hardware_utils() {
    ## CPU / HDD health monitoring
    sudo apt -y install smartctl
    sudo apt -y install smartmontools
    sudo apt -y install gsmartcontrol   # GUI version
    sudo apt -y install testdisk gddrescue  # grub rescue / HDD health
    # CPU Monitoring tools for Temperature, speed, et al.
    #------------------------------------------------------
    # https://wiki.ubuntu.com/Kernel/PowerManagement/ThermalIssues
    sudo apt -y install thermald  # this daemon prevents machines from overheating
    sudo apt -y install indicator-cpufreq
    sudo apt -y tlp tlp-rdw # start with 'sudo tlp start'
    echo "This machine is currently being installed with important system packages!"
    sleep 1
    ## Sensors package to monitor the disk temperature
    sudo apt -y install lm-sensors
    sudo apt -y install powertop
    sudo apt -y install atop
    sudo apt -y install linux-tools-common # AKA, "perf": http://www.brendangregg.com/perf.html
    sudo apt -y install simplescan
    ## Memory management
    sudo apt -y install lowmem        # free memory for lowmem install
    sudo apt -y install lowmemcheck   # detect low-memory systems and enter lowmem mode
    sudo apt -y install memstat
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
## DATABASE packages
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_database() {
#    sudo apt -y install mariadb
    sudo apt -y install sqlite3
    ## PostgreSQL
:   sudo apt -y install postgresql-9.6 #core database server
    sudo apt -y install postgresql-client-9.6 # client libraries and client binaries
    sudo apt -y install postgresql-contrib-9.6 # additional supplied modules
    sudo apt -y install libpq-dev # libraries and headers for C language frontend development
    sudo apt -y install postgresql-server-dev-9.6 # libraries and headers for C language backend development
    sudo apt -y install pgadmin3 # pgAdmin III graphical administration utility

    ## Distributed File Systems
    sudo apt -y install hdf5-tools
    sudo apt -y install hdf-compass

#-----------------------------------
# Array databases : MonetDB
# https://www.monetdb.org/downloads/deb/
#-----------------------------------
:'
wget --output-document=- https://www.monetdb.org/downloads/MonetDB-GPG-KEY | sudo apt-key add -
'
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
## DATA_FORMATS : RDF
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_df_rdf() {
    # Anything To Triples (any23) is a library, a web service and a command line
    # tool that extracts structured data in RDF format from a variety of Web documents.
    # SETTINGS SECTION
    CODE_BASE=src
    INSTALL_DIR=/usr/local/bin
    ANY23_VERSION=2.2 # check the site for exact versions, https://any23.apache.org/

    # END OF SETTINGS SECTION
    # Does the source base directory exist? No? Well, create it!
    cd ~
    if [[ ! -d "$CODE_BASE" ]] ; then
        mkdir "$CODE_BASE"
    fi
    cd "$CODE_BASE"

    sudo apt install -y ruby # first we install Ruby and RubyGems
    sudo gem install rdf2json # then install rdf2json
    # Install Apache Any23, https://any23.apache.org/
    wget http://ftp.jaist.ac.jp/pub/apache/any23/1.1/apache-any23-core-${ANY23_VERSION}.tar.gz
    tar xzf apache-any23-core-${ANY23_VERSION}.tar.gz
    cd apache-any23-core-${ANY23_VERSION}
    chmod 700 bin
    if [[ -f "$INSTALL_DIR/any23" ]] ; then
        sudo rm -f "$INSTALL_DIR/any23"
    fi
    sudo ln -s "`pwd`/bin/any23" "$INSTALL_DIR/any23"
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
## DVCS packages
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_dvcs() {
    sudo apt -y install git git-core
    sudo apt -y install tig
    # sudo apt -y install deb file for git-lfs {{https://github.com/github/git-lfs.git}}
    sudo apt -y install mercurial
    sudo apt -y install tortoisehg
    sudo apt -y install bazaar
    sudo apt -y install subversion
    ln -s  ${yaksha_dir}.gitconfig ~/.gitconfig
    # https://github.com/jimeh/git-aware-prompt
    # Display current Git branch name in your terminal prompt when in a Git working directory.
    mkdir ~/.bash
    cd ~/.bash
    git clone git://github.com/jimeh/git-aware-prompt.git
    #------------------------------------------------
    # GIT-LFS installation: https://git-lfs.github.com/
    #------------------------------------------------
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
    sudo apt install git-lfs
    #---------------
    # Gitsome : https://github.com/donnemartin/gitsome#installation
    #---------------
    sudo pip3 install gitsome # stable version from PyPI
    # pip3: Depending on your system, you might need to run pip3, possibly with the -H flag:
    #sudo -H pip3 install gitsome
    # Master from GitHub source with changes not yet pushed to PyPI:
    #sudo pip3 install git+https://github.com/donnemartin/gitsome.git
    #---------------
    # GitKraken : https://www.gitkraken.com/download
    #---------------
:'    curl -s https://release.gitkraken.com/linux/gitkraken-amd64.deb
    cd ~/home; sudo dpkg --install gitkraken-amd64.deb
'
    sudo apt -y update
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# EDITORS
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_editors() {
    ## IDE for GNOME to support GTK+, GLib, APIs
    #---------------------------------------------------------------------------
    sudo apt -y install builder
    #  sudo apt -y install dconf-tools # Editor for Gnome tools.
    sudo apt -y install emacs
    sudo apt -y install geany
    sudo apt -y install guake
    sudo apt -y install meld  # comparison tool for GNOME
    sudo apt -y install scite
    sudo apt -y install spyder
    # CLI text editors for sysadmins working on remote Linux/Unix servers.
    sudo apt -y install nano
    sudo apt -y install pico
    sudo apt -y install vim
#---------------------------------------------------------------------------
:'    # Atom editor 64-bit DEB file from github source
#---------------------------------------------------------------------------
    wget https://github.com/atom/atom/releases/download/v1.6.0/atom-amd64.deb ~/home
    cd ~/home; sudo dpkg --install atom-amd64.deb
    #---------------------------------------------------------------------------
    ## BRACKETS IDE for 64-bit
    #---------------------------------------------------------------------------
    # sudo dpkg --install Brackets.1.4.Extract.64-bit.deb
'
    #--------------------------------
    ## LaTeX2ε
    #--------------------------------
    sudo apt -y install texlive texlive-latex-extra
    # Latex Fonts support
    sudo apt -y install texlive-fonts-recommended
    sudo apt -y install texlive-fonts-extra
    sudo apt -y install texlive-lang-cyrillic scalable-cyrfonts-tex
    # for technical/scientific posters.
    sudo apt -y install texlive-science
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Fonts
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_fonts() {
    sudo apt -y install ttf-mscorefonts-installer # Microsoft fonts for Libreoffice.
:'    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    mkdir -p ~/.fonts
    mv PowerlineSymbols.otf ~/.fonts/
    mkdir -p ~/.config/fontconfig/conf.d
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
    fc-cache -vf ~/.fonts/
'
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# GCC {{ C, CPP, Fortran }}
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_gcc() {
    echo "GCC (and its variant packages) installation is in progress!"
    ## C/C++
    sudo apt -y install gcc
    sudo apt -y install gnu
    sudo apt -y install make
    sudo apt -y install gnu-make
    sudo apt -y install cmake
    sudo apt -y install libncurses5-dev
    sudo apt -y install cmake-curses-gui
    sudo apt -y install clang
    sudo apt -y install g++
    ## Fortran
    sudo apt -y install gfortran
    sudo apt -y install m4
    sudo apt -y install patch
    ## BOOST
    sudo apt -y install fftw-dev
    sudo apt -y install libtiff4-dev
    sudo apt -y install openexr
    sudo apt -y install libboost
    sudo apt -y install fftw3-dev
    sudo apt -y install liblemon
    sudo apt -y install libpng-dev
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# GO language : https://golang.org/doc/code.html
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_go() {
    sudo apt -y install golang # Go compiler - METApackage
    sudo apt -y install golang-go.net-dev # supplementary networking dev libs
    sudo apt -y install golang-go.tools # supplementary Go tools
    sudo apt -y install golang-go.tools-dev # suppl. Go tools - development
    sudo apt -y install dh-golang # debhelper add-on for packaging software written in Go (golang)
    sudo apt -y install gccgo-go # Go compiler over GCC
    sudo apt -y install golang-bindata-dev # embed data in a Go program - library package
    sudo apt -y install golang-doc # Go programming language compiler - documentation
    sudo apt -y install golang-go # Go programming language compiler
    # dependency tool for go
    wget https://github.com/tools/godep.git ~/home
    # Database drivers
    sudo apt -y install golang-pq-dev # pure Go postgres driver for Go’s database/sql package
    sudo apt -y install golang-gosqlite-dev # Trivial sqlite3 binding for Go (development files)
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# GRAPHICS, IMAGE PROCESSING, COMPUTER VISION, MACHINE VISION
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_graphics() {
    ## medical imaging
    sudo apt -y install aeskulap
    sudo apt -y install Ginkgo-CADx
    #sudo apt -y install gimp ## Gimp Image Editor
    sudo apt -y install inkscape   # Can process raster SVG images
    sudo apt -y install imagemagick -with--libtiff
    #-----------------------------------------------------------
    ## Image processing tools and libraries :: https://wiki.ubuntu.com/UbuntuGIS
    #-----------------------------------------------------------
    sudo apt -y install colordiff
    # GRASS for geospatial data management, image processing, graphics/maps production, spatial modeling, and visualization.
    sudo apt -y install grass
    #--------------------------------
    # GIS
    #--------------------------------
:'    sudo apt -y install postgis    # PG driver for GIS
    sudo apt -y install QuantumGIS
'
    # Mapserver
    sudo apt -y install cgi-mapserver mapserver-bin
    # Language bindings for mapserver
    sudo apt -y install python-mapscript perl-mapscript php4-mapscript php5-mapscript
    sudo apt -y install libterralib1c2a  # Terralib
    #-----------------------------------------------------------
    ## Unified Modeling Language (UML) Tools
    # http://askubuntu.com/questions/9405/what-uml-unified-modelling-language-tools-are-available
    #-----------------------------------------------------------
    sudo apt -y install dia
    #--------------------------------
    # Circuits and diagrams
    #--------------------------------
    sudo apt -y install cirkuit
    #--------------------------------
    # Scanning Tools
    #--------------------------------
    sudo apt -y install scantailor gscan2pdf
    #--------------------------------
    # 3D graphics / Vector graphics
    #--------------------------------
    sudo apt -y install blender
    sudo apt -y install qgis qgis-plugin-grass # QuantumGIS supports vector, raster, and database formats.
    sudo apt -y install gdal libgdal1c2a python-gdal  # handles raster formats
    sudo apt -y install libgeotiff
    sudo apt -y install e00compr # an ANSI C library that reads and writes Arc/Info compressed E00 files.
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# JAVA
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_java() {
    sudo add-apt-repository --yes ppa:webupd8team/java
    sudo apt -y install oracle-java8-installer # javac -v = 1.8.XXX
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# JavaScript
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_javascript() {
    # NPM = node package manager
    sudo apt -y install npm
    sudo npm install -g configurable-http-proxy
    sudo npm install -g jslint
    sudo npm install -g jshint
    ln -s ${yaksha_dir}.jshintrc ~/.jshintrc
    sudo apt -y update
    sudo apt -y upgrade
    sudo apt -y install nodejs # nodejs -v = 0.10.28 # dont pin versions
    sudo apt -y install nodejs-legacy
    # gradle
    sudo add-apt-repository --yes ppa:cwchien/gradle
    #sudo apt update
    sudo apt -y install gradle
    # Markdown to PDF conversion - JS tool (better than the py tool 'grip')
    sudo npm install -g markdown-pdf
    #---------------------
    # visualisation with Vega:
    # https://vega.github.io/vega-lite/usage/embed.html
    #---------------------
    sudo npm install vega
    sudo npm install vega-lite
    sudo npm install vega-embed
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Networking shell
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_network() {
    # VPN networks
    sudo apt -y install openvpn
    sudo apt -y install openconnect # Cisco Anyconnect
    # ANDROID
    sudo apt install go-mtpfs libmtp mtpfs mtp-tools
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Non-Free utilities
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_nonfree() {
    sudo apt -y update
    sudo apt -y upgrade
    ##+++++++++++++
    ## Adobe
    ##+++++++++++++
    sudo apt update
    sudo apt -y install acroread mozilla-acroread
    # OCR tools to copy text from locked filed: https://help.ubuntu.com/community/OCR
    sudo apt -y install fuzzyocr # spamassassin plugin to check image attachments
    sudo apt -y install ocrad # OCR program
    sudo apt -y install ocrfeeder # document layout analysis and optical character recognition system
    sudo apt -y install ocropus # document analysis and OCR system
    sudo apt -y install cuneiform # multi-language OCR system

    ##+++++++++++++
    ## FLASH
    ##+++++++++++++
    sudo apt -y install flashplugin-nonfree
    sudo apt -f install
    # Install Skype from Canonical Partner Repository
    sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
    sudo apt -y update
    sudo apt -y upgrade
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# PYTHON
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_python() {
    echo "Python (and its variant packages) installation is in progress!"
    sudo apt -y install build-essential
    # PIP = Python Installer
    sudo apt -y install pip3
    sudo apt -y install pip-installer
    sudo apt -y install python-setuptools
    sudo apt -y install python-pip python-dev python-yaml
    sudo apt -y install python-software-properties
    # python3
    sudo apt -y install python-virtualenv python3-dev pkgconf
    sudo apt -y install libfreetype6-dev libfreetype6 libxft-dev
    sudo apt -y install libblas-dev liblapack-dev libyaml-dev
    sudo apt -y install python3-pip python3
    ## scientific python
    sudo apt -y install cython
    sudo apt -y install numpy python-numpy
    sudo apt -y install scipy
    sudo apt -y install python-matplotlib python-scipy
    #sudo apt -y install python-virtualenv
    sudo apt -y install manpages-dev
    sudo apt -y install python-fontforge
    # Jupyter
    #sudo apt -y install IPython ipython3 ipython3-notebook
    sudo pip3 install ipython jinja2 tornado pyzmq pandas jsonschema pyaml
    ## More Python stuff
    sudo pip3 install rotate-backups
    sudo pip3 install plumbum ## An alternatice to Fabric, https://github.com/tomerfiliba/plumbum
    sudo pip3 install jedi -i http://pypi.python.org/simple/
    sudo pip3 install pylint -i http://pypi.python.org/simple/
    # Nginx WebServer
    sudo add-apt-repository --yes ppa:nginx/stable
    sudo apt update
    sudo apt -y install nginx
    # WebServer ZMQ, also needed by Jupyter/IPython / IRuby etc..
    #sudo add-apt-repository --yes ppa:chris-lea/zeromq
    sudo apt -y install libzmq3-dbg libzmq3-dev libzmq3
    # PandaSQL, https://github.com/yhat/pandasql
    sudo pip3 install -U pandasql
    # Rodeo, A Python IDE built for analyzing data
    # https://www.yhat.com/products/rodeo/downloads
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 33D40BC6
    sudo add-apt-repository "deb http://rodeo-deb.yhat.com/ rodeo main"
    #### install rodeo and run it
    sudo apt update
    sudo apt -y install rodeo
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# R-project / language
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_rlang() {
#   sudo add-apt-repository --yes ppa:marutter/rrutter
    sudo apt -y update
    sudo apt -y install r-base r-base-dev r-base-core
    sudo apt -y install r-recommended   # GNU R collection of recommended packages {metapackage}.
    sudo apt -y install r-doc-info      # GNU R info manuals statistical computing system.
    sudo apt -y install libc6 libcurl4-gnutls-dev # R -v = 3.1.0
    # Statistics & DataScience
    sudo apt -y install r-cran-plyr #https://cran.r-project.org/web/packages/plyr/index.html
    sudo apt -y install aod ggplot2 Rcpp # R data analysis
    ## Fetching from CRAN
    sudo Rscript -e "install.packages('Rserve',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('ggplot2',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('devtools',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('RJSONIO',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('RCurl',,'http://cran.us.r-project.org')"
    sudo Rscript -e "install.packages('RCubature',,'http://cran.us.r-project.org')"
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# RUBY
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_ruby() {
    sudo apt -y install ruby
    sudo apt -y install ruby-all-dev
    sudo apt -y install ruby-dev
    sudo apt -y install ruby-full
    sudo apt -y install ruby-defaults
    sudo gem install iruby
    # VAGRANT  - tool for building and distributing virtualized development environments.
    sudo apt -y install vagrant
    # share a common package cache among similar VM instances
    sudo apt -y install vagrant-cachier   # only available in stretch (testing)
    # Linux container provider for Vagrant.
    sudo apt -y install vagrant-lxc       # only available in stretch (testing)
}



#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# RUST LANGUAGE
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_rust() {
    sudo apt -y install rust
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# TMUX
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_tmux() {
    sudo apt -y install tmux
    sudo apt -y install python-netifaces
    ln -s ${yaksha_dir}.tmux ~/.tmux
    ln -s ${yaksha_dir}.config/ ~/.config
    git clone https://github.com/Lokaltog/powerline ~/.tmux/powerline2
    cd ~/.tmux/powerline2; sudo python setup.py install
    ln -s ${yaksha_dir}.tmux/tmux.conf ~/.tmux.conf
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# VIM
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_vim() {
    sudo apt -y install fontforge
    sudo apt -y install vim-nox
    sudo apt -y install ctags
    ln -s  ${yaksha_dir}.vim ~/.vim
    git clone https://github.com/gmarik/Vundle.vim  ~/.vim/bundle/Vundle.vim
    ln -s ${yaksha_dir}.pylintrc ~/.pylintrc
    ln -s ${yaksha_dir}.vimrc ~/.vimrc
    vim -c 'BundleInstall' -c qa
    cd ~/.vim/bundle/vimproc.vim/; make -f make_unix.mak
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# https://en.wikipedia.org/wiki/Virtualization
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
#
#-------------------------------------------------------------------------------
# DOCKER: https://store.docker.com/editions/community/docker-ce-server-ubuntu
#-------------------------------------------------------------------------------

install_docker() {
    # docker installation
    # https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository
    sudo apt -y remove docker docker-engine docker.io
    sudo apt -y install apt-transport-https ca-certificates software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    # apt-cache madison docker-ce
    # sudo apt install docker-ce=<VERSION>
    sudo sh -c 'echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu artful stable" >> /etc/apt/sources.list.d/docker.list'
    sudo apt -y update
    sudo apt install docker-ce
    # then do the post-installation steps manually
    # https://docs.docker.com/install/linux/linux-postinstall/
}

#--- VirtualBox ----------------------------------------------------------------
# https://en.wikipedia.org/wiki/VirtualBox
#--- VirtualBox ----------------------------------------------------------------
install_saltstack() {
    # Import the Public Key of the saltstack repository
    wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
    # Add all salt repository - Ubuntu 18.04
    sudo apt -y install salt-master
    sudo apt -y install salt-minion
    sudo apt -y install salt-ssh
    sudo apt -y install salt-syndic
    sudo apt -y install salt-cloud
    sudo apt -y install salt-api
    #Upgrade & restart all upgraded services while testing in docker
#    sudo systemctl restart salt-minion
 }

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# YKSHM DEVOPS
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_webserver() {
    # DOCKER : https://docs.docker.com/installation/ubuntulinux/
    #sudo apt -y install docker.io
    #apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    ## AMQP
    sudo apt -y install rabbitmq-server  ## Erlang
    sudo pip3 install pika -i https://github.com/pika/pika   # python client lib for RabbitMQ
    ## WebServer
    sudo apt -y install twisted
    sudo apt -y install tornado
    # gradle
    sudo apt -y install gradle
    sudo apt update
    sudo apt -y install nginx # nginx -v = 1.6.0
    # ZMQ, also needed by Jupyter/IPython / IRuby etc..
    # sudo add-apt-repository --yes ppa:chris-lea/zeromq
    sudo apt -y install libzmq3-dbg libzmq3-dev libzmq3
    # Lets try out this package manager for bash scripts and functions.
    # Only tested for git based packages.
    git clone https://github.com/basherpm/basher.git ~/.basher
}


#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# Gnome general system utilities
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
install_biotech() {
    # OpenMS for reading RAW files
    # https://abibuilder.informatik.uni-tuebingen.de/archive/openms/Documentation/release/latest/html/install_linux.html
    # Debian Package tracker: https://tracker.debian.org/pkg/openms
    sudo apt -y install build-essential cmake autoconf patch libtool git automake
    sudo apt -y install qtbase5-dev libqt5svg5-dev
    sudo apt install -y libeigen3-dev libsqlite3-dev libwildmagic-dev libboost-random1.62-dev libboost-regex1.62-dev libboost-iostreams1.62-dev libboost-date-time1.62-dev libboost-math1.62-dev libxerces-c-dev libglpk-dev zlib1g-dev libsvm-dev libbz2-dev seqan-dev coinor-libcoinmp-dev
}

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
apt_ubuntu='all'
key="$2"

case $key in
    -i|--install)
        apt_ubuntu="$2"
#key="$1"
key="$2"

case $key in
 #   -c|--clean)
 #      clean_install="$1"
 #       shift
 #   ;;
    -i|--install)
        install_apt_ubuntu="$2"
        shift
    ;;
    *)
        echo "usage:
                -c|--clean  - remove dotfiles before installation
                -i|--install [type] will install the UBUNTU packages into $HOME/user
        "
        ;;
    esac

#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# uncomment this for a NEW system only BUT only if upstream == DEV version
#₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
#git clone --recursive https://github.com/svaksha/yaksha ${yaksha_dir}

case $apt_ubuntu in
    ubuntu)
        install_ubuntu
    ;;
    vani)
        install_vani
    ;;
    gnome)
        install_gnome
    ;;
    databinary)
        install_databinary
    ;;
    hardware)
        hardware_utils
    ;;
    database)
        install_database
    ;;
    df_rdf)
        install_df_rdf
    ;;
    dvcs)
        install_dvcs
    ;;
    editors)
        install_editors
    ;;
    fonts)
        install_fonts
    ;;
    gcc)
        install_gcc
    ;;
    go)
        install_go
    ;;
    graphics)
        install_graphics
    ;;
    java)
        install_java
    ;;
    javascript)
        install_javascript
    ;;
    network)
        install_network
	;;
    nonfree)
        install_nonfree
    ;;
    python)
        install_python
    ;;
    rlang)
        install_rlang
    ;;
    ruby)
        install_ruby
    ;;
    rust)
        install_rust
    ;;
    tmux)
        install_tmux
    ;;
    vim)
        install_vim
    ;;
    docker)
        install_docker
    ;;
    vmware)
        install_saltstack
    ;;
    webserver)
        install_webserver
    ;;
    biotech)
        install_biotech
    ;;
    all)
        install_ubuntu
        install_vani
        install_gnome
        install_databinary
        install_hardware_utils
        install_database
        install_df_rdf
        install_dvcs
        install_editors
        install_fonts
        install_gcc
        install_go
        install_graphics
        install_java
        install_javascript
        install_network
        install_nonfree
        install_python
        install_rlang
        install_ruby
        install_rust
        install_tmux
        install_vim
        install_docker
        install_saltstack
        install_webserver
        install_biotech
    ;;
    *)
        echo "UBUNTU package installation in progress, almost done!"
    esac
