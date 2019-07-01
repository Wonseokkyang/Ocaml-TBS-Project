(** Testing different parts of code provided by professor **)
(** Also try different things with the graphics module to see how all the
    parts work together **)

(*Game state*)
(*I think this tracks the variable parts of the game like cursor, grid etc*)
module State = struct (*Custom module called State*)

  (* Initial cursor state?*)
  (*in the prof's example, he had a ball that would change position and
    velocty and this function held the x,y, and respective velocities.
    If I want to use a cursor, I dont need velocity but only a position
    tracker and way to change position.*)
  (*Initializes the cursor in the middle of the screen given size of 
    the screen*)*)
  let make (x,y) =
    (0.5 *. float x, 0.5 *. float y)

  (*He has this push function to alter the ball over time. Maybe I can
    use it to "push" the cursor?*)
  let push (fx, fy) dt state =
    let (x, y, vx, vy) = state in
    (x, y, vx +. fx*.dt, vy +. fy*.dt)

  (* I wont be needing to update over time like the prof's ex. 
     I only need to update once for a valid direction input*)
  let update (w, h) dt st =
    let (x, y, vx, vy) = st in

    (* gravity *)
    let gy = -300.0 in
    let vy = vy +. gy*.dt in

    (* displacement *)
    let x = x +. vx*.dt in
    let y = y +. vy*.dt in

    (* bounce off the walls *)
    let dissipation = 0.95 in
    if x < 0.0 then
      (0.0, y, -.vx *. dissipation, vy)
    else if x > float w then
      (float w, y, -.vx *. dissipation, vy)
    else if y < 0.0 then
      (x, 0.0, vx, -.vy *. dissipation)
    else if y > float h then
      (x, float h, vx, -.vy *. dissipation)
    else
      (x, y, vx, vy)


end

(* event type to take user input *)
(* Exit = q *)
type event = 
  Up | Down | Left | Right | Exit

let get_event () = 
  if Graphics.key_pressed () then begin
    let ch = Graphics.read_key () in
    match ch with
    | 'w' | 'W' -> Some Up
    | 'a' | 'A' -> Some Left
    | 'd' | 'D' -> Some Right
    | 's' | 'S' -> Some Down
    | 'q' | 'Q' -> Some Exit
    | _ -> None
  end else
    None

let draw state = 
  (* BG gets drawn first and everything else overlayed on top*)
  (* Draw white background the size of the screen from bottom left *)
  Graphics.set_color white;
  Graphics.fill_rect 0 0 (Graphics.size_x()) (Graphics.size_y());

  (*I want to draw the cursor here*)
  ()

let () =
  Graphics.open_graph " 500x500"; (*1 grid=50x50*)
  at_exit Graphics.close_graph;

  (*In this function the prof had time_prev to track timestamps for
    FPS tracking and st for state tracking. I don't think time_prev
    is necessary.. maybe lol.*)
  let rec loop st =
    match get_event () with
    | Some Exit -> ()
    | opt ->
	let st2 = (*not sure what this does*)
	  match opt with
	  | None -> st (*you're returning the "st" variable?*)
	  | Some Left -> Printf.printf "Left\n" (*do nothing for now*)
	  | Some Up ->  Printf.printf "Up\n"
	  | Some Right ->  Printf.printf "Right\n"
	  | Some Down ->  Printf.printf "Down\n"
	  | Some _ -> st
	in

	(*he has a function here to update game state over time
	  with what I assume to be the change from the match he has prev
	  to this*)
	let w = Graphics.size_x () in
	let h = Graphics.size_y () in
	let st3 = State.update (w, h)

