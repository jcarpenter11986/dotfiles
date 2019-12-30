     _ _           _           _       _    __ _ _           
    | (_)_ __ ___ ( )___    __| | ___ | |_ / _(_) | ___  ___ 
 _  | | | '_ ` _ \|// __|  / _` |/ _ \| __| |_| | |/ _ \/ __|
| |_| | | | | | | | \__ \ | (_| | (_) | |_|  _| | |  __/\__ \
 \___/|_|_| |_| |_| |___/  \__,_|\___/ \__|_| |_|_|\___||___/
                                                             

#stow
This dotfiles repo makes use of the Gnu Stow program to symlink
files to the home directory. Each program has its own folder
and can be stowed a la carte. Make sure you use the --target=$HOME
option when stowing so that the files are linked properly. It
is probably a good idea to read the man pages for stow as well.

#packages
Each program has its folder which is a technically called a package
by stow. Pick and choose which packages you want to stow. This is helpful
because I may have dotfiles for programs you don't use, or maybe you just
want to try my dot files, in which case you can always remove them via stow.
