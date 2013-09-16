### Shell Options ###
# Use case-insensitive filename globbing
shopt -s nocaseglob
# Append to history instead of overwriting
shopt -s histappend
# When changing directory small typos can be ignored by bash
shopt -s cdspell


### History Options ###
# Increase history from default of 500
export HISTSIZE=1000
# Don't put duplicate lines in the history.
export HISTCONTROL=ignoredups
# Ignore these commands when recording history
export HISTIGNORE="[ \t]*:&:[fb]g:exit:ls:ll:cd:pwd:.{2,}"


### Aliases ###
#[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

alias ls="ls -hA --color=auto"                 # classify files in colour
alias ll="ls -l"                              # long list

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias diff="colordiff"

# Colorize grep
alias grep="grep --color"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# Easy editing and sourcing bashrc/vimrc
alias eb="${EDITOR} ~/.bashrc"
alias sb="source ~/.bashrc"
alias ev="${EDITOR} ~/.vimrc"
alias sv="source ~/.vimrc"

###### TODO: added git aliases and separate into different files
for file in $(find ~/bash -type f); do
	source $file
done

#shopt -s nullglob #handle case where * expands to nothing
#for dir in ~/bash/{aliases,exports}; do
	#if [ -d "$dir"]; then
		#for file in /dir/* #check this
		#do
			#source "$file"
		#done
	#fi
#done
#shopt -u nullglob #revert to original settings


### Miscellaneous ###
# Language and locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Add color
export CLICOLOR=1

export EDITOR="vim"

# Have terminal use 256 colors if available
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM="xterm-256color"
else
        export TERM="xterm-color"
fi

# Add javac to path if using cygwin
if [ $OSTYPE == "cygwin" ]; then
	export PATH=$PATH:"/cygdrive/C/Program Files/Java/jdk1.7.0_06/bin/" #home
	#export PATH="/cygdrive/C/Program Files/Java/jdk1.7.0_21/bin/":$PATH #work
	#export PATH=$JAVA_HOME"/bin/":$PATH #should work for both
fi


### Functions ###
#[[ -f ~/.bash_functions ]] && source ~/.bash_functions

# Local config
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local
