open Graphics_js

let by_id_coerce s f  = Js.Opt.get (f (Dom_html.getElementById s)) (fun () -> raise Not_found)
let can = by_id_coerce "test-canvas" Dom_html.CoerceTo.canvas in open_canvas can


let (>>=) = Lwt.bind
let step = Implem_lco_ctrl_tree_record.Lco_ctrl_tree_record.rml_make Moving.start
let rec exec () = 
  Lwt_js.sleep 0.01 >>= fun () ->
    (* Firebug.console##log (Js.string "step"); *)
    let _ = step () in
    exec ()

let _ =
  
  exec ()
;;
