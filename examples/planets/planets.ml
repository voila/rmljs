(* THIS FILE IS GENERATED. *)
(* /Users/Emmanuel/Work/rml-1.09.04-nounix/compiler/rmlc -stdlib /Users/Emmanuel/Work/rml-1.09.04-nounix/stdlib planets.rml  *)

open Implem_lco_ctrl_tree_record;;
type  coord
= {  x: float ;   y: float ;   z: float} ;;
type  planet
= {  id: int ;   masse: float ;   pos: coord ;   v: coord} ;;
let g = 6.67 
;;
let dt = 0.1 
;;
let v_init =
      (function
        | ()  ->
            {x=(Pervasives.(-.) (Random.float 100.) 50.);
             y=(Pervasives.(-.) (Random.float 100.) 50.);
             z=(Pervasives.(-.) (Random.float 100.) 50.)}
        ) 
;;
let new_pos =
      (function
        | x__val_rml_5  ->
            (function
              | y__val_rml_6  ->
                  (let max_x_2__val_rml_7 =
                         Pervasives.(/) (Graph.size_x ()) 2
                     in
                    let max_y_2__val_rml_8 =
                          Pervasives.(/) (Graph.size_y ()) 2
                       in
                      {x=(Pervasives.float_of_int
                           (Pervasives.(-) x__val_rml_5 max_x_2__val_rml_7));
                       y=(Pervasives.float_of_int
                           (Pervasives.(-) y__val_rml_6 max_y_2__val_rml_8));
                       z=(Pervasives.(-.) (Random.float 200.) 100.)})
              )
        ) 
;;
let color_of_int =
      (function | (0)  -> Graph.orange | 1  -> Graph.blue | 2  -> Graph.green
        | 3  -> Graph.red | 4  -> Graph.cyan | 5  -> Graph.black
        | 6  -> Graph.magenta | _  -> Graph.black ) 
;;
let compute_pos =
      (let distance2__val_rml_11 =
             (function
               | pos1__val_rml_12  ->
                   (function
                     | pos2__val_rml_13  ->
                         Pervasives.(+.)
                           (Pervasives.(+.)
                             (Pervasives.( *. )
                               (Pervasives.(-.)
                                 (pos2__val_rml_13).x (pos1__val_rml_12).x)
                               (Pervasives.(-.)
                                 (pos2__val_rml_13).x (pos1__val_rml_12).x))
                             (Pervasives.( *. )
                               (Pervasives.(-.)
                                 (pos2__val_rml_13).y (pos1__val_rml_12).y)
                               (Pervasives.(-.)
                                 (pos2__val_rml_13).y (pos1__val_rml_12).y)))
                           (Pervasives.( *. )
                             (Pervasives.(-.)
                               (pos2__val_rml_13).z (pos1__val_rml_12).z)
                             (Pervasives.(-.)
                               (pos2__val_rml_13).z (pos1__val_rml_12).z))
                     )
               )
         in
        let force__val_rml_14 =
              (function
                | p1__val_rml_15  ->
                    (function
                      | p2__val_rml_16  ->
                          (let d2__val_rml_17 =
                                 distance2__val_rml_11
                                   (p1__val_rml_15).pos (p2__val_rml_16).pos
                             in
                            let d__val_rml_18 =
                                  Pervasives.sqrt d2__val_rml_17
                               in
                              if Pervasives.(<>) d__val_rml_18 (0.) then
                                (let f12__val_rml_19 =
                                       Pervasives.(/.)
                                         (Pervasives.( *. )
                                           g (p2__val_rml_16).masse)
                                         d2__val_rml_17
                                   in
                                  ((Pervasives.(/.)
                                     (Pervasives.( *. )
                                       f12__val_rml_19
                                       (Pervasives.(-.)
                                         (p2__val_rml_16).pos.x
                                         (p1__val_rml_15).pos.x))
                                     d__val_rml_18),
                                   (Pervasives.(/.)
                                     (Pervasives.( *. )
                                       f12__val_rml_19
                                       (Pervasives.(-.)
                                         (p2__val_rml_16).pos.y
                                         (p1__val_rml_15).pos.y))
                                     d__val_rml_18),
                                   (Pervasives.(/.)
                                     (Pervasives.( *. )
                                       f12__val_rml_19
                                       (Pervasives.(-.)
                                         (p2__val_rml_16).pos.z
                                         (p1__val_rml_15).pos.z))
                                     d__val_rml_18)))
                                else ((0.), (0.), (0.)))
                      )
                )
           in
          function
            | me__val_rml_20  ->
                (function
                  | all__val_rml_21  ->
                      (let (fx__val_rml_22, fy__val_rml_23, fz__val_rml_24) =
                             List.fold_left
                               (function
                                 | (fx__val_rml_25,
                                    fy__val_rml_26, fz__val_rml_27)  ->
                                     (function
                                       | p__val_rml_28  ->
                                           (let (x__val_rml_29,
                                                 y__val_rml_30, z__val_rml_31)
                                                  =
                                                  force__val_rml_14
                                                    me__val_rml_20
                                                    p__val_rml_28
                                              in
                                             ((Pervasives.(+.)
                                                fx__val_rml_25 x__val_rml_29),
                                              (Pervasives.(+.)
                                                fy__val_rml_26 y__val_rml_30),
                                              (Pervasives.(+.)
                                                fz__val_rml_27 z__val_rml_31)))
                                       )
                                 )
                               ((0.), (0.), (0.)) all__val_rml_21
                         in
                        let v__val_rml_32 =
                              {x=(Pervasives.(+.)
                                   (me__val_rml_20).v.x
                                   (Pervasives.( *. ) fx__val_rml_22 dt));
                               y=(Pervasives.(+.)
                                   (me__val_rml_20).v.y
                                   (Pervasives.( *. ) fy__val_rml_23 dt));
                               z=(Pervasives.(+.)
                                   (me__val_rml_20).v.z
                                   (Pervasives.( *. ) fz__val_rml_24 dt))}
                           in
                          let pos__val_rml_33 =
                                {x=(Pervasives.(+.)
                                     (me__val_rml_20).pos.x
                                     (Pervasives.( *. ) (v__val_rml_32).x dt));
                                 y=(Pervasives.(+.)
                                     (me__val_rml_20).pos.y
                                     (Pervasives.( *. ) (v__val_rml_32).y dt));
                                 z=(Pervasives.(+.)
                                     (me__val_rml_20).pos.z
                                     (Pervasives.( *. ) (v__val_rml_32).z dt))}
                             in
                            {id=(me__val_rml_20).id;
                             masse=(me__val_rml_20).masse;
                             pos=(pos__val_rml_33); v=(v__val_rml_32)})
                  )
            ) 
;;
let maj_aff =
      (function
        | all__val_rml_35  ->
            Graph.clear_graph ();
              (let max_x_2__val_rml_36 =
                     Pervasives.(/.)
                       (Pervasives.float_of_int (Graph.size_x ())) 2.
                 in
                let max_y_2__val_rml_37 =
                      Pervasives.(/.)
                        (Pervasives.float_of_int (Graph.size_y ())) 2.
                   in
                  List.iter
                    (function
                      | p__val_rml_38  ->
                          (let x0__val_rml_39 =
                                 Pervasives.(+.)
                                   (p__val_rml_38).pos.x max_x_2__val_rml_36
                             in
                            let y0__val_rml_40 =
                                  Pervasives.(+.)
                                    (p__val_rml_38).pos.y max_y_2__val_rml_37
                               in
                              let rad__val_rml_41 =
                                    if
                                      Pervasives.(&&)
                                        (Pervasives.(<)
                                          (-200.) (p__val_rml_38).pos.z)
                                        (Pervasives.(<)
                                          (p__val_rml_38).pos.z 5000.)
                                      then
                                      Pervasives.(+.)
                                        5.
                                        (Pervasives.(/.)
                                          (p__val_rml_38).pos.z 50.)
                                      else 1.
                                 in
                                let clr__val_rml_42 =
                                      color_of_int
                                        (Pervasives.(mod)
                                          (p__val_rml_38).id 7)
                                   in
                                  Graph.fill_circle
                                    x0__val_rml_39
                                    y0__val_rml_40
                                    rad__val_rml_41 clr__val_rml_42)
                      )
                    all__val_rml_35)
        ) 
;;
let planet =
      (function
        | id__val_rml_44  ->
            (function
              | masse__val_rml_45  ->
                  (function
                    | pos_init__val_rml_46  ->
                        (function
                          | v_init__val_rml_47  ->
                              (function
                                | p__val_rml_48  ->
                                    ((function
                                       | ()  ->
                                           Lco_ctrl_tree_record.rml_def
                                             (function
                                               | ()  ->
                                                   Pervasives.ref
                                                     {id=(id__val_rml_44);
                                                      masse=(masse__val_rml_45);
                                                      pos=(pos_init__val_rml_46);
                                                      v=(v_init__val_rml_47)}
                                               )
                                             (function
                                               | me__val_rml_49  ->
                                                   Lco_ctrl_tree_record.rml_loop
                                                     (Lco_ctrl_tree_record.rml_seq
                                                       (Lco_ctrl_tree_record.rml_emit_val'
                                                         p__val_rml_48
                                                         (function
                                                           | ()  ->
                                                               Pervasives.(!)
                                                                 me__val_rml_49
                                                           ))
                                                       (Lco_ctrl_tree_record.rml_await_all'
                                                         p__val_rml_48
                                                         (function
                                                           | all__val_rml_50
                                                                ->
                                                               Lco_ctrl_tree_record.rml_compute
                                                                 (function
                                                                   | 
                                                                   ()  ->
                                                                    Pervasives.(:=)
                                                                    me__val_rml_49
                                                                    (compute_pos
                                                                    (Pervasives.(!)
                                                                    me__val_rml_49)
                                                                    all__val_rml_50)
                                                                   )
                                                           )))
                                               )
                                       ):
                                      (_) Lco_ctrl_tree_record.process)
                                )
                          )
                    )
              )
        ) 
;;
let soleil =
      (function
        | id__val_rml_52  ->
            (function
              | masse__val_rml_53  ->
                  (function
                    | pos_init__val_rml_54  ->
                        (function
                          | p__val_rml_55  ->
                              ((function
                                 | ()  ->
                                     Lco_ctrl_tree_record.rml_def
                                       (function
                                         | ()  ->
                                             {id=(id__val_rml_52);
                                              masse=(masse__val_rml_53);
                                              pos=(pos_init__val_rml_54);
                                              v=({x=((0.));
                                                  y=((0.)); z=((0.))})}
                                         )
                                       (function
                                         | me__val_rml_56  ->
                                             Lco_ctrl_tree_record.rml_loop
                                               (Lco_ctrl_tree_record.rml_seq
                                                 (Lco_ctrl_tree_record.rml_emit_val'
                                                   p__val_rml_55
                                                   (function
                                                     | ()  -> me__val_rml_56
                                                     ))
                                                 Lco_ctrl_tree_record.rml_pause)
                                         )
                                 ):
                                (_) Lco_ctrl_tree_record.process)
                          )
                    )
              )
        ) 
;;
let click_of_button_down =
      (function
        | click__val_rml_58  ->
            ((function
               | ()  ->
                   Lco_ctrl_tree_record.rml_loop
                     (Lco_ctrl_tree_record.rml_seq
                       (Lco_ctrl_tree_record.rml_compute
                         (function
                           | ()  ->
                               if Graph.button_down () then
                                 Lco_ctrl_tree_record.rml_expr_emit_val
                                   click__val_rml_58 (Graph.mouse_pos ())
                                 else ()
                           ))
                       Lco_ctrl_tree_record.rml_pause)
               ):
              (_) Lco_ctrl_tree_record.process)
        ) 
;;
let key_of_key_pressed =
      (function
        | key__val_rml_60  ->
            ((function
               | ()  ->
                   Lco_ctrl_tree_record.rml_loop
                     (Lco_ctrl_tree_record.rml_seq
                       (Lco_ctrl_tree_record.rml_compute
                         (function
                           | ()  ->
                               if Graph.key_pressed () then
                                 Lco_ctrl_tree_record.rml_expr_emit_val
                                   key__val_rml_60 (Graph.read_key ())
                                 else ()
                           ))
                       Lco_ctrl_tree_record.rml_pause)
               ):
              (_) Lco_ctrl_tree_record.process)
        ) 
;;
let fenetre =
      (function
        | new_planet__val_rml_62  ->
            (function
              | p__val_rml_63  ->
                  (function
                    | kill_sun__val_rml_64  ->
                        (function
                          | kill__val_rml_65  ->
                              (function
                                | suspend__val_rml_66  ->
                                    ((function
                                       | ()  ->
                                           (let read_click__val_rml_67 =
                                                  ((function
                                                     | ()  ->
                                                         Lco_ctrl_tree_record.rml_signal
                                                           (function
                                                             | click__sig_68
                                                                  ->
                                                                 Lco_ctrl_tree_record.rml_par
                                                                   (Lco_ctrl_tree_record.rml_run
                                                                    (function
                                                                    | ()  ->
                                                                    click_of_button_down
                                                                    click__sig_68
                                                                    ))
                                                                   (Lco_ctrl_tree_record.rml_loop
                                                                    (Lco_ctrl_tree_record.rml_present'
                                                                    click__sig_68
                                                                    Lco_ctrl_tree_record.rml_pause
                                                                    (Lco_ctrl_tree_record.rml_await_immediate_one'
                                                                    click__sig_68
                                                                    (function
                                                                    | (x__val_rml_69,
                                                                    y__val_rml_70)
                                                                     ->
                                                                    Lco_ctrl_tree_record.rml_seq
                                                                    (Lco_ctrl_tree_record.rml_emit_val'
                                                                    new_planet__val_rml_62
                                                                    (function
                                                                    | ()  ->
                                                                    new_pos
                                                                    x__val_rml_69
                                                                    y__val_rml_70
                                                                    ))
                                                                    Lco_ctrl_tree_record.rml_pause
                                                                    ))))
                                                             )
                                                     ):
                                                    (_)
                                                      Lco_ctrl_tree_record.process)
                                              in
                                             let read_key__val_rml_71 =
                                                   ((function
                                                      | ()  ->
                                                          Lco_ctrl_tree_record.rml_signal
                                                            (function
                                                              | key__sig_72
                                                                   ->
                                                                  Lco_ctrl_tree_record.rml_par
                                                                    (Lco_ctrl_tree_record.rml_run
                                                                    (function
                                                                    | ()  ->
                                                                    key_of_key_pressed
                                                                    key__sig_72
                                                                    ))
                                                                    (Lco_ctrl_tree_record.rml_loop
                                                                    (Lco_ctrl_tree_record.rml_await_immediate_one'
                                                                    key__sig_72
                                                                    (function
                                                                    | c__val_rml_73
                                                                     ->
                                                                    Lco_ctrl_tree_record.rml_seq
                                                                    (Lco_ctrl_tree_record.rml_seq
                                                                    (Lco_ctrl_tree_record.rml_compute
                                                                    (function
                                                                    | ()  ->
                                                                    Pervasives.print_string
                                                                    "key_pressed = ";
                                                                    Pervasives.print_char
                                                                    c__val_rml_73;
                                                                    Pervasives.print_newline
                                                                    () ))
                                                                    (Lco_ctrl_tree_record.rml_match
                                                                    (function
                                                                    | ()  ->
                                                                    c__val_rml_73
                                                                    )
                                                                    (function
                                                                    | 's'  ->
                                                                    Lco_ctrl_tree_record.rml_compute
                                                                    (function
                                                                    | ()  ->
                                                                    Lco_ctrl_tree_record.rml_expr_emit
                                                                    kill_sun__val_rml_64
                                                                    )
                                                                    | 'k'  ->
                                                                    Lco_ctrl_tree_record.rml_compute
                                                                    (function
                                                                    | ()  ->
                                                                    Lco_ctrl_tree_record.rml_expr_emit
                                                                    kill__val_rml_65
                                                                    )
                                                                    | 'p'  ->
                                                                    Lco_ctrl_tree_record.rml_compute
                                                                    (function
                                                                    | ()  ->
                                                                    Lco_ctrl_tree_record.rml_expr_emit
                                                                    suspend__val_rml_66
                                                                    )
                                                                    | 'q'  ->
                                                                    Lco_ctrl_tree_record.rml_compute
                                                                    (function
                                                                    | ()  ->
                                                                    Pervasives.exit
                                                                    (0) )
                                                                    | _  ->
                                                                    Lco_ctrl_tree_record.rml_nothing
                                                                    )))
                                                                    Lco_ctrl_tree_record.rml_pause
                                                                    )))
                                                              )
                                                      ):
                                                     (_)
                                                       Lco_ctrl_tree_record.process)
                                                in
                                               Lco_ctrl_tree_record.rml_signal
                                                 (function
                                                   | aff__sig_74  ->
                                                       Lco_ctrl_tree_record.rml_par_n
                                                         ((Lco_ctrl_tree_record.rml_loop
                                                            (Lco_ctrl_tree_record.rml_await_all'
                                                              p__val_rml_63
                                                              (function
                                                                | all__val_rml_75
                                                                     ->
                                                                    Lco_ctrl_tree_record.rml_seq
                                                                    (Lco_ctrl_tree_record.rml_seq
                                                                    (Lco_ctrl_tree_record.rml_compute
                                                                    (function
                                                                    | ()  ->
                                                                    maj_aff
                                                                    all__val_rml_75
                                                                    ))
                                                                    Lco_ctrl_tree_record.rml_pause)
                                                                    Lco_ctrl_tree_record.rml_pause
                                                                )))
                                                           ::
                                                           ((Lco_ctrl_tree_record.rml_seq
                                                              (Lco_ctrl_tree_record.rml_run
                                                                (function
                                                                  | ()  ->
                                                                    read_click__val_rml_67
                                                                  ))
                                                              Lco_ctrl_tree_record.rml_nothing)
                                                             ::
                                                             ((Lco_ctrl_tree_record.rml_seq
                                                                (Lco_ctrl_tree_record.rml_run
                                                                  (function
                                                                    | 
                                                                    ()  ->
                                                                    read_key__val_rml_71
                                                                    ))
                                                                Lco_ctrl_tree_record.rml_nothing)
                                                               :: ([]))))
                                                   ))
                                       ):
                                      (_) Lco_ctrl_tree_record.process)
                                )
                          )
                    )
              )
        ) 
;;
let rec add_aux =
          (function
            | id__val_rml_77  ->
                (function
                  | new_planet__val_rml_78  ->
                      (function
                        | kill__val_rml_79  ->
                            (function
                              | kill_new__val_rml_80  ->
                                  (function
                                    | p__val_rml_81  ->
                                        ((function
                                           | ()  ->
                                               Lco_ctrl_tree_record.rml_await_all'
                                                 new_planet__val_rml_78
                                                 (function
                                                   | pos__val_rml_82  ->
                                                       Lco_ctrl_tree_record.rml_par
                                                         (Lco_ctrl_tree_record.rml_until'
                                                           kill_new__val_rml_80
                                                           (Lco_ctrl_tree_record.rml_run
                                                             (function
                                                               | ()  ->
                                                                   planet
                                                                    id__val_rml_77
                                                                    1.
                                                                    (List.hd
                                                                    pos__val_rml_82)
                                                                    (v_init
                                                                    ())
                                                                    p__val_rml_81
                                                               )))
                                                         (Lco_ctrl_tree_record.rml_signal
                                                           (function
                                                             | new_kill_new__sig_83
                                                                  ->
                                                                 Lco_ctrl_tree_record.rml_par
                                                                   (Lco_ctrl_tree_record.rml_run
                                                                    (function
                                                                    | ()  ->
                                                                    add_aux
                                                                    (Pervasives.(+)
                                                                    id__val_rml_77
                                                                    1)
                                                                    new_planet__val_rml_78
                                                                    kill__val_rml_79
                                                                    new_kill_new__sig_83
                                                                    p__val_rml_81
                                                                    ))
                                                                   (Lco_ctrl_tree_record.rml_seq
                                                                    (Lco_ctrl_tree_record.rml_seq
                                                                    (Lco_ctrl_tree_record.rml_par
                                                                    (Lco_ctrl_tree_record.rml_await'
                                                                    new_planet__val_rml_78)
                                                                    (Lco_ctrl_tree_record.rml_await_immediate'
                                                                    kill_new__val_rml_80))
                                                                    (Lco_ctrl_tree_record.rml_await'
                                                                    kill__val_rml_79))
                                                                    (Lco_ctrl_tree_record.rml_emit'
                                                                    new_kill_new__sig_83))
                                                             ))
                                                   )
                                           ):
                                          (_) Lco_ctrl_tree_record.process)
                                    )
                              )
                        )
                  )
            ) 
;;
let add =
      (function
        | id__val_rml_85  ->
            (function
              | new_planet__val_rml_86  ->
                  (function
                    | kill__val_rml_87  ->
                        (function
                          | p__val_rml_88  ->
                              ((function
                                 | ()  ->
                                     Lco_ctrl_tree_record.rml_run
                                       (function
                                         | ()  ->
                                             add_aux
                                               id__val_rml_85
                                               new_planet__val_rml_86
                                               kill__val_rml_87
                                               kill__val_rml_87 p__val_rml_88
                                         )
                                 ):
                                (_) Lco_ctrl_tree_record.process)
                          )
                    )
              )
        ) 
;;
let systeme =
      ((function
         | ()  ->
             Lco_ctrl_tree_record.rml_signal
               (function
                 | p__sig_90  ->
                     Lco_ctrl_tree_record.rml_signal
                       (function
                         | new_planet__sig_91  ->
                             Lco_ctrl_tree_record.rml_signal
                               (function
                                 | kill_sun__sig_92  ->
                                     Lco_ctrl_tree_record.rml_signal
                                       (function
                                         | kill__sig_93  ->
                                             Lco_ctrl_tree_record.rml_signal
                                               (function
                                                 | suspend__sig_94  ->
                                                     Lco_ctrl_tree_record.rml_signal
                                                       (function
                                                         | active__sig_95  ->
                                                             Lco_ctrl_tree_record.rml_par
                                                               (Lco_ctrl_tree_record.rml_run
                                                                 (function
                                                                   | 
                                                                   ()  ->
                                                                    fenetre
                                                                    new_planet__sig_91
                                                                    p__sig_90
                                                                    kill_sun__sig_92
                                                                    kill__sig_93
                                                                    suspend__sig_94
                                                                   ))
                                                               (Lco_ctrl_tree_record.rml_control'
                                                                 suspend__sig_94
                                                                 (Lco_ctrl_tree_record.rml_par_n
                                                                   ((Lco_ctrl_tree_record.rml_until'
                                                                    kill_sun__sig_92
                                                                    (Lco_ctrl_tree_record.rml_run
                                                                    (function
                                                                    | ()  ->
                                                                    soleil
                                                                    (0)
                                                                    30000.
                                                                    {x=
                                                                    ((0.));
                                                                    y=
                                                                    ((0.));
                                                                    z=
                                                                    ((0.))}
                                                                    p__sig_90
                                                                    ))) ::
                                                                    ((Lco_ctrl_tree_record.rml_seq
                                                                    (Lco_ctrl_tree_record.rml_run
                                                                    (function
                                                                    | ()  ->
                                                                    planet
                                                                    1
                                                                    1.
                                                                    {x=
                                                                    ((0.));
                                                                    y=
                                                                    ((-200.));
                                                                    z=
                                                                    ((0.))}
                                                                    {x=
                                                                    (30.);
                                                                    y=
                                                                    ((0.));
                                                                    z=
                                                                    ((0.))}
                                                                    p__sig_90
                                                                    ))
                                                                    Lco_ctrl_tree_record.rml_nothing)
                                                                    ::
                                                                    ((Lco_ctrl_tree_record.rml_seq
                                                                    (Lco_ctrl_tree_record.rml_run
                                                                    (function
                                                                    | ()  ->
                                                                    planet
                                                                    2
                                                                    1.
                                                                    {x=
                                                                    ((0.));
                                                                    y=
                                                                    (200.);
                                                                    z=
                                                                    ((0.))}
                                                                    {x=
                                                                    ((-30.));
                                                                    y=
                                                                    ((0.));
                                                                    z=
                                                                    ((0.))}
                                                                    p__sig_90
                                                                    ))
                                                                    Lco_ctrl_tree_record.rml_nothing)
                                                                    ::
                                                                    ((Lco_ctrl_tree_record.rml_seq
                                                                    (Lco_ctrl_tree_record.rml_run
                                                                    (function
                                                                    | ()  ->
                                                                    planet
                                                                    3
                                                                    1.
                                                                    {x=
                                                                    (200.);
                                                                    y=
                                                                    ((0.));
                                                                    z=
                                                                    ((0.))}
                                                                    {x=
                                                                    ((0.));
                                                                    y=
                                                                    ((0.));
                                                                    z=
                                                                    (30.)}
                                                                    p__sig_90
                                                                    ))
                                                                    Lco_ctrl_tree_record.rml_nothing)
                                                                    ::
                                                                    ((Lco_ctrl_tree_record.rml_seq
                                                                    (Lco_ctrl_tree_record.rml_run
                                                                    (function
                                                                    | ()  ->
                                                                    add
                                                                    4
                                                                    new_planet__sig_91
                                                                    kill__sig_93
                                                                    p__sig_90
                                                                    ))
                                                                    Lco_ctrl_tree_record.rml_nothing)
                                                                    :: 
                                                                    ([]))))))))
                                                         )
                                                 )
                                         )
                                 )
                         )
                 )
         ):
        (_) Lco_ctrl_tree_record.process) 
;;
let start =
      ((function
         | ()  ->
             Lco_ctrl_tree_record.rml_seq
               (Lco_ctrl_tree_record.rml_compute
                 (function | ()  -> Random.self_init () ))
               (Lco_ctrl_tree_record.rml_run (function | ()  -> systeme ))
         ):
        (_) Lco_ctrl_tree_record.process) 
;;
