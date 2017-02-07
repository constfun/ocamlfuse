default: gen-c-stubs

gen-c-stubs: lib/Fuse_bindings.idl
	camlidl -header $<

include $(shell opam config var solvuu-build:lib)/solvuu.mk

#ocamlc -a    -o ocamlfuse.cma -linkall lib/Result.cmo lib/Fuse_bindings.cmo lib/Thread_pool.cmo lib/Fuse_lib.cmo lib/Unix_util.cmo lib/Fuse.cmo -dllib -lcamlidl -dllib -locamlfuse -cclib -lcamlidl -cclib -locamlfuse

# ocamlfind ocamlmklib -oc ocamlfuse -verbose -lfuse -lcamlidl -L/Users/nick/.opam/4.04.0/lib/camlidl lib/Fuse_bindings_stubs.o lib/Fuse_util.o lib/Unix_util_stubs.o
# Effective set of compiler predicates: autolink,byte,native
# + ocamlmklib -ocamlc ocamlc.opt -ocamlopt ocamlopt.opt -oc ocamlfuse -verbose -lfuse -lcamlidl -L/Users/nick/.opam/4.04.0/lib/camlidl lib/Fuse_bindings_stubs.o lib/Fuse_util.o lib/Unix_util_stubs.o
# + gcc -bundle -flat_namespace -undefined suppress                    -Wl,-no_compact_unwind  -o ./dllocamlfuse.so lib/Fuse_bindings_stubs.o lib/Fuse_util.o lib/Unix_util_stubs.o    -L/Users/nick/.opam/4.04.0/lib/camlidl -lfuse -lcamlidl
# + ar rc ./libocamlfuse.a  lib/Fuse_bindings_stubs.o lib/Fuse_util.o lib/Unix_util_stubs.o; ranlib ./libocamlfuse.a
#
# ocamlc -a    -o ocamlfuse.cma lib/Result.cmo lib/Fuse_bindings.cmo lib/Thread_pool.cmo lib/Fuse_lib.cmo lib/Unix_util.cmo lib/Fuse.cmo -dllib -locamlfuse -cclib -lcamlidl -cclib -locamlfuse -cclib -lfuse
# cp ocamlfuse.cma ~/.opam/4.04.0/lib/ocamlfuse                               ocamlfuse/_build
# cp dllocamlfuse.so ~/.opam/4.04.0/lib/stublibs/                             ocamlfuse/_build
