let pi = 4. *. atan 1.

  let orange = "orange"
  let blue = "blue"
  let green = "green"
  let red = "red"
  let cyan = "cyan"
  let black = "black"
  let magenta = "magenta"

  let size_x () = 400
  let size_y () = 400

  let context = ref None

  let clear_graph () =
    let w = float_of_int (size_x ()) in
    let h = float_of_int (size_y ()) in
    match !context with
    | None -> 
       ()
    | Some ctx ->
       ctx##clearRect (0., 0., w, h)

  let fill_circle (x:float) (y:float) (radius:float) (color:string) =
  match !context with
  | None -> ()
  | Some ctx ->
      ctx##fillStyle <- Js.string color;
      ctx##beginPath();
      ctx##arc(x, y, radius, 0.0, 2.0 *. pi, Js._true);
      ctx##fill()

  let key = ref None

  let key_pressed () = 
    match !key with
      None -> false | Some _ -> true

  let read_key () = 
    match !key with
      Some c -> key := None; c
    | None -> failwith "no key pressed!"
    

  let pos = ref None

  let button_down () = 
    match !pos with
      None -> false | Some _ -> true

  let mouse_pos () = 
    match !pos with
      None -> failwith "no mouseclick!"
    | Some p -> pos := None; p


  let attach_key_handler () = 
    Dom_html.addEventListener Dom_html.document Dom_html.Event.keyup
          (Dom_html.handler
             (fun(e) -> 
              let k = match e##keyCode with
              | 83 -> Some 's'
              | 75 -> Some 'k'
              | 80 -> Some 'p'
              | 81 -> Some 'q'
              | _ -> None in
              key := k;
              Js._false))
          Js._false


  let attach_mouse_handler () = 
    Dom_html.addEventListener Dom_html.document Dom_html.Event.mouseup
          (Dom_html.handler
             (fun(e) -> 
              pos := Some (e##clientX, e##clientY);
              Js._false))
          Js._false

  let open_graph () =
  (* Firebug.console##log (Js.string "open_graph"); *)
    let onload _ =
      let doc  = Dom_html.window##document in
      let canvas = Dom_html.createCanvas doc in
      let ctx = canvas##getContext (Dom_html._2d_) in
      let div =
        Js.Opt.get (doc##getElementById(Js.string "canvas-div"))
                   (fun () -> assert false)
      in
      canvas##width <- 400;
      canvas##height <- 400;
      context := Some ctx;
      Dom.appendChild div canvas;

      attach_key_handler ();
      attach_mouse_handler ();

      
      Js._false
    in
    Dom_html.window##onload <- Dom_html.handler onload
