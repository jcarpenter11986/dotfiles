#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# XDG Config
[ -d ${BASEDIR}/config] && ln -s ${BASEDIR}/config ~/.config

# vim
[ -f ${BASEDIR}/vimrc] && ln -s ${BASEDIR}/vimrc ~/.vimrc
[ -f ${BASEDIR}/vim] && ln -s ${BASEDIR}/vim/ ~/.vim

# zsh
[ -f ${BASEDIR}/zshrc] && ln -s ${BASEDIR}/zshrc ~/.zshrc

# git
[ -f ${BASEDIR}/gitconfig] && ln -s ${BASEDIR}/gitconfig ~/.gitconfig
