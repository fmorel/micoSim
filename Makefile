src=$(wildcard *.asm)
src_C=$(wildcard *.c)
dst=$(patsubst %.asm,%.ram,$(src))
dst+=$(patsubst %.c, %.ram, $(src_C))

ALL: $(dst)

.PRECIOUS : %.elf

clean:
	rm -f $(dst) $(patsubst %.ram, %.elf, $(dst))

%.ram : %.elf
	./elf2ram.sh $<

%.elf : %.asm
	lm32-elf-as $< -o $@

%.o : %.s
	lm32-elf-as $< -o $@

%.o : %.c
		lm32-elf-gcc  -mdivide-enabled -mbarrel-shift-enabled -mmultiply-enabled -static -nostdlib -nostartfiles -c $< -o $@

%.elf : %.o crt0.o
	lm32-elf-ld -nostdlib -nostartfiles -T linker.ld $+ -o $@
