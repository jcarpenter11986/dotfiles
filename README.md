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
$ stow pacman --target=$HOME

## Pacman

Right now, my pacman.conf file isn't that special. I added colors
and more verbose output. I also added the pacman eating circles
status bar. Nothing crazy for now.

To install package, run:
$ stow pacman --target=/etc/

## Zsh

My Zsh install uses .oh-my-zsh and the dracula theme. I do use exa
instead of ls, but I aliased ls, la, ll, lt to exa commands ala Derek Taylor.
Thanks Derek! Right now, I don't have any exception handling for it, so if
you don't have exa installed, Zsh will yell at you.
