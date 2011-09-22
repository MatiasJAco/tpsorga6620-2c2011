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
	.ascii	"No se han especificado parametros, para ayuda ejecute el"
	.ascii	" programa ./tp0 \n\000"
	.align	2
$LC5:
	.ascii	"Version 1.00\n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,104,$ra		# vars= 56, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,104
	.cprestore 24
	sw	$ra,96($sp)
	sw	$fp,92($sp)
	sw	$gp,88($sp)
	move	$fp,$sp
	sw	$a0,104($fp)
	sw	$a1,108($fp)
	sw	$zero,32($fp)
	sw	$zero,36($fp)
	li	$v0,1			# 0x1
	sw	$v0,52($fp)
	li	$v0,1			# 0x1
	sw	$v0,56($fp)
	li	$v0,1			# 0x1
	sw	$v0,48($fp)
	li	$v0,1			# 0x1
	sw	$v0,44($fp)
	li	$v0,1			# 0x1
	sw	$v0,40($fp)
$L18:
	addu	$v0,$fp,36
	sw	$v0,16($sp)
	lw	$a0,104($fp)
	lw	$a1,108($fp)
	la	$a2,$LC3
	la	$a3,long_options.0
	la	$t9,getopt_long
	jal	$ra,$t9
	sw	$v0,60($fp)
	lw	$v1,60($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L20
	b	$L19
$L20:
	lw	$v0,60($fp)
	sw	$v0,84($fp)
	li	$v0,104			# 0x68
	lw	$v1,84($fp)
	beq	$v1,$v0,$L22
	lw	$v1,84($fp)
	slt	$v0,$v1,105
	beq	$v0,$zero,$L28
	li	$v0,63			# 0x3f
	lw	$v1,84($fp)
	beq	$v1,$v0,$L25
	li	$v0,86			# 0x56
	lw	$v1,84($fp)
	beq	$v1,$v0,$L23
	b	$L18
$L28:
	li	$v0,105			# 0x69
	lw	$v1,84($fp)
	beq	$v1,$v0,$L24
	b	$L18
$L22:
	sw	$zero,40($fp)
	b	$L18
$L23:
	sw	$zero,44($fp)
	b	$L18
$L24:
	sw	$zero,48($fp)
	b	$L18
$L25:
	li	$v0,1			# 0x1
	sw	$v0,80($fp)
	b	$L17
$L19:
	lw	$v1,104($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L29
	la	$a0,$LC4
	la	$t9,printf
	jal	$ra,$t9
	sw	$zero,80($fp)
	b	$L17
$L29:
	lw	$v0,44($fp)
	bne	$v0,$zero,$L30
	la	$a0,$LC5
	la	$t9,printf
	jal	$ra,$t9
	sw	$zero,80($fp)
	b	$L17
$L30:
	lw	$v0,40($fp)
	bne	$v0,$zero,$L31
	la	$t9,print_help
	jal	$ra,$t9
	sw	$zero,80($fp)
	b	$L17
$L31:
	lw	$v0,48($fp)
	bne	$v0,$zero,$L32
	sw	$zero,52($fp)
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
$L32:
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,72($fp)
	lw	$v0,32($fp)
	addu	$v0,$v0,2
	sw	$v0,76($fp)
	lw	$v1,104($fp)
	lw	$v0,72($fp)
	slt	$v0,$v0,$v1
	beq	$v0,$zero,$L33
	lw	$v0,72($fp)
	sll	$v1,$v0,2
	lw	$v0,108($fp)
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	sw	$v0,64($fp)
	lw	$v1,104($fp)
	lw	$v0,76($fp)
	slt	$v0,$v0,$v1
	beq	$v0,$zero,$L34
	lw	$v0,76($fp)
	sll	$v1,$v0,2
	lw	$v0,108($fp)
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	sw	$v0,68($fp)
	b	$L35
$L34:
	sw	$zero,56($fp)
$L35:
	lw	$a0,64($fp)
	lw	$a1,68($fp)
	lw	$a2,52($fp)
	lw	$a3,56($fp)
	la	$t9,funcionJoin
	jal	$ra,$t9
$L33:
	sw	$zero,80($fp)
$L17:
	lw	$v0,80($fp)
	move	$sp,$fp
	lw	$ra,96($sp)
	lw	$fp,92($sp)
	addu	$sp,$sp,104
	j	$ra
	.end	main
	.size	main, .-main
	.rdata
	.align	2
$LC6:
	.ascii	" \000"
	.align	2
$LC7:
	.ascii	"\000\000"
	.text
	.align	2
	.globl	checkRepetition
	.ent	checkRepetition
checkRepetition:
	.frame	$fp,288,$ra		# vars= 248, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,288
	.cprestore 16
	sw	$ra,280($sp)
	sw	$fp,276($sp)
	sw	$gp,272($sp)
	move	$fp,$sp
	sw	$a0,288($fp)
	sw	$a1,292($fp)
	sw	$a2,296($fp)
	sw	$a3,300($fp)
	sw	$zero,24($fp)
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
$L37:
	addu	$v0,$fp,32
	move	$a0,$v0
	li	$a1,100			# 0x64
	lw	$a2,288($fp)
	la	$t9,fgets
	jal	$ra,$t9
	beq	$v0,$zero,$L38
	lw	$v1,28($fp)
	li	$v0,1			# 0x1
	beq	$v1,$v0,$L39
	b	$L38
$L39:
	addu	$v0,$fp,32
	move	$a0,$v0
	la	$a1,$LC6
	la	$t9,strtok
	jal	$ra,$t9
	sw	$v0,264($fp)
	addu	$v0,$fp,240
	move	$a0,$v0
	lw	$a1,264($fp)
	la	$t9,strcpy
	jal	$ra,$t9
	move	$a0,$zero
	la	$a1,$LC7
	la	$t9,strtok
	jal	$ra,$t9
	sw	$v0,264($fp)
	addu	$v0,$fp,136
	move	$a0,$v0
	lw	$a1,264($fp)
	la	$t9,strcpy
	jal	$ra,$t9
	addu	$v0,$fp,136
	move	$a0,$v0
	la	$t9,limpiar
	jal	$ra,$t9
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,292($fp)
	addu	$v0,$v1,$v0
	addu	$v1,$fp,240
	lw	$a0,0($v0)
	move	$a1,$v1
	la	$t9,strcpy
	jal	$ra,$t9
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,296($fp)
	addu	$v0,$v1,$v0
	addu	$v1,$fp,136
	lw	$a0,0($v0)
	move	$a1,$v1
	la	$t9,strcpy
	jal	$ra,$t9
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	sw	$zero,268($fp)
	sw	$zero,268($fp)
$L41:
	lw	$v0,24($fp)
	addu	$v1,$v0,-1
	lw	$v0,268($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L44
	b	$L37
$L44:
	lw	$v0,268($fp)
	sll	$v1,$v0,2
	lw	$v0,292($fp)
	addu	$v0,$v1,$v0
	addu	$v1,$fp,240
	lw	$a0,0($v0)
	move	$a1,$v1
	lw	$a2,300($fp)
	la	$t9,comparaClaves
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L43
	b	$L37
$L43:
	lw	$v0,268($fp)
	addu	$v0,$v0,1
	sw	$v0,268($fp)
	b	$L41
$L38:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,280($sp)
	lw	$fp,276($sp)
	addu	$sp,$sp,288
	j	$ra
	.end	checkRepetition
	.size	checkRepetition, .-checkRepetition
	.rdata
	.align	2
$LC8:
	.ascii	"\n"
	.ascii	"Usage: join [OPTION]... FILE1 FILE2\n\000"
	.align	2
$LC9:
	.ascii	"For each pair of input lines with identical join fields,"
	.ascii	" write a line to\n\000"
	.align	2
$LC10:
	.ascii	"standard output. The default join field is the first, de"
	.ascii	"limited\n\000"
	.align	2
$LC11:
	.ascii	"by whitespace. When FILE1 or FILE2 (not both) is -, read"
	.ascii	" standard input.\n\000"
	.align	2
$LC12:
	.ascii	"  -i, --ignore-case  ignore differences in case when com"
	.ascii	"paring fields\n\000"
	.align	2
$LC13:
	.ascii	"  -h, --help         display this help and exit\n\000"
	.align	2
$LC14:
	.ascii	"  -v, --version      output version information and exit"
	.ascii	"\n\000"
	.align	2
$LC15:
	.ascii	"Important: FILE1 and FILE2 must be sorted on the join fi"
	.ascii	"elds.\n\000"
	.align	2
$LC16:
	.ascii	"E.g., use \342\200\230sort -k 1b,1\342\200\231 if \342\200"
	.ascii	"\230join\342\200\231 has no options.\n\000"
	.align	2
$LC17:
	.ascii	"Note, comparisons honor the rules specified by \342\200\230"
	.ascii	"LC_COLLATE\342\200\231.\n\000"
	.align	2
$LC18:
	.ascii	"If the input is not sorted and some lines cannot be join"
	.ascii	"ed, a\n\000"
	.align	2
$LC19:
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
	la	$a0,$LC17
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC18
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC19
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
	beq	$v0,$zero,$L47
	lw	$v0,24($fp)
	sb	$zero,0($v0)
$L47:
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	limpiar
	.size	limpiar, .-limpiar
	.align	2
	.globl	buscarRepetida
	.ent	buscarRepetida
buscarRepetida:
	.frame	$fp,184,$ra		# vars= 144, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,184
	.cprestore 16
	sw	$ra,176($sp)
	sw	$fp,172($sp)
	sw	$gp,168($sp)
	move	$fp,$sp
	sw	$a0,184($fp)
	sw	$a1,188($fp)
	sw	$a2,192($fp)
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	sw	$zero,164($fp)
	addu	$v0,$fp,32
	move	$a0,$v0
	li	$a1,100			# 0x64
	lw	$a2,188($fp)
	la	$t9,fgets
	jal	$ra,$t9
$L50:
	lw	$v0,164($fp)
	slt	$v0,$v0,2
	beq	$v0,$zero,$L51
	lw	$v0,188($fp)
	lhu	$v0,12($v0)
	srl	$v0,$v0,5
	xori	$v0,$v0,0x1
	andi	$v0,$v0,0x1
	bne	$v0,$zero,$L52
	b	$L51
$L52:
	addu	$v0,$fp,32
	move	$a0,$v0
	la	$a1,$LC6
	la	$t9,strtok
	jal	$ra,$t9
	sw	$v0,160($fp)
	addu	$v0,$fp,136
	move	$a0,$v0
	lw	$a1,160($fp)
	la	$t9,strcpy
	jal	$ra,$t9
	addu	$v0,$fp,136
	move	$a0,$v0
	lw	$a1,184($fp)
	lw	$a2,192($fp)
	la	$t9,comparaClaves
	jal	$ra,$t9
	bne	$v0,$zero,$L54
	lw	$v0,164($fp)
	addu	$v0,$v0,1
	sw	$v0,164($fp)
$L54:
	addu	$v0,$fp,32
	move	$a0,$v0
	li	$a1,100			# 0x64
	lw	$a2,188($fp)
	la	$t9,fgets
	jal	$ra,$t9
	b	$L50
$L51:
	lw	$v0,164($fp)
	slt	$v0,$v0,2
	bne	$v0,$zero,$L55
	sw	$zero,24($fp)
$L55:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,176($sp)
	lw	$fp,172($sp)
	addu	$sp,$sp,184
	j	$ra
	.end	buscarRepetida
	.size	buscarRepetida, .-buscarRepetida
	.rdata
	.align	2
$LC20:
	.ascii	"r\000"
	.align	2
$LC21:
	.ascii	"\000"
	.space	19
	.align	2
$LC22:
	.ascii	"Error al abrir %s \n\000"
	.align	2
$LC23:
	.ascii	"%s %s %s \n\000"
	.align	2
$LC24:
	.ascii	"Clave repetida en el archivo2. \n\000"
	.align	2
$LC25:
	.ascii	"El archivo 1 est\303\241 desordenado. \n\000"
	.align	2
$LC26:
	.ascii	"El archivo 2 est\303\241 desordenado. \n\000"
	.align	2
$LC27:
	.ascii	"No se encontro la clave en el segundo archivo \n\000"
	.text
	.align	2
	.globl	funcionJoin
	.ent	funcionJoin
funcionJoin:
	.frame	$fp,1144,$ra		# vars= 1104, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,1144
	.cprestore 16
	sw	$ra,1140($sp)
	sw	$fp,1136($sp)
	sw	$gp,1132($sp)
	sw	$s0,1128($sp)
	move	$fp,$sp
	sw	$a0,1144($fp)
	sw	$a1,1148($fp)
	sw	$a2,1152($fp)
	sw	$a3,1156($fp)
	lw	$a0,1144($fp)
	la	$a1,$LC20
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,1156($fp)
	bne	$v0,$zero,$L57
	la	$v0,__sF
	sw	$v0,28($fp)
	b	$L58
$L57:
	lw	$a0,1148($fp)
	la	$a1,$LC20
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,28($fp)
$L58:
	sw	$zero,432($fp)
	sw	$zero,432($fp)
$L59:
	lw	$v0,432($fp)
	slt	$v0,$v0,100
	bne	$v0,$zero,$L62
	b	$L60
$L62:
	lw	$v0,432($fp)
	sll	$v1,$v0,2
	addu	$v0,$fp,24
	addu	$v0,$v1,$v0
	addu	$s0,$v0,8
	li	$a0,21			# 0x15
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,0($s0)
	lw	$v0,432($fp)
	addu	$v0,$v0,1
	sw	$v0,432($fp)
	b	$L59
$L60:
	sw	$zero,432($fp)
$L63:
	lw	$v0,432($fp)
	slt	$v0,$v0,100
	bne	$v0,$zero,$L66
	b	$L64
$L66:
	lw	$v0,432($fp)
	sll	$v1,$v0,2
	addu	$v0,$fp,24
	addu	$v0,$v1,$v0
	addu	$s0,$v0,416
	li	$a0,101			# 0x65
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,0($s0)
	lw	$v0,432($fp)
	addu	$v0,$v0,1
	sw	$v0,432($fp)
	b	$L63
$L64:
	li	$v0,1			# 0x1
	sw	$v0,1072($fp)
	li	$v0,1			# 0x1
	sw	$v0,1076($fp)
	li	$v0,1			# 0x1
	sw	$v0,1080($fp)
	sw	$zero,1084($fp)
	li	$v0,1			# 0x1
	sw	$v0,1088($fp)
	li	$v0,1			# 0x1
	sw	$v0,1092($fp)
	lbu	$v0,$LC21
	sb	$v0,1096($fp)
	addu	$v0,$fp,1097
	li	$v1,19			# 0x13
	move	$a0,$v0
	move	$a1,$zero
	move	$a2,$v1
	la	$t9,memset
	jal	$ra,$t9
	lw	$v0,24($fp)
	bne	$v0,$zero,$L67
	la	$a0,__sF+176
	la	$a1,$LC22
	lw	$a2,1144($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,1084($fp)
$L67:
	lw	$v0,28($fp)
	bne	$v0,$zero,$L68
	la	$a0,__sF+176
	la	$a1,$LC22
	lw	$a2,1148($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,1084($fp)
$L68:
	sw	$zero,1124($fp)
	lw	$v0,1084($fp)
	bne	$v0,$zero,$L56
	addu	$v0,$fp,32
	addu	$v1,$fp,440
	lw	$a0,28($fp)
	move	$a1,$v0
	move	$a2,$v1
	lw	$a3,1152($fp)
	la	$t9,checkRepetition
	jal	$ra,$t9
	sw	$v0,1076($fp)
	lw	$v0,1076($fp)
	bne	$v0,$zero,$L70
	sw	$zero,1080($fp)
$L70:
	addu	$v0,$fp,968
	move	$a0,$v0
	li	$a1,100			# 0x64
	lw	$a2,24($fp)
	la	$t9,fgets
	jal	$ra,$t9
	addu	$v0,$fp,968
	move	$a0,$v0
	la	$a1,$LC6
	la	$t9,strtok
	jal	$ra,$t9
	sw	$v0,1120($fp)
	addu	$v0,$fp,840
	move	$a0,$v0
	lw	$a1,1120($fp)
	la	$t9,strcpy
	jal	$ra,$t9
$L71:
	lw	$v0,24($fp)
	lhu	$v0,12($v0)
	srl	$v0,$v0,5
	xori	$v0,$v0,0x1
	andi	$v0,$v0,0x1
	beq	$v0,$zero,$L72
	lw	$v1,1080($fp)
	li	$v0,1			# 0x1
	beq	$v1,$v0,$L73
	b	$L72
$L73:
	move	$a0,$zero
	la	$a1,$LC7
	la	$t9,strtok
	jal	$ra,$t9
	sw	$v0,1120($fp)
	addu	$v0,$fp,864
	move	$a0,$v0
	lw	$a1,1120($fp)
	la	$t9,strcpy
	jal	$ra,$t9
	addu	$v0,$fp,864
	move	$a0,$v0
	la	$t9,limpiar
	jal	$ra,$t9
	addu	$a0,$fp,840
	lw	$v0,1124($fp)
	sll	$v1,$v0,2
	addu	$v0,$fp,24
	addu	$v0,$v1,$v0
	addu	$v0,$v0,8
	lw	$a1,0($v0)
	lw	$a2,1152($fp)
	la	$t9,comparaClaves
	jal	$ra,$t9
	bne	$v0,$zero,$L75
	sw	$zero,1072($fp)
	b	$L76
$L75:
	sw	$zero,1088($fp)
$L76:
	addu	$v0,$fp,840
	addu	$v1,$fp,1096
	move	$a0,$v0
	move	$a1,$v1
	lw	$a2,1152($fp)
	la	$t9,comparaClavesConsec
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L77
	sw	$zero,1092($fp)
$L77:
	addu	$v0,$fp,1096
	addu	$v1,$fp,840
	move	$a0,$v0
	move	$a1,$v1
	la	$t9,strcpy
	jal	$ra,$t9
	lw	$v0,1072($fp)
	bne	$v0,$zero,$L78
	lw	$v1,1076($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L78
	lw	$v1,1092($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L78
	addu	$a1,$fp,840
	addu	$a2,$fp,864
	lw	$v0,1124($fp)
	sll	$v1,$v0,2
	addu	$v0,$fp,24
	addu	$v0,$v1,$v0
	addu	$v0,$v0,416
	la	$a0,$LC23
	lw	$a3,0($v0)
	la	$t9,printf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,1072($fp)
	lw	$v0,1124($fp)
	addu	$v0,$v0,1
	sw	$v0,1124($fp)
	addu	$v0,$fp,968
	move	$a0,$v0
	li	$a1,100			# 0x64
	lw	$a2,24($fp)
	la	$t9,fgets
	jal	$ra,$t9
	addu	$v0,$fp,968
	move	$a0,$v0
	la	$a1,$LC6
	la	$t9,strtok
	jal	$ra,$t9
	sw	$v0,1120($fp)
	addu	$v0,$fp,840
	move	$a0,$v0
	lw	$a1,1120($fp)
	la	$t9,strcpy
	jal	$ra,$t9
	b	$L71
$L78:
	sw	$zero,1080($fp)
	b	$L71
$L72:
	lw	$v0,1080($fp)
	bne	$v0,$zero,$L80
	lw	$v0,1076($fp)
	bne	$v0,$zero,$L81
	la	$a0,__sF+176
	la	$a1,$LC24
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L80
$L81:
	lw	$v0,1092($fp)
	bne	$v0,$zero,$L83
	la	$a0,__sF+176
	la	$a1,$LC25
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L80
$L83:
	lw	$v0,1088($fp)
	bne	$v0,$zero,$L85
	la	$a0,__sF+176
	la	$a1,$LC26
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L80
$L85:
	la	$a0,__sF+176
	la	$a1,$LC27
	la	$t9,fprintf
	jal	$ra,$t9
$L80:
	lw	$a0,24($fp)
	la	$t9,fclose
	jal	$ra,$t9
	lw	$v1,1156($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L87
	lw	$a0,28($fp)
	la	$t9,fclose
	jal	$ra,$t9
$L87:
	sw	$zero,432($fp)
$L88:
	lw	$v0,432($fp)
	slt	$v0,$v0,100
	bne	$v0,$zero,$L91
	b	$L56
$L91:
	lw	$v0,432($fp)
	sll	$v1,$v0,2
	addu	$v0,$fp,24
	addu	$v0,$v1,$v0
	addu	$v0,$v0,8
	lw	$a0,0($v0)
	la	$t9,free
	jal	$ra,$t9
	lw	$v0,432($fp)
	sll	$v1,$v0,2
	addu	$v0,$fp,24
	addu	$v0,$v1,$v0
	addu	$v0,$v0,416
	lw	$a0,0($v0)
	la	$t9,free
	jal	$ra,$t9
	lw	$v0,432($fp)
	addu	$v0,$v0,1
	sw	$v0,432($fp)
	b	$L88
$L56:
	move	$sp,$fp
	lw	$ra,1140($sp)
	lw	$fp,1136($sp)
	lw	$s0,1128($sp)
	addu	$sp,$sp,1144
	j	$ra
	.end	funcionJoin
	.size	funcionJoin, .-funcionJoin
	.align	2
	.globl	comparaClaves
	.ent	comparaClaves
comparaClaves:
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
	sw	$a1,52($fp)
	sw	$a2,56($fp)
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	lw	$a0,48($fp)
	lw	$a1,52($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L93
	sw	$zero,24($fp)
$L93:
	lw	$v0,56($fp)
	bne	$v0,$zero,$L94
	lw	$a0,48($fp)
	lw	$a1,52($fp)
	la	$t9,strcasecmp
	jal	$ra,$t9
	bne	$v0,$zero,$L94
	sw	$zero,24($fp)
$L94:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	comparaClaves
	.size	comparaClaves, .-comparaClaves
	.align	2
	.globl	comparaClavesConsec
	.ent	comparaClavesConsec
comparaClavesConsec:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	sw	$a2,64($fp)
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	lw	$a0,56($fp)
	la	$t9,atoi
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$a0,60($fp)
	la	$t9,atoi
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	lw	$v1,28($fp)
	lw	$v0,32($fp)
	bne	$v1,$v0,$L97
	sw	$zero,24($fp)
$L97:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	comparaClavesConsec
	.size	comparaClavesConsec, .-comparaClavesConsec
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
