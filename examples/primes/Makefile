RML_NOUNIX=$(HOME)/Work/rml-1.09.04-nounix
RMLC=$(RML_NOUNIX)/compiler/rmlc
INTERPRETERDIR=$(RML_NOUNIX)/interpreter
LCODIR=$(RML_NOUNIX)/interpreter/lco # `rmlc -where`
STDLIB=$(RML_NOUNIX)/stdlib

all:
	ocamlfind ocamlc -package js_of_ocaml -syntax camlp4o -package js_of_ocaml.syntax -linkpkg -c graph.mli	
	ocamlfind ocamlc -package js_of_ocaml -syntax camlp4o -package js_of_ocaml.syntax -linkpkg -c graph.ml
	$(RMLC) -stdlib $(STDLIB) -c graph.mli # => graph.rzi
	$(RMLC) -stdlib $(STDLIB) prime.rml   # => prime.ml
	ocamlfind ocamlc -package js_of_ocaml -syntax camlp4o -package js_of_ocaml.syntax -linkpkg -I $(LCODIR) -I $(INTERPRETERDIR) rmllib.cma  -c graph.cmo prime.ml
	ocamlfind ocamlc -package js_of_ocaml -syntax camlp4o -package js_of_ocaml.syntax -linkpkg -I $(LCODIR) -I $(INTERPRETERDIR) rmllib.cma  -o main.byte  graph.cmo prime.cmo main.ml
	js_of_ocaml --pretty --opt 1 --noinline main.byte

clean:
	rm *.cmi *.cmo main.js
