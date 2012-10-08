#!/bin/sh
SRC=$1
DST=${SRC/.elf/.ram}

lm32-elf-objdump -d $SRC >| tmp
echo 'v2.0 raw' >| $DST
awk 'BEGIN {start=0}
	 /<.text>/ {start=1; next}
	 {if (start) printf("%2s%2s%2s%2s\n", $2, $3, $4, $5)}' <tmp >>$DST
rm tmp


