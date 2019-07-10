
game: load_image.ml draw_screen.ml g_test.ml
	ocamlfind ocamlopt -package graphics,unix,imagelib -linkpkg -o $@ $^

clean:
	-rm game *.cmx *.cmi *.o
