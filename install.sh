#!/bin/bash
#############################################################################################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Copied and modified from michealjsmalley's makesymlinks.sh on github
#############################################################################################

dir=~/dotfiles # dotfiles directory
olddir=~/dotfiles_old # backup directory for old dotfiles
# list of files/folders to symlink in homedir
files=".bash .bash_profile .bashrc .gitconfig .gitignore_global .screenrc .vim .vimrc" 


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


# source new bash and vim config files if they exist
bashrc=~/.bashrc
if [ -f $bashrc ]; then
	echo -n "Sourcing $bashrc ... "
	source $bashrc
	echo "done"
fi
vimrc=~/.vimrc
if [ -f $vimrc ]; then
	echo -n "Sourcing $vimrc ... "
	source $vimrc
	echo "done"
fi
