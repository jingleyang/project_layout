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

all: $(OUT_DIR)/Makefile
	@- $(MAKE) -C $(OUT_DIR)

./out/Makefile:
	@- $(MKDIR) $(OUT_DIR)
	@ (cd $(OUT_DIR) >/dev/null 2>&1 && cmake ..)

distclean:
	@- $(RM) $(OUT_DIR)

.PHONY: all distclean
