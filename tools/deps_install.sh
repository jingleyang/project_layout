#!/bin/sh
# sudo is required
# This script will install third party libraries and development tools.

# If you ubuntu is unable to install following software, please visit 
# https://repogen.simplylinux.ch/ to generate a sources.list

set -x
# update apt-get
sudo apt-get update -qq
INSTALL_CMD="sudo apt-get install -y -qq"
# build-essential
$INSTALL_CMD build-essential
# clang
$INSTALL_CMD clang
# cmake
$INSTALL_CMD cmake
# realpath tree
$INSTALL_CMD realpath tree

