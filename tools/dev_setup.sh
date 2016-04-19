#!/bin/sh
set -x
# sudo is required.

# install deps_install.sh firstly
sh -x deps_install.sh
INSTALL_CMD="sudo apt-get install -y -qq"
# git svn curl
$INSTALL_CMD git svn curl exuberant-ctags
# linux perf
$INSTALL_CMD linux-tools-`uname -r` linux-tools-common
# valgrind
$INSTALL_CMD valgrind
# vim
$INSTALL_CMD vim
# setup vim
# install moshen/vimconfig
if [ ! -d ~/.vim/bundle/ ]; then
  (echo set -- -r; curl "https://raw.githubusercontent.com/moshen/vimconfig/master/setup.sh") | bash
fi
echo "set spell spelllang=en_gb" >> ~/.vimrc

# I would like to install google/vim-codefmt. However it does not work.
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


# end of dev configure
echo "It is time to relogin:"
echo "su - `whoami`"
