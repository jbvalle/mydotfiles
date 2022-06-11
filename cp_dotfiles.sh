#!/bin/bash

DOTFILES_DIR=dotfiles
DOTFILES='.bashrc .vim .vimrc'

mkdir -p $DOTFILES_DIR
cp $DOTFILES $DOTFILES_DIR -r
