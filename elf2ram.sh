#!/bin/sh
SRC=$1
DST=${SRC/.elf/.ram}

lm32-elf-objdump -d $SRC >| tmp
echo 'v2.0 raw' >| $DST
gawk 'BEGIN {prev=0}
	 $1 ~ /\<[0-9a-f]+:/ {
		 split($1, buf, ":");
		 addr="Ox"buf[1];
		 add=strtonum(addr);
		 while (add > (prev + 4))
			 printf("0\n");
		 printf("%2s%2s%2s%2s\n", $2, $3, $4, $5)}' <tmp >>$DST
#rm tmp
