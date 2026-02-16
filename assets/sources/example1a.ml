(* bin/mail.ml *)
(* functional mode *)

let calculate number =
  let rec loop i inside =
  if i >= number then
    (float_of_int inside /. float_of_int number) *. 4.0
  else
    let x = Random.float 1.0 in
    let y = Random.float 1.0 in
    let inside =
      if x *. x +. y *. y <= 1.0 then
        inside + 1
      else
        inside
    in
      loop (i + 1) inside
  in
    loop 0 0

let () =
  Random.self_init ();
  let number = 100_000_000 in
  let pi = calculate number in
    Printf.printf "%f\n" pi
