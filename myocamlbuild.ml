open Solvuu_build.Std

let project_name = "ocamlfuse"
let version = "2.8.0" (* version bump? *)

(*type lib_link_style =*)
  (*| Dynamic*)
  (*| Static*)
  (*| DynamicAndStatic*)

(*type c_dep =*)
  (*| Static of string*)
  (*| Dynamic of string*)

(*let ocamlfuse_lib = Build.lib*)
 (*~dir:"lib"*)
 (*~link: Lib project_name [*)
   (*Pkg "unix";*)
   (*Pkg "threads";*)
   (*Pkg "bigarray";*)
   (*Pkg "camlidl";*)

   (*Clib "fuse";*)
   (*StaticClib "camlidl";*)
  (*]*)



 (*~clibs:[`Static ]*)
 (*~link_style: `Dynamic*)
 (*~c_deps: [*)
   (*Build.link_statically "camlidl";*)
 (*]*)
 (*~findlib_deps:["unix"; "threads"; "bigarray"; "camlidl"]*)
 (*~pkg:project_name*)


(*
 *
 * OCaml linker builds a library file that can be used for both dynamic and static linking.
 * The file has embedded flags for static and dynamic linking and respective `.so` and `.a` fieles.
 * The `.so` file can be linked with more C code statically by supplying `-l<lib>` flag to `ocamlfind ocamlmklib`.
 *
 * On mac, the `.so` file can be linked with external dependencies installed using `brew` but not other `.so` files such as stubs of other libs.
 *
 *
 *)

let ocamlfuse_lib = Project.lib project_name
    ~dir:"lib"
    ~style:`Basic

    ~link:[
      `L "/path/to/shared/libs";  (* or just a different param? *)

      `Static "fuse"; (* ? *)
      `Auto "fuse"; (* throws in additional -cclib -lfuse to mklib, doesn't really help with dynamic libs, it seems all external deps have to be linked statically *)
      `Static "camlidl"; (* throws in additional -lcamlidl to mklib, and -cclib -lcamlidl? to make sure that future projects can link to this statically? *)
    ]

    ~findlib_deps:["unix"; "threads"; "bigarray"; "camlidl"]
    ~thread:()
    ~verbose:()
    ~pkg:project_name

let () = Project.basic1 ~project_name ~version [ocamlfuse_lib]
