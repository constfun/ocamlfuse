default: c-bindings

include $(shell opam config var solvuu-build:lib)/solvuu.mk

c-bindings:
	camlidl -header lib/Fuse_bindings.idl

.PHONY: c-bindings
