(* bin/main.ml *)
(* folding *)

let estimate_pi n =
  let inside =
    Seq.ints 0
    |> Seq.take n
    |> Seq.fold_left
         (fun acc _ ->
           let x = Random.float 1.0 and y = Random.float 1.0 in
           if x *. x +. y *. y <= 1.0 then acc + 1 else acc)
         0
  in
  4.0 *. float_of_int inside /. float_of_int n

let () =
  Random.self_init ();
  let n = 100_000_000 in
  Printf.printf "Estimated pi with %d samples: %f\n" n (estimate_pi n)
