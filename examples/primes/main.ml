let (>>=) = Lwt.bind

let step = Implem_lco_ctrl_tree_record.Lco_ctrl_tree_record.rml_make Prime.start

let rec exec () = 
  Lwt_js.sleep 0.01 >>= fun () ->
    let _ = step () in
    exec ()

let _ =
  exec ()
;;
 
