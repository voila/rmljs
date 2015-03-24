RML_NOUNIX=$(HOME)/Work/rml-1.09.04-nounix
RMLC=$(RML_NOUNIX)/compiler/rmlc
INTERPRETERDIR=$(RML_NOUNIX)/interpreter
LCODIR=$(RML_NOUNIX)/interpreter/lco # `rmlc -where`
STDLIB=$(RML_NOUNIX)/stdlib


all:
	ocamlfind ocamlc -package js_of_ocaml -syntax camlp4o -package js_of_ocaml.syntax -linkpkg -c graph.mli
	ocamlfind ocamlc -package js_of_ocaml -syntax camlp4o -package js_of_ocaml.syntax -linkpkg -g -c graph.ml
	$(RMLC) -stdlib $(STDLIB) -c graph.mli # => graph.rzi
	$(RMLC) -stdlib $(STDLIB) moving.rml   # => moving.ml
	ocamlfind ocamlc -package js_of_ocaml -syntax camlp4o -package js_of_ocaml.syntax -linkpkg -I $(LCODIR) -I $(INTERPRETERDIR) rmllib.cma  -g -c graph.cmo moving.ml
	ocamlfind ocamlc -package js_of_ocaml -syntax camlp4o -package js_of_ocaml.syntax -linkpkg -I $(LCODIR) -I $(INTERPRETERDIR) rmllib.cma  -o main.byte  graph.cmo moving.cmo main.ml
	js_of_ocaml --pretty --opt 1 --noinline main.byte

clean:
	rm *.cmo *.cmi *.rzi
