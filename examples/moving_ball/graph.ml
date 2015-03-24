
(* let pi = 4. *. atan 1. *)


(* let doc  = Dom_html.window##document *)
(* let canvas = Dom_html.createCanvas doc  *)
(* let body = Dom_html.getElementById "main-title" *)
(* let context = canvas##getContext (Dom_html._2d_) *)


(* let clear_graph (x: float) (y: float) (w: float) (h: float) = *)
(*   context##clearRect (x, y, w, h) *)

(* let fill_circle (x:float) (y:float) (radius:float) (color:string) =  *)
(*   context##fillStyle <- Js.string color; *)
(*   context##beginPath(); *)
(*   context##arc(x, y, radius, 0.0, 2.0 *. pi, Js._true); *)
(*   context##fill() *)

(* let open_graph () = *)
(*   Dom.appendChild body canvas *)

(* type state = { *)
(*   context : Dom_html.canvasRenderingContext2D Js.t; *)
(*   (\* canvas : Dom_html.canvasElement Js.t; *\) *)
(* } *)

let context = ref None




let pi = 4. *. atan 1.
(* let canvas_id = Js.string "canvas"  *)
(* let doc  = Dom_html.window##document *)
(* let canvas = Dom_html.createCanvas doc  *)
(* let body = Dom_html.getElementById "main-title" *)
(* let context = canvas##getContext (Dom_html._2d_) *)


let clear_graph (x: float) (y: float) (w: float) (h: float) =
  match !context with
  | None -> 
      ()
  | Some ctx ->
      ctx##clearRect (x, y, w, h)

let fill_circle (x:float) (y:float) (radius:float) (color:string) =
  (* Firebug.console##log (Js.string ("fill "^(string_of_float x))); *)
  match !context with
  | None -> ()
  | Some ctx ->
      ctx##fillStyle <- Js.string color;
      ctx##beginPath();
      ctx##arc(x, y, radius, 0.0, 2.0 *. pi, Js._true);
      ctx##fill()

let open_graph w h =
  Firebug.console##log (Js.string "open_graph");
  let onload _ =
    let doc  = Dom_html.window##document in
    let canvas = Dom_html.createCanvas doc in
    let ctx = canvas##getContext (Dom_html._2d_) in
    let div =
      Js.Opt.get (doc##getElementById(Js.string "canvas-div"))
        (fun () -> assert false)
    in
    canvas##width <- int_of_float w;
    canvas##height <- int_of_float h;
    context := Some ctx;
    Dom.appendChild div canvas;
    (* fill_circle 150. 150. 30. "red"; *)
    Js._false
  in
  Dom_html.window##onload <- Dom_html.handler onload
