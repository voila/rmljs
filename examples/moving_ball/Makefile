RML_NOUNIX=$(HOME)/Work/rml-1.09.04-nounix
RMLC=$(RML_NOUNIX)/compiler/rmlc
INTERPRETERDIR=$(RML_NOUNIX)/interpreter
LCODIR=$(RML_NOUNIX)/interpreter/lco # `rmlc -where`
STDLIB=$(RML_NOUNIX)/stdlib


all:
	$(RMLC) -stdlib $(STDLIB) moving.rml   # => moving.ml
	ocamlfind ocamlc -package js_of_ocaml -package js_of_ocaml.graphics -syntax camlp4o -package js_of_ocaml.syntax -linkpkg -I $(LCODIR) -I $(INTERPRETERDIR) rmllib.cma  -g -c  moving.ml
	ocamlfind ocamlc -package js_of_ocaml -package js_of_ocaml.graphics -syntax camlp4o -package js_of_ocaml.syntax -linkpkg -I $(LCODIR) -I $(INTERPRETERDIR) rmllib.cma  -o main.byte  moving.cmo main.ml
	js_of_ocaml --pretty --opt 1 --noinline graphics.js main.byte

clean:
	rm *.cmo *.cmi *.rzi
