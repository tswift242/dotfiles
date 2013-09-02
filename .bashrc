### Shell Options ###
# Use case-insensitive filename globbing
shopt -s nocaseglob

# When changing directory small typos can be ignored by bash
# shopt -s cdspell


### History Options ###
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# Ignore some controlling instructions
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well


### Aliases ###
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi

alias ls='ls -hA --color=tty'                 # classify files in colour
alias ll='ls -l'                              # long list

alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour


### Miscellaneous ###
export EDITOR='vim'

# have terminal use 256 colors if available
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

# add javac to path (for windows)
export PATH=$PATH:"/cygdrive/C/Program Files/Java/jdk1.7.0_06/bin/" #home
#export PATH="/cygdrive/C/Program Files/Java/jdk1.7.0_21/bin/":$PATH #work
#export PATH=$JAVA_HOME"/bin/":$PATH #should work for both


### Functions ###
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
