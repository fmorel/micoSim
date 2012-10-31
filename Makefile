src=$(wildcard *.asm)
src_C=$(wildcard *.c)
dst=$(patsubst %.asm,%.ram,$(src))
dst+=$(patsubst %.c, %.ram, $(src_C))

ALL: $(dst)

clean:
	rm -f $(dst)

%.ram : %.elf
	./elf2ram.sh $<

%.elf : %.asm
	lm32-elf-as $< -o $@

%.elf : %.c
	lm32-elf-gcc  -mdivide-enabled -mbarrel-shift-enabled -mmultiply-enabled -static -nostdlib -nostartfiles -t linker.ld $< crt0.o -o $@
