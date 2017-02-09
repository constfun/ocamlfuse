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
 *
 *)

let ocamlfuse_lib = Project.lib project_name
    ~dir:"lib"
    ~style:`Basic
    ~link_style:`Noautolink|`Dynamic|`Static|`Auto|`Manual (* for -std lib, and standard packages *)
    ~included_clibs: ["camlidl"]
    ~link: (function l ->

             let open Link.Lib in

             (* simply builds ocamlc and ocamlmklib flags *)

             pkg l "unix";
             pkg l "unix";
             pkg l "unix";
             pkg l "unix";

             autolink_cclib "ocamlfuse";
             autolink_dllib "ocamlfuse";

             include_clib l "camlidl";

             reference_clib l "fuse";
             (* will call autolink_cclib *)

             autolink_cclib
             autolink_ccopt
             autolink_dllib


             l.inspect ();



             lin
             include_clib l "camlidl";
             iter l
           )

    ~link: `Manual [
      (*`Pkg "std";*)
      `Pkg "unix";
      `Pkg "threads";
      `Pkg "bigarray";
      `Pkg "camlidl";

      (*`Autolink "ocamlfuse"*)
      (**)

      `IncludeClib "camlidl"; (* link with this lib right now, both resulting .so and .a will have the symbols included *)
      `ReferenceClib "fuse"; (* have .so refence lib, and have lib autolinked to ship a working .a *)
      `AutolinkCclib "fuse";

      (* just IncludeClib and AutolinkClib? *)
      (* just IncludeClib and ReferenceClib *)

      (* just StaticClib and DynamicClib *)
      (* Static, StaticAutolink, DynamicAutolink, Dynamic *)



      (* DynamicClib? *)
      `ReferenceClib "fuse"; (* link with .dylib file when running gcc -shared *)

      (* StaticClib? *)
      `IncludeClib "camlidl"; (* link in libcamlidl.a into both dynamic and static stubs immediately *)
    ]


    (*
     *
     * Add ability to force link statically, possibly with cstubs.
     *
     * *)
    ~link: `Auto [
      (*`L "/path/to/shared/libs";  [> or just a different param? <]*)

      `Autolink "fuse"; (* throws in additional -cclib -lfuse to mklib, doesn't really help with dynamic libs, it seems all external deps have to be linked statically *)

      `Static "fuse"; (* ? *)
      `Static "camlidl"; (* throws in additional -lcamlidl to mklib, and -cclib -lcamlidl? to make sure that future projects can link to this statically? *)
    ]

    ~clibs: ["fuse", "camlidl"]

    ~findlib_deps:["unix"; "threads"; "bigarray"; "camlidl"]
    ~thread:()
    ~verbose:()
    ~pkg:project_name

let () = Project.basic1 ~project_name ~version [ocamlfuse_lib]
