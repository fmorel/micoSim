src=$(wildcard *.asm)
dst=$(patsubst %.asm,%.ram,$(src))

ALL: $(dst)

clean:
	rm -f $(dst)

%.ram :  %.elf
	./elf2ram.sh $<

%.elf : %.asm
	lm32-elf-as $< -o $@

