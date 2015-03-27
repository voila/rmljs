let print_list lst = 
  let doc  = Dom_html.window##document in
  let text = Js.to_string doc##body##innerHTML in  
  doc##body##innerHTML <- Js.string (text ^ " " ^ string_of_int (List.hd lst))

