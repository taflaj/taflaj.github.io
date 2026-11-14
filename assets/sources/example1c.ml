(* bin/main.ml *)
(* using Seq *)

let estimate_pi n =
  let random_point () = (Random.float 1.0, Random.float 1.0) in
  let inside =
    Seq.ints 0
    |> Seq.take n
    |> Seq.map (fun _ -> random_point ())
    |> Seq.filter (fun (x, y) -> x *. x +. y *. y <= 1.0)
    |> Seq.length
  in
  4.0 *. float_of_int inside /. float_of_int n

let () =
  Random.self_init ();
  let n = 100_000_000 in
  Printf.printf "Estimated pi with %d samples: %f\n" n (estimate_pi n)
