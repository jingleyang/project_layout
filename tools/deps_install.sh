#!/bin/sh
# sudo is required
# This script will install third party libraries and development tools.

# If you ubuntu is unable to install following software, please visit 
# https://repogen.simplylinux.ch/ to generate a sources.list
# update apt-get
sudo apt-get update
# build-essential
sudo apt-get install -y build-essential
# clang
sudo apt-get install -y clang

