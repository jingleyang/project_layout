#!/bin/sh
# sudo is required.

# git svn curl
sudo apt-get install -y git svn curl
# linux perf
sudo apt-get install -y linux-tools-`uname -r` linux-tools-common
# vim
sudo apt-get install -y vim
# setup vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

