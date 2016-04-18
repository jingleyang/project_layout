#!/usr/bin/make
# copy then modified from
# https://raw.githubusercontent.com/NewProggie/Cpp-Project-Template/master/Makefile
# $@ is the name of the file being generated
# $< the first prerequisite
# $^ the names of all the prerequisites
# When a line starts with ‘@’, the echoing of that line is suppressed
# ?=  it only has an effect if the variable is not yet defined
# := 	allow you to redefine a variable using its own value
#
SHELL := /bin/sh
RM    := rm -rf
MKDIR := mkdir -p
OUT_DIR:=./out

all: Debug Release

distclean:
	@ $(SHELL) ./autogen.sh make

Debug:
	@ make -C ./out/Debug V=1

Release:
	@ make -C ./out/Release V=1

clean:
	@ make -C ./out/Debug  clean
	@ make -C ./out/Release  clean

.PHONY: all distclean clean Debug Release
