(* bin/main.ml *)
(* imperative mode *)

let calculate number =
  let inside = ref 0 in
  for _ = 1 to number do
    let x = Random.float 1.0 in
    let y = Random.float 1.0 in
    if x *. x +. y *. y <= 1.0 then
      incr inside
  done;
  (float_of_int !inside /. float_of_int number) *. 4.0

let () =
  Random.self_init ();
  let number = 100_000_000 in
  let pi = calculate number in
    Printf.printf "%f\n" pi
