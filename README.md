# Jim's dotfiles

## Stow

I use GNU/Stow as the main symlinking program
for these dotfiles. Instead of sitting right in my
home diretory, they sit inside "packages".

After installing Stow, CD to the dotfiles directory and run
the install command pertaining to the package you want.

## Vim

For plugin management, I use Vim-Plug. It will be automatically
installed with this package. Run :PlugInstall inside of Vim to get
the plugins that I use.

To install package, run:
$ stow vim --target=$HOME

## Pacman

Right now, my pacman.conf file isn't that special. I added colors
and more verbose output. I also added the pacman eating circles
status bar. Nothing crazy for now.

To install package, run:
$ stow pacman --target=/etc/

## Bash

I switch back and forth between Mac OS and Linux, so my .bash_profile
sources the .bashrc. The .bashrc has the majority of settings.
I changed the prompt to the directory path, and if you are in a repository,
it will display the branch. I have a few aliases. I use Vim as my Manpager,
and just my $PATH setting.

To install package, run:
$ stow bash --target=$HOME

## Zsh

I'M NOT USING ZSH AT THE MOMENT, SO THIS ISN'T MAINTAIND AS WELL AS BASH
My Zsh install uses .oh-my-zsh and the dracula theme. I do use exa
instead of ls, but I aliased ls, la, ll, lt to exa commands ala Derek Taylor.
Thanks Derek! Right now, I don't have any exception handling for it, so if
you don't have exa installed, Zsh will yell at you.

To install package, run:
$ stow zsh --target=$HOME
