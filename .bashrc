# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
# ich bevorzuge ganz eindeutig mcedit
export EDITOR=/usr/bin/mcedit
#export QT_FONT_DPI=165
#export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export QT_ENABLE_HIGHDPI_SCALING=1


# an laufenden tmux anbinden
#if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
#  tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
#fi

# aliases einbinden, wenn Datei existiert und Größe > 0 Bytes
[[ -s ~/.alias ]] && . ~/.alias

# Funktion _myPSx definiert in .alias
# den Promt, wie ich ihn sehen will 
_myPSx 

# Funktion _add2Path definiert in .alias
_add2Path "${HOME}/bin:${HOME}/bin/python:${HOME}/bin/perl:${HOME}/bin/pascal:${HOME}/.local/bin" 

# Variablen eingefügt von Perl/CPAN, von mir angepasst
PERL5LIB="$HOME/.local/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/.perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/.perl5"; export PERL_MM_OPT;

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# wird manchmal gebraucht, wenn QT und KDE sich nicht mögen
#export QT_QPA_PLATFORMTHEME=qt5ct

# hier kommen hostspezifische Konfigurationen fuer den User
# als versteckte Datei im Userverzeichnis mit dem Namen des Hosts ;-)
# [[ -s ~/."${HOST}" ]] && . ~/."${HOST}" || :
