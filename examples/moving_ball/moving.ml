(* THIS FILE IS GENERATED. *)
(* /Users/Emmanuel/Work/rml-1.09.04-nounix/compiler/rmlc -stdlib /Users/Emmanuel/Work/rml-1.09.04-nounix/stdlib moving.rml  *)

open Implem_lco_ctrl_tree_record;;
type  box
= {  left: float ;   right: float ;   top: float ;   bot: float} ;;
let box = {left=((0.)); right=(400.); bot=((0.)); top=(400.)} 
;;
type  state
= {
   pos: ((float * float), (float * float)) Lco_ctrl_tree_record.event ; 
   speed: ((float * float), (float * float)) Lco_ctrl_tree_record.event ; 
   radius: float ;   color: string} ;;
let draw =
      Lco_ctrl_tree_record.rml_global_signal_combine
        ([])
        (function
          | x__val_rml_3  ->
              (function | y__val_rml_4  -> x__val_rml_3 :: y__val_rml_4 )
          ) 
;;
let move =
      (function
        | state__val_rml_6  ->
            ((function
               | ()  ->
                   Lco_ctrl_tree_record.rml_loop
                     (Lco_ctrl_tree_record.rml_seq
                       (Lco_ctrl_tree_record.rml_emit_val'
                         draw (function | ()  -> state__val_rml_6 ))
                       (Lco_ctrl_tree_record.rml_def
                         (function
                           | ()  ->
                               Lco_ctrl_tree_record.rml_last
                                 (state__val_rml_6).speed
                           )
                         (function
                           | (pre_vx__val_rml_7, pre_vy__val_rml_8)  ->
                               Lco_ctrl_tree_record.rml_def
                                 (function
                                   | ()  ->
                                       Lco_ctrl_tree_record.rml_last
                                         (state__val_rml_6).pos
                                   )
                                 (function
                                   | (pre_x__val_rml_9, pre_y__val_rml_10)
                                        ->
                                       Lco_ctrl_tree_record.rml_def
                                         (function
                                           | ()  ->
                                               if
                                                 Pervasives.(&&)
                                                   (Pervasives.(<)
                                                     (box).left
                                                     pre_x__val_rml_9)
                                                   (Pervasives.(<)
                                                     pre_x__val_rml_9
                                                     (box).right)
                                                 then pre_vx__val_rml_7 else
                                                 Pervasives.(~-.)
                                                   pre_vx__val_rml_7
                                           )
                                         (function
                                           | vx__val_rml_11  ->
                                               Lco_ctrl_tree_record.rml_def
                                                 (function
                                                   | ()  ->
                                                       if
                                                         Pervasives.(&&)
                                                           (Pervasives.(<)
                                                             (box).bot
                                                             pre_y__val_rml_10)
                                                           (Pervasives.(<)
                                                             pre_y__val_rml_10
                                                             (box).top)
                                                         then
                                                         pre_vy__val_rml_8
                                                         else
                                                         Pervasives.(~-.)
                                                           pre_vy__val_rml_8
                                                   )
                                                 (function
                                                   | vy__val_rml_12  ->
                                                       Lco_ctrl_tree_record.rml_def
                                                         (function
                                                           | ()  ->
                                                               ((Pervasives.(+.)
                                                                  pre_x__val_rml_9
                                                                  vx__val_rml_11),
                                                                (Pervasives.(+.)
                                                                  pre_y__val_rml_10
                                                                  vy__val_rml_12))
                                                           )
                                                         (function
                                                           | (x__val_rml_13,
                                                              y__val_rml_14)
                                                                ->
                                                               Lco_ctrl_tree_record.rml_seq
                                                                 (Lco_ctrl_tree_record.rml_compute
                                                                   (function
                                                                    | 
                                                                    ()  ->
                                                                    Lco_ctrl_tree_record.rml_expr_emit_val
                                                                    (state__val_rml_6).speed
                                                                    (vx__val_rml_11,
                                                                    vy__val_rml_12);
                                                                    Lco_ctrl_tree_record.rml_expr_emit_val
                                                                    (state__val_rml_6).pos
                                                                    (x__val_rml_13,
                                                                    y__val_rml_14)
                                                                    ))
                                                                 Lco_ctrl_tree_record.rml_pause
                                                           )
                                                   )
                                           )
                                   )
                           )))
               ):
              (_) Lco_ctrl_tree_record.process)
        ) 
;;
let color_of_int =
      (function
        | n__val_rml_16  ->
            (match Pervasives.(mod) n__val_rml_16 7 with | (0)  -> "grey"
             | 1  -> "blue" | 2  -> "lime" | 3  -> "red" | 4  -> "pink"
             | 5  -> "black" | 6  -> "magenta" | _  -> "black" )
        ) 
;;
let random_speed =
      (function
        | k__val_rml_18  ->
            (let alpha__val_rml_19 = Random.float 7.  in
              ((Pervasives.( *. )
                 k__val_rml_18 (Pervasives.cos alpha__val_rml_19)),
               (Pervasives.( *. )
                 k__val_rml_18 (Pervasives.sin alpha__val_rml_19))))
        ) 
;;
let new_state =
      (function
        | ()  ->
            (let pos__sig_22 =
                   Lco_ctrl_tree_record.rml_global_signal_combine
                     ((Pervasives.(/.)
                        (Pervasives.(-.) (box).right (box).left) 2.),
                      (Pervasives.(/.)
                        (Pervasives.(-.) (box).top (box).bot) 2.))
                     (function
                       | x__val_rml_21  -> (function | _  -> x__val_rml_21 )
                       )
               in
              let speed__sig_24 =
                    Lco_ctrl_tree_record.rml_global_signal_combine
                      (random_speed 2.)
                      (function
                        | x__val_rml_23  -> (function | _  -> x__val_rml_23 )
                        )
                 in
                let color__val_rml_25 = color_of_int (Random.int 7)  in
                  {pos=(pos__sig_22);
                   speed=(speed__sig_24);
                   radius=(20.); color=(color__val_rml_25)})
        ) 
;;
let window =
      ((function
         | ()  ->
             Lco_ctrl_tree_record.rml_loop
               (Lco_ctrl_tree_record.rml_await_all'
                 draw
                 (function
                   | all__val_rml_27  ->
                       Lco_ctrl_tree_record.rml_compute
                         (function
                           | ()  ->
                               Graph.clear_graph
                                 (box).left
                                 (box).bot
                                 (Pervasives.(-.) (box).right (box).left)
                                 (Pervasives.(-.) (box).top (box).bot);
                                 List.iter
                                   (function
                                     | state__val_rml_28  ->
                                         (let (x__val_rml_29, y__val_rml_30)
                                                =
                                                Lco_ctrl_tree_record.rml_last
                                                  (state__val_rml_28).pos
                                            in
                                           Graph.fill_circle
                                             x__val_rml_29
                                             y__val_rml_30
                                             (state__val_rml_28).radius
                                             (state__val_rml_28).color)
                                     )
                                   all__val_rml_27
                           )
                   ))
         ):
        (_) Lco_ctrl_tree_record.process) 
;;
let start =
      ((function
         | ()  ->
             Lco_ctrl_tree_record.rml_par_n
               ((Lco_ctrl_tree_record.rml_seq
                  (Lco_ctrl_tree_record.rml_run (function | ()  -> window ))
                  Lco_ctrl_tree_record.rml_nothing)
                 ::
                 ((Lco_ctrl_tree_record.rml_seq
                    (Lco_ctrl_tree_record.rml_run
                      (function | ()  -> move (new_state ()) ))
                    Lco_ctrl_tree_record.rml_nothing)
                   ::
                   ((Lco_ctrl_tree_record.rml_seq
                      (Lco_ctrl_tree_record.rml_run
                        (function | ()  -> move (new_state ()) ))
                      Lco_ctrl_tree_record.rml_nothing)
                     ::
                     ((Lco_ctrl_tree_record.rml_seq
                        (Lco_ctrl_tree_record.rml_run
                          (function | ()  -> move (new_state ()) ))
                        Lco_ctrl_tree_record.rml_nothing)
                       :: ([])))))
         ):
        (_) Lco_ctrl_tree_record.process) 
;;
