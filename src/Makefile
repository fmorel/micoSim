src=$(wildcard *.asm)
src_C=hello.c
dst=$(patsubst %.asm,%.ram,$(src))
dst+=$(patsubst %.c, %.ram, $(src_C))

ALL: $(dst)

#.PRECIOUS : %.elf

clean:
	rm -f $(dst) $(patsubst %.ram, %.elf, $(dst))

%.ram : %.elf
	./elf2ram.sh $<
	mv $@ ../

%.elf : %.asm
	lm32-elf-as $< -o $@

%.o : %.s
	lm32-elf-as $< -o $@

%.o : %.c
	lm32-elf-gcc  -mdivide-enabled -mbarrel-shift-enabled -mmultiply-enabled -nostartfiles -c $< -o $@

%.elf : %.o crt0.o utils.o
	lm32-elf-ld -nostdlib -nostartfiles -static -T linker.ld $+ -o $@
