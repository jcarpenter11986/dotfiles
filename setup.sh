#!/bin/bash

# Run this to automatically configure your user environment

# Update and initialize git submodules
git submodule update --init --recursive

# Set up symlinks for config files
stow zsh qutebrowser vim
