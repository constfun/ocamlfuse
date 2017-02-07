open Solvuu_build.Std

let project_name = "ocamlfuse"
let version = "2.8.0" (* version bump? *)

let ocamlfuse_lib = Build.lib
 ~dir:"lib"
 ~findlib_deps:["unix"; "threads"; "bigarray"; "camlidl"]
 ~pkg:project_name



let ocamlfuse_lib = Project.lib project_name
    ~dir:"lib"
    ~style:`Basic
    ~thread:()
    ~cclib:"-lcamlidl"
    ~findlib_deps:["unix"; "threads"; "bigarray"; "camlidl"]
    ~linkall:()
    ~verbose:()
    ~pkg:project_name

let () = Project.basic1 ~project_name ~version [ocamlfuse_lib]
