	.file	1 "tp0.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"version\000"
	.align	2
$LC1:
	.ascii	"help\000"
	.align	2
$LC2:
	.ascii	"ignore-case\000"
	.data
	.align	2
	.type	long_options.0, @object
	.size	long_options.0, 64
long_options.0:
	.word	$LC0
	.word	0
	.word	0
	.word	86
	.word	$LC1
	.word	0
	.word	0
	.word	104
	.word	$LC2
	.word	1
	.word	0
	.word	105
	.word	0
	.word	0
	.word	0
	.word	0
	.rdata
	.align	2
$LC3:
	.ascii	"hVi:\000"
	.align	2
$LC4:
	.ascii	"Version 1.00\n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,192,$ra		# vars= 144, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,192
	.cprestore 24
	sw	$ra,184($sp)
	sw	$fp,180($sp)
	sw	$gp,176($sp)
	move	$fp,$sp
	sw	$a0,192($fp)
	sw	$a1,196($fp)
	sw	$zero,32($fp)
	li	$v0,1			# 0x1
	sw	$v0,44($fp)
	li	$v0,1			# 0x1
	sw	$v0,40($fp)
	li	$v0,1			# 0x1
	sw	$v0,36($fp)
$L18:
	addu	$v0,$fp,32
	sw	$v0,16($sp)
	lw	$a0,192($fp)
	lw	$a1,196($fp)
	la	$a2,$LC3
	la	$a3,long_options.0
	la	$t9,getopt_long
	jal	$ra,$t9
	sw	$v0,48($fp)
	lw	$v1,48($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L20
	b	$L19
$L20:
	lw	$v0,48($fp)
	sw	$v0,172($fp)
	li	$v0,104			# 0x68
	lw	$v1,172($fp)
	beq	$v1,$v0,$L22
	lw	$v1,172($fp)
	slt	$v0,$v1,105
	beq	$v0,$zero,$L28
	li	$v0,63			# 0x3f
	lw	$v1,172($fp)
	beq	$v1,$v0,$L25
	li	$v0,86			# 0x56
	lw	$v1,172($fp)
	beq	$v1,$v0,$L23
	b	$L18
$L28:
	li	$v0,105			# 0x69
	lw	$v1,172($fp)
	beq	$v1,$v0,$L24
	b	$L18
$L22:
	sw	$zero,36($fp)
	b	$L18
$L23:
	sw	$zero,40($fp)
	b	$L18
$L24:
	sw	$zero,44($fp)
	b	$L18
$L25:
	li	$v0,1			# 0x1
	sw	$v0,168($fp)
	b	$L17
$L19:
	lw	$v0,40($fp)
	bne	$v0,$zero,$L29
	la	$a0,$LC4
	la	$t9,printf
	jal	$ra,$t9
	sw	$zero,168($fp)
	b	$L17
$L29:
	lw	$v0,36($fp)
	bne	$v0,$zero,$L30
	la	$t9,print_help
	jal	$ra,$t9
	sw	$zero,168($fp)
	b	$L17
$L30:
	lw	$v0,44($fp)
	bne	$v0,$zero,$L31
	sw	$zero,168($fp)
	b	$L17
$L31:
	lw	$v0,192($fp)
	slt	$v0,$v0,2
	bne	$v0,$zero,$L32
	lw	$v0,196($fp)
	addu	$v0,$v0,4
	lw	$v0,0($v0)
	sw	$v0,52($fp)
	lw	$v0,192($fp)
	slt	$v0,$v0,3
	bne	$v0,$zero,$L33
	lw	$v0,196($fp)
	addu	$v0,$v0,8
	lw	$v0,0($v0)
	sw	$v0,56($fp)
	b	$L34
$L33:
	addu	$v0,$fp,64
	move	$a0,$v0
	li	$a1,100			# 0x64
	la	$a2,__sF
	la	$t9,fgets
	jal	$ra,$t9
	addu	$v0,$fp,64
	move	$a0,$v0
	la	$t9,limpiar
	jal	$ra,$t9
	addu	$v0,$fp,64
	sw	$v0,56($fp)
$L34:
	lw	$a0,52($fp)
	lw	$a1,56($fp)
	la	$t9,funcionJoin
	jal	$ra,$t9
$L32:
	sw	$zero,168($fp)
$L17:
	lw	$v0,168($fp)
	move	$sp,$fp
	lw	$ra,184($sp)
	lw	$fp,180($sp)
	addu	$sp,$sp,192
	j	$ra
	.end	main
	.size	main, .-main
	.rdata
	.align	2
$LC5:
	.ascii	"\n"
	.ascii	"Usage: join [OPTION]... FILE1 FILE2\n\000"
	.align	2
$LC6:
	.ascii	"For each pair of input lines with identical join fields,"
	.ascii	" write a line to\n\000"
	.align	2
$LC7:
	.ascii	"standard output. The default join field is the first, de"
	.ascii	"limited\n\000"
	.align	2
$LC8:
	.ascii	"by whitespace. When FILE1 or FILE2 (not both) is -, read"
	.ascii	" standard input.\n\000"
	.align	2
$LC9:
	.ascii	"  -i, --ignore-case  ignore differences in case when com"
	.ascii	"paring fields\n\000"
	.align	2
$LC10:
	.ascii	"  -h, --help         display this help and exit\n\000"
	.align	2
$LC11:
	.ascii	"  -v, --version      output version information and exit"
	.ascii	"\n\000"
	.align	2
$LC12:
	.ascii	"Important: FILE1 and FILE2 must be sorted on the join fi"
	.ascii	"elds.\n\000"
	.align	2
$LC13:
	.ascii	"E.g., use \342\200\230sort -k 1b,1\342\200\231 if \342\200"
	.ascii	"\230join\342\200\231 has no options.\n\000"
	.align	2
$LC14:
	.ascii	"Note, comparisons honor the rules specified by \342\200\230"
	.ascii	"LC_COLLATE\342\200\231.\n\000"
	.align	2
$LC15:
	.ascii	"If the input is not sorted and some lines cannot be join"
	.ascii	"ed, a\n\000"
	.align	2
$LC16:
	.ascii	"warning message will be given.\n\n\000"
	.text
	.align	2
	.globl	print_help
	.ent	print_help
print_help:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	la	$a0,$LC5
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC6
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC7
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC8
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC9
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC10
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC11
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC12
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC13
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC14
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC15
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC16
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	print_help
	.size	print_help, .-print_help
	.align	2
	.globl	limpiar
	.ent	limpiar
limpiar:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	lw	$a0,48($fp)
	li	$a1,10			# 0xa
	la	$t9,strchr
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	beq	$v0,$zero,$L36
	lw	$v0,24($fp)
	sb	$zero,0($v0)
$L36:
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	limpiar
	.size	limpiar, .-limpiar
	.rdata
	.align	2
$LC17:
	.ascii	"r\000"
	.align	2
$LC18:
	.ascii	"Error al abrir %s \n\000"
	.align	2
$LC19:
	.ascii	"%c %s %s \n\000"
	.align	2
$LC20:
	.ascii	"No se encontro la clave en el segundo archivo \n\000"
	.text
	.align	2
	.globl	funcionJoin
	.ent	funcionJoin
funcionJoin:
	.frame	$fp,384,$ra		# vars= 344, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,384
	.cprestore 16
	sw	$ra,376($sp)
	sw	$fp,372($sp)
	sw	$gp,368($sp)
	move	$fp,$sp
	sw	$a0,384($fp)
	sw	$a1,388($fp)
	lw	$a0,384($fp)
	la	$a1,$LC17
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$a0,388($fp)
	la	$a1,$LC17
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,28($fp)
	li	$v0,1			# 0x1
	sw	$v0,352($fp)
	li	$v0,1			# 0x1
	sw	$v0,356($fp)
	sw	$zero,360($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L39
	la	$a0,__sF+176
	la	$a1,$LC18
	lw	$a2,384($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,360($fp)
$L39:
	lw	$v0,28($fp)
	bne	$v0,$zero,$L40
	la	$a0,__sF+176
	la	$a1,$LC18
	lw	$a2,388($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,360($fp)
$L40:
	lw	$v0,360($fp)
	bne	$v0,$zero,$L38
	lw	$a0,24($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sb	$v0,32($fp)
$L42:
	lw	$v0,24($fp)
	lhu	$v0,12($v0)
	srl	$v0,$v0,5
	xori	$v0,$v0,0x1
	andi	$v0,$v0,0x1
	beq	$v0,$zero,$L43
	lw	$v1,356($fp)
	li	$v0,1			# 0x1
	beq	$v1,$v0,$L44
	b	$L43
$L44:
	addu	$v0,$fp,144
	move	$a0,$v0
	li	$a1,100			# 0x64
	lw	$a2,24($fp)
	la	$t9,fgets
	jal	$ra,$t9
	addu	$v0,$fp,144
	move	$a0,$v0
	la	$t9,limpiar
	jal	$ra,$t9
$L46:
	lw	$v1,352($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L47
	lw	$v0,28($fp)
	lhu	$v0,12($v0)
	srl	$v0,$v0,5
	xori	$v0,$v0,0x1
	andi	$v0,$v0,0x1
	bne	$v0,$zero,$L48
	b	$L47
$L48:
	lw	$a0,28($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sb	$v0,33($fp)
	lb	$v1,32($fp)
	lb	$v0,33($fp)
	bne	$v1,$v0,$L50
	sw	$zero,352($fp)
	addu	$v0,$fp,248
	move	$a0,$v0
	li	$a1,100			# 0x64
	lw	$a2,28($fp)
	la	$t9,fgets
	jal	$ra,$t9
	addu	$v0,$fp,248
	move	$a0,$v0
	la	$t9,limpiar
	jal	$ra,$t9
	b	$L46
$L50:
	addu	$v0,$fp,40
	move	$a0,$v0
	li	$a1,100			# 0x64
	lw	$a2,28($fp)
	la	$t9,fgets
	jal	$ra,$t9
	b	$L46
$L47:
	lw	$v0,352($fp)
	bne	$v0,$zero,$L52
	lb	$v0,32($fp)
	addu	$v1,$fp,144
	addu	$a3,$fp,248
	la	$a0,$LC19
	move	$a1,$v0
	move	$a2,$v1
	la	$t9,printf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,352($fp)
	lw	$a0,24($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sb	$v0,32($fp)
	lw	$a0,28($fp)
	la	$t9,rewind
	jal	$ra,$t9
	b	$L42
$L52:
	sw	$zero,356($fp)
	b	$L42
$L43:
	lw	$v0,356($fp)
	bne	$v0,$zero,$L54
	la	$a0,__sF+176
	la	$a1,$LC20
	la	$t9,fprintf
	jal	$ra,$t9
$L54:
	lw	$a0,24($fp)
	la	$t9,fclose
	jal	$ra,$t9
	lw	$a0,28($fp)
	la	$t9,fclose
	jal	$ra,$t9
$L38:
	move	$sp,$fp
	lw	$ra,376($sp)
	lw	$fp,372($sp)
	addu	$sp,$sp,384
	j	$ra
	.end	funcionJoin
	.size	funcionJoin, .-funcionJoin
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
