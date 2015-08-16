#!/bin/sh
# This script creates symlinks from the home dotfilesectory to any desired dotfiles in ~/dotfiles


#TODO: Configure variables

dotfiles=${dotfiles:-~/dotfiles}                    # dotfiles dotfilesectory
old_dotfiles=~/dotfiles_old             # old dotfiles backup dotfilesectory
files="vimrc octaverc screenrc"    # list of files/folders to symlink in homedotfiles


# create dotfiles_old in homedotfiles
if [ ! -d $old_dotfiles ]; then
	echo "Creating $old_dotfiles for backup of any existing dotfiles in ~"
	mkdir -p $old_dotfiles
	echo "...done"
fi

# change to the dotfiles dotfilesectory
if [ ! -d $dotfiles ]; then
	mkdir -p $dotfiles
fi
echo "Changing to the $dotfiles dotfilesectory"
cd $dotfiles
echo "...done"

# move any existing dotfiles in homedotfiles to dotfiles_old dotfilesectory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $old_dotfiles"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home dotfilesectory."
    ln -s $dotfiles/$file ~/.$file
done
