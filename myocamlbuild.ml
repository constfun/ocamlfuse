open Solvuu_build.Std

let project_name = "ocamlfuse"
let version = "2.8.0" (* version bump? *)

(*
 * Bytecode executables can be linked with extra .a or .o files by using -custom mode.
 *)

(*
 *
 * OCaml linker builds a library file that can be used for both dynamic and static linking.
 * The file has embedded flags for static and dynamic linking and respective `.so` and `.a` fieles.
 * The `.so` file can be linked with more C code statically by supplying `-l<lib>` flag to `ocamlfind ocamlmklib`.
 *
 * On mac, the `.so` file can be linked with external dependencies installed using `brew` but not other `.so` files such as stubs of other libs.
 *
 *)

let ocamlfuse_lib = Project.lib project_name
    ~dir:"lib"
    ~style:`Basic
    ~c_deps: ["camlidl"; "fuse"]
    ~findlib_deps:["unix"; "threads"; "bigarray"; "camlidl"]
    ~thread:()
    ~verbose:()
    ~pkg:project_name


let () = Project.basic1 ~project_name ~version [ocamlfuse_lib]
