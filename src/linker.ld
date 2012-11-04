SECTIONS {	
	.text : {
		crt0.o (.boot)
		*(.text)
	}
	.data : { *(.data) } 
	.bss :  { *(.bss)  *(COMMON) } 
}
