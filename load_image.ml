(* Using the prof's example of image loading *)
(* he uses this function to convert the image to ints *)
let load_array filename = 
  let img = ImageLib.openfile filename in
  let w = img.Image.width in (*looks similar to graphics*)
  let h = img.Image.height in
  let max_val = img.Image.max_val in (*unsure what max val is*)

  Array.init h (fun y ->
    Array.init w (fun x -> 
      Image.read_rgb img x y
	(fun r g b ->
	  r *256 *256 *255 /max_val +
	  g *256 *255 /max_val +
	  b *255 /max_val)
    )
  )

let sub_image x y w h opt_transp arr =
  let sub_arr = 
    Array.init h (fun j ->
      let row = Array.sub arr.(y+j) x w in
      match opt_transp with
      | Some transpcolor -> Array.map (fun c -> if c = transpcolor then Graphics.transp else c) row
      | None -> row
    )
  in 
  Graphics.make_image sub_arr
