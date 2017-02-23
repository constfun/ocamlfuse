open Solvuu_build.Std
open Util

let project_name = "ocamlfuse"
let version = "2.8.0" (* version bump? *)





let () = Build.lib ~dir:"lib"

  (* if ml = mli then print_endline "equal" *)
  (* else print_endline "not equal"; *)
  (* print_endline (Mli.of_path "st.mli"); *)


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

(* let ocamlfuse_lib = Project.lib project_name *)
(*     ~dir:"lib" *)
(*     ~style:`Basic *)
(*     ~c_deps: ["camlidl"; "fuse"] *)
(*     ~findlib_deps:["unix"; "threads"; "bigarray"; "camlidl"] *)
(*     ~thread:() *)
(*     ~verbose:() *)
(*     ~pkg:project_name *)


(* let () = Project.basic1 ~project_name ~version [ocamlfuse_lib] *)

(*
let () =
  Build.BuildLib.lib
    ~dir:"lib"
    ~name:"ocamlfuse"
    ~findlib_deps:["unix"; "threads"; "bigarray"; "camlidl"]
    (* Global opts *)
    ~opts: ["-thread"]
    ~ocamlc_opts: ["-thread"]
    ~ocamlopt_opts: ["-thread"]
    (***)
    ~custom: (fun rules ->


        (* Checking type on item will show all prods and deps types. *)
       type rules = {
         prods;
         deps;
         commands;
       }


       module Js_file = File_type.Make(struct
           let ext () = ".js"
         end)

       module Ar = Tool.Make(struct
           let opts = ...
         end)

       List.map rules ~f:(fun rule ->
         match rule with
         | `Js js_file : Js_file.t ->
         | `Ml  -> Js_of_ocaml.compile_ml file)
         | `Js file and (File.path file) = "index.js" ->
         | `Clib (a, dll) ->
           Ar.include_ a (File.of_string "lib/mylib.a")
         | _ ->
           let desc = "-thread is required by ocamlfuse" in
           Ocamlc.thread ~desc rule |>
           Ocamlopt.thread ~desc
          (* or Common_opts.thread *)

         explain rule; rule
         )

       List.map rules ~f:(fun r ->
               List.iter r.commands ~f:(function ->
                   | `Ocamlc opts -> opts.thread
                 )
             )

        match item ->
        | `Mli file ->
        | `Cmi rule ->
        | `C_lib rule ->

        (* I want to be able to supply -thread.
         * I want to be able to be able to exlore what flags are being applied and why.
         * I want to be able to be able to surgically influence flags that are being apllied to any command.
         * I want to be able to implement a new build tool, such as `ar`, and do something useful with it.
         *)

      )
   *)

