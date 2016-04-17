#!/bin/sh
set -x
# sudo is required.

# install deps_install.sh firstly
sh -x deps_install.sh
# git svn curl
sudo apt-get install -y git svn curl exuberant-ctags 
# linux perf
sudo apt-get install -y linux-tools-`uname -r` linux-tools-common
# vim
sudo apt-get install -y vim
# setup vim
# install moshen/vimconfig
if [ ! -d ~/.vim/bundle/ ]; then
  (echo set -- -r; curl "https://raw.githubusercontent.com/moshen/vimconfig/master/setup.sh") | bash
fi
# install google/vim-codefmt. However it does not work.
#rm -rf ~/.vimrc
#cp ./dot.vimrc ~/.vimrc

vim +PluginInstall +qall

# install depot_tools
# https://www.chromium.org/developers/how-tos/install-depot-tools
DEPOT_PATH=../deps/depot_tools
DEPOT_TOOLS=$DEPOT_PATH
if [ ! -d "$DEPOT_PATH" ]; then
  mkdir -p $DEPOT_PATH
  DEPOT_TOOLS=`realpath $DEPOT_PATH`
  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git $DEPOT_TOOLS
else
DEPOT_TOOLS=`realpath $DEPOT_PATH`
fi
# export PATH
export PATH="$DEPOT_TOOLS":"$PATH"
echo "export PATH=$PATH" >> ~/.bashrc

# relogin to init PATH
su - `whoami`

