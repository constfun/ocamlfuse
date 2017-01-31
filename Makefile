default: gen-c-stubs

gen-c-stubs: lib/Fuse_bindings.idl
	camlidl -header $<

include $(shell opam config var solvuu-build:lib)/solvuu.mk
