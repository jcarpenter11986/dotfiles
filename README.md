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
the plugins that I use. The CoC plugin does require nodejs to work,
so you'll need to install that as well.

To install package, run:
$ stow vim --target=$HOME

## Bash

I switch back and forth between Mac OS and Linux, so my .bashrc
sources .bash_profile. The .bash_profile has the majority of settings.
I changed the prompt to the directory path, and if you are in a repository,
it will display the branch.

To install package, run:
$ stow bash --target=$HOME

## Todotxt

I use [todo.txt](https://github.com/todotxt/todo.txt) as part of my GTD productivity setup.
This is the main config file with the colors and settings that I want. This will not work
properly with terminal.app because it doesn't support true color, but it does
work nicely with iTerm2.

To install package, run:
$ stow todotxt --target=$HOME
