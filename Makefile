SOURCES = $(wildcard sort.*)

.PHONY: all benchmark clean mrproper


all: sort_gcc sort_llvm sort_go sort_ocaml sort_nelua sort_moon.lua


benchmark: all $(SOURCES)
	hyperfine --ignore-failure --warmup=1 --style=color \
		./sort_gcc \
		./sort_llvm \
		./sort_go \
		./sort_ocaml \
		./sort_nelua \
		./sort.py \
		./sort.rb \
		"lua ./sort.lua" \
		"luajit ./sort.lua" \
		"lua ./sort_moon.lua" \
		"luajit ./sort_moon.lua"


clean:
	rm -f *.cmi *.cmx *.o


mrproper: clean
	rm -f sort_gcc sort_llvm sort_go sort_ocaml sort_nelua sort_moon.lua


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

sort_moon.lua: sort.moon
	moonc -o $@ $<
