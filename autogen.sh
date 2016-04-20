#!/bin/sh
#warning this is not standard autogen.sh for GNU autotools
# It will clear all file in ./out, and then generate output structure.

set -x
OUT_DIR=./out

# default cmake generator # in travis,  CMake was unable to find a build program corresponding to "Ninja"
#GEN_TYPE=Ninja
# open this type to get a makefile
GEN_TYPE=make

#update GEN_TYPE
if [ ! -z "$1" ]; then
  GEN_TYPE=$1
fi

RM="rm -rf"
MKDIR="mkdir -p"
PROJECT_ROOT=$PWD
$RM $OUT_DIR

$MKDIR $OUT_DIR

BUILD_TYPE="Debug Release"
for type in $BUILD_TYPE
do
  OPT="-DCMAKE_BUILD_TYPE=$type"
  build=$OUT_DIR/$type
  if [ "$GEN_TYPE" = make ]; then
    CMAKE_GEN="Unix Makefiles"
  else
    CMAKE_GEN=$GEN_TYPE
  fi
  $MKDIR $build
  cd $build
  cmake -G"$CMAKE_GEN" $OPT  $PROJECT_ROOT
  cd -
done

#generate configure
cp -f ./configure.in ./configure

#generate Makefile
if [ $GEN_TYPE = Ninja ]; then
  cp -f Makefile.$GEN_TYPE Makefile
elif [ $GEN_TYPE = make ]; then
  cp -f Makefile.$GEN_TYPE Makefile
fi
