SOURCES = $(wildcard sort.*)

.PHONY: all benchmark clean mrproper


all: sort_gcc sort_llvm sort_go


benchmark: all $(SOURCES)
	hyperfine --warmup=1 --style=color \
		./sort_gcc \
		./sort_llvm \
		./sort_go \
		./sort.py \
		./sort.rb


clean:
	rm -f *.o


mrproper: clean
	rm -f sort_gcc sort_llvm sort_go


sort_gcc: sort.c
	gcc -o $@ -lm $<

sort_llvm: sort.c
	clang -o $@ -lm $<

sort_go: sort.go
	go build -o $@ $<
