
main: load_image.ml g_test.ml
	ocamlfind ocamlopt -package graphics,unix,imagelib -linkpkg -o $@ $^

clean:
	-rm main *.cmx *.cmi *.o
