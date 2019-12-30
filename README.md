# Jim's dotfiles

## Stow
#First and foremost!

I use GNU/Stow as the main symlinking program
for these dotfiles. Instead of sitting right in my
home diretory, they sit inside "packages". 

After installing
Stow, cd to the dotfiles directory and run
stow --target=$HOME packagename where packagname is the actual
name of the folder you want to symlink to your home directory.

There is a package for each program that contains various
configuration files, so pick and choose what you want.
Read the Stow man pages for more info on reverting, etc.

## Vim

My Vim config uses the Vim-Plug plugin manager.

