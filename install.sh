#!/bin/bash
#############################################################################################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Copied and modified from michealjsmalley's makesymlinks.sh on github
#############################################################################################

dir=~/dotfiles # dotfiles directory
olddir=~/dotfiles_old # backup directory for old dotfiles
# list of files/folders to symlink in homedir
files=".bash .bash_profile .bashrc .gitconfig .gitignore_global .screenrc .vim .vimrc" 


# create dotfiles_old in homedir
echo -n "Creating $olddir to backup any existing dotfiles in ~ ... "
mkdir -p $olddir
echo "done"

# move any existing dotfiles in homedir to $olddir, then create symlinks from the homedir to any files in the $dir directory specified in $files
for file in $files; do
    if [ -e $dir/$file ]; then # only backup dotfiles in ~ if they exist in $dir
		if [ -e ~/$file ]; then
			echo "Moving $file from ~ to $olddir"
			mv ~/$file $olddir/
		fi
		echo "Creating symlink to $dir/$file in ~"
		ln -s $dir/$file ~/$file
	fi
done
