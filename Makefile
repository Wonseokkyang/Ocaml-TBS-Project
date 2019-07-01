
main: g_test.ml
	ocamlfind ocamlopt -package graphics,unix -linkpkg -o $@ $^

clean:
	-rm main *.cmx *.cmi *.o
