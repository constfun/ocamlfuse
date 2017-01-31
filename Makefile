default: c-bindings

include $(shell opam config var solvuu-build:lib)/solvuu.mk
OCAMLBUILD=ocamlbuild -use-ocamlfind -plugin-tag "package(solvuu-build)" -package camlidl

c-bindings:
	camlidl -header lib/Fuse_bindings.idl

.PHONY: c-bindings
