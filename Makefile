default: gen-c-stubs

gen-c-stubs: lib/Fuse_bindings.idl
	camlidl -header $<

include $(shell opam config var solvuu-build:lib)/solvuu.mk

#ocamlc -a    -o ocamlfuse.cma -linkall lib/Result.cmo lib/Fuse_bindings.cmo lib/Thread_pool.cmo lib/Fuse_lib.cmo lib/Unix_util.cmo lib/Fuse.cmo -dllib -lcamlidl -dllib -locamlfuse -cclib -lcamlidl -cclib -locamlfuse
