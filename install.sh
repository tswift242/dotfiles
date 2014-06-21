#!/bin/bash
#############################################################################################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Copied and modified from michealjsmalley's makesymlinks.sh on github
#############################################################################################

dir=~/dotfiles # dotfiles directory
olddir=~/dotfiles_old # backup directory for old dotfiles
# list of files/folders to symlink in homedir
files=".shell .bash_profile .bashrc .gitconfig .gitignore_global .screenrc .vim .vimrc .zshrc" 


# create $olddir
if [ ! -d $olddir ]; then
	echo -n "Creating $olddir to backup any existing dotfiles in ~ ... "
	mkdir $olddir
	echo "done"
	echo
fi

# move any existing dotfiles in ~ to $olddir, 
# then create symlinks from ~ to any files in $dir specified in $files
for file in $files; do
	newfile=$dir/$file
	currfile=~/$file
	oldfile=$olddir/$file
    if [ -e $newfile ]; then # only backup old dotfiles in ~ if new ones exist in $dir
		if [ -e $currfile ]; then
			if [ -d $oldfile ]; then # remove old file if it's a dir to avoid mv error
				echo "Removing directory $oldfile"
				rm -rf $oldfile
			fi
			echo "Moving $file from ~ to $olddir"
			mv $currfile $olddir/
		fi
		echo "Creating symlink from ~ to $newfile"
		ln -s $newfile $currfile
	fi
done
echo


# source new bash/zsh config file if it exists
#if [ "$SHELL" == "/bin/zsh" ]; then
	#echo "Running zsh"
	#shellrc=~/.zshrc
#else
	#echo "Running bash"
	#shellrc=~/.bashrc
#fi

#if [ -f $shellrc ]; then
	#echo "Sourcing $shellrc ... "
	#source $shellrc
	#echo "done"
#fi
