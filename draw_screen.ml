(* I want to separate all the draw functions here to clean up the main prog.
  It's getting messy and hard to follow lol *)

(* terrain types to draw map tiles *)
type terrain =
  Default | Forest | Hills

(* Board will be 10x10 for now *)
(*   -----------------------------------------
r9   | D | F | H | D | F | H | D | F | H | D |
     -----------------------------------------
r8   | D | F | H | D | F | H | D | F | H | D |
     -----------------------------------------
r7   | D | F | H | D | F | H | D | F | H | D |
     -----------------------------------------
r6   | D | F | H | D | F | H | D | F | H | D |
     -----------------------------------------
r5   | D | F | H | D | F | H | D | F | H | D |
     -----------------------------------------
r4   | D | F | H | D | F | H | D | F | H | D |
     -----------------------------------------
r3   | D | F | H | D | F | H | D | F | H | D |
     -----------------------------------------
r2   | D | F | H | D | F | H | D | F | H | D |
     -----------------------------------------
r1   | D | F | H | D | F | H | D | F | H | D |
     -----------------------------------------
r0   | D | F | H | D | F | H | D | F | H | D |
     -----------------------------------------
      c0  c1  c2  c3  c4  c5  c6  c7  c8  c9   *)

let board =
  let d = Default in
  let f = Forest in
  let h = Hills in
(*r0*) [ [h; h; h; h; h; h; h; h; h; h];
(*r1*)   [h; d; d; d; h; f; f; f; f; h];
(*r2*)   [h; d; d; d; h; f; f; f; d; h];
(*r3*)   [h; d; d; d; h; f; d; d; f; h];
(*r4*)   [h; h; h; d; h; f; f; d; f; h];
(*r5*)   [h; f; f; d; f; f; f; d; f; h];
(*r6*)   [h; f; f; d; d; d; f; d; f; h];
(*r7*)   [h; f; f; f; d; d; d; d; f; h];
(*r8*)   [h; f; f; f; f; f; f; f; f; h];
(*r9*)   [h; h; h; h; h; h; h; h; h; h]; ]

(* I want this function to be in charge of calling all other draw
  funtions. 
  Order of operation:
  -board
  -units
  -cursor *)
(*let draw_all board units cursor =*)
  (*call function to draw board*)
    (*use <board_img> initialized at beginning of program*)
  (*call function to draw units*)
  (*call function to draw cursor*)



(* Function to initialize game board. Returns Graphics type <image> *)
let board_init tile_list =
  (* Draw game board here *)
  let unit = Graphics.size_x()/10 in
  let base_color terrain xpos ypos=
      let draw_thing thing =
        "img/"^thing
        |> Load_image.load_array
        |> Load_image.sub_image 0 0 (unit) (unit) (Some (0x00FFFF))
      in

      if terrain = Default then (
        Graphics.set_color 0x999900;
        Graphics.fill_rect xpos ypos unit unit
      )
      else if terrain = Forest then
        Graphics.draw_image (draw_thing "tree.png") xpos ypos
      else if terrain = Hills then
        Graphics.draw_image (draw_thing "mountain.png") xpos ypos
  in

  let rec draw_row xpos ypos = function
     | hd::tl ->
      base_color hd xpos ypos;
      Graphics.set_color Graphics.black;
      Graphics.set_line_width 1;
      Graphics.draw_rect xpos ypos unit unit;
      draw_row (xpos+unit) (ypos) tl
     | [] -> ()
  in

  let rec draw_board_aux ypos = function
    | hd::tl -> begin
              draw_row 0 ypos hd;
              draw_board_aux (ypos+unit) tl;
              end
    | [] -> ()
  in

  let draw_board gameboard = draw_board_aux 0 gameboard;
  in draw_board tile_list;

  (* This captures everything that's been drawn on the screen and returns
     as type image *)
  Graphics.get_image 0 0 (Graphics.size_x()) (Graphics.size_y())

