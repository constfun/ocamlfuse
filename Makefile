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
#
#
#
# OR
#
#
# ocamlfind ocamlmklib -o ocamlfuse -verbose -lfuse -lcamlidl -L/Users/nick/.opam/4.04.0/lib/camlidl lib/Fuse_bindings_stubs.o lib/Fuse_util.o lib/Unix_util_stubs.o lib/Result.cmo lib/Fuse_bindings.cmo lib/Thread_pool.cmo lib/Fuse_lib.cmo lib/Unix_util.cmo lib/Fuse.cmo
#
#
#
#
#
# ocamlfind ocamlmklib -o ocamlfuse -verbose -lfuse -lcamlidl -L/Users/nick/.opam/4.04.0/lib/stublibs lib/Fuse_bindings_stubs.o lib/Fuse_util.o lib/Unix_util_stubs.o lib/Result.cmo lib/Fuse_bindings.cmo lib/Thread_pool.cmo lib/Fuse_lib.cmo lib/Unix_util.cmo lib/Fuse.cmo
#Effective set of compiler predicates: autolink,byte,native
#+ ocamlmklib -ocamlc ocamlc.opt -ocamlopt ocamlopt.opt -o ocamlfuse -verbose -lfuse -lcamlidl -L/Users/nick/.opam/4.04.0/lib/stublibs lib/Fuse_bindings_stubs.o lib/Fuse_util.o lib/Unix_util_stubs.o lib/Result.cmo lib/Fuse_bindings.cmo lib/Thread_pool.cmo lib/Fuse_lib.cmo lib/Unix_util.cmo lib/Fuse.cmo
#+ gcc -bundle -flat_namespace -undefined suppress                    -Wl,-no_compact_unwind  -o ./dllocamlfuse.so lib/Fuse_bindings_stubs.o lib/Fuse_util.o lib/Unix_util_stubs.o    -L/Users/nick/.opam/4.04.0/lib/stublibs -lfuse -lcamlidl
#ld: can't link with bundle (MH_BUNDLE) only dylibs (MH_DYLIB) file '/Users/nick/.opam/4.04.0/lib/stublibs/libcamlidl.dylib' for architecture x86_64
#clang: error: linker command failed
#
# ^^^^^^^^ Attemping to link with an actual dynamic lib using gcc. This effectively means that you cant dynamically link your stubs with stubs of other packages, ever.
# You just carry the cflags around until a monent in future where you statically link with the lib.
#
# In case of camlidl runtime there is no "carrier" for these extra flags, since there is no cma file.
#
# If we just throw in an extra `-cclib -lcamlidl` we get an invalid dllocamlfuse.so file? Why?
# Because to load more files dynamically we need to use `-dllib -lcamlidl` since dllocamlfuse.so has undefined symbols.
# However the camlidl.so file doesnt work on unix since it requires a Windows only COM api and hence has an undefined symbol.
#
#
#
# THIS WORKS:
#ocamlfind ocamlmklib -o ocamlfuse -verbose -lfuse -lcamlidl -L/Users/nick/.opam/4.04.0/lib/camlidl lib/Fuse_bindings_stubs.o lib/Fuse_util.o lib/Unix_util_stubs.o lib/Result.cmo lib/Fuse_bindings.cmo lib/Thread_pool.cmo lib/Fuse_lib.cmo lib/Unix_util.cmo lib/Fuse.cmo

