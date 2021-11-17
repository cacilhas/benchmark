SOURCES = $(wildcard sort.*)

.PHONY: all benchmark clean mrproper


all: sort_gcc sort_llvm sort_go sort_ocaml sort_nelua


benchmark: all $(SOURCES)
	hyperfine --warmup=1 --style=color \
		./sort_gcc \
		./sort_llvm \
		./sort_go \
		./sort_ocaml \
		./sort_nelua \
		./sort.py \
		./sort.rb \
		"lua ./sort.lua" \
		"luajit ./sort.lua" \
		./sort.moon


clean:
	rm -f *.cmi *.cmx *.o


mrproper: clean
	rm -f sort_gcc sort_llvm sort_go sort_ocaml


sort_gcc: sort.c
	gcc -o $@ -lm $<

sort_llvm: sort.c
	clang -o $@ -lm $<

sort_go: sort.go
	go build -o $@ $<

sort_ocaml: sort.ml
	ocamlopt -o $@ $<

sort_nelua: sort.nelua
	nelua -o $@ $<
