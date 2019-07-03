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
    the screen *)
  let make (x,y) =
     (0, 0)

  (*He has this push function to alter the ball over time. Maybe I can
    use it to "push" the cursor?*)
  (* Push cursor position by (fx, fy) unless it's at the window boundry*)
  let push (w,h) (fx, fy) state =
    let (x, y) = state in
      if (x + fx < 0) then      (0, y + fy)
      else if (x + fx >= w) then (x, y + fy)
      else if (y + fy < 0) then (x + fx, 0)
      else if (y + fy >= h) then (x + fx, y)
      else 
	(x + fx, y + fy)

  (* I wont be needing to update over time like the prof's ex. 
     I only need to update once for a valid direction input*)
(*Actually.. I dont think I even need change over time. Push takes care of
taking input and changing position*)
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
  Graphics.set_color Graphics.white;
  Graphics.fill_rect 0 0 (Graphics.size_x()) (Graphics.size_y());

  (*I want to draw the cursor here*)
  let (x, y) = state in
  Graphics.set_color 0x7D8BCF;
  Graphics.set_line_width 3;
  Graphics.draw_rect x y ((Graphics.size_x()-2)/10) ((Graphics.size_y()-2)/10);
  Graphics.set_color Graphics.black;
  Graphics.draw_rect x y (Graphics.size_x()/10) (Graphics.size_y()/10);
  Graphics.synchronize()

let () =
  Graphics.open_graph " 500x500";
  Graphics.auto_synchronize false;
  at_exit Graphics.close_graph;

  (* A square is 1/10 of the total size*)
  let unit = Graphics.size_x()/10 in
  let w = Graphics.size_x() in
  let h = Graphics.size_y() in
 
  (*In this function the prof had time_prev to track timestamps for
    FPS tracking and st for state tracking. I don't think time_prev
    is necessary.. maybe lol.*)
  let rec loop st =

    (*I should probably keep this sleep so I dont blow up my Pi lol*)
    Unix.sleep 2;

    match get_event () with
    | Some Exit -> ()
    | opt ->
	let st2 = (*I needed to add the %! because it wouldn't print otherwise :/ *)
	  match opt with
	  | None -> st (*you're returning the "st" variable?*)
	  | Some Left -> Printf.printf "Left\n%!";
		State.push (w,h) (-unit,0) st
	  | Some Up -> Printf.printf "Up\n%!";
		State.push (w,h) (0,unit) st
	  | Some Right -> Printf.printf "Right\n%!";
		State.push (w,h) (unit,0) st
	  | Some Down -> Printf.printf "Down\n%!";
		State.push (w,h) (0,-unit) st
	  | Some _ -> st
	in

	(*he has a function here to update game state over time
	  with what I assume to be the change from the match he has prev
	  to this*)

	(*draw*)
	draw st2;

	(*calling loop again*)
	loop st2
  in
  let w = Graphics.size_x () in
  let h = Graphics.size_y () in

  loop (State.make (w,h))
