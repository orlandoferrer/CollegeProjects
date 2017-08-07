#	Matrix Multiplication in MIPS

#*****************    	ICOM 4036   	 	*****************#
#*****************	Sec. 156   	 	*****************#
#***************** Orlando Ferrer #802-01-2321  *****************#
#***************** Rafael Vega #802-01-8317	*****************#


	.data
mat1:	.word	8,3,6,2,12,3,5,7,8		#variable initializations
mat2:	.word	15,2,6,6,7,3,4,5,2
res:	.word 	0,0,0,0
temp:	.word	0
h:	.word 	1
i:	.word	0
size:	.word	3
off1:	.word	0
off2:	.word 	0
string:	.asciiz	"Resulting array: "
space: .asciiz " "	



	.globl main
	.text

main:	
	la $a0, res			#load addresses into registers
	la $a1, mat1
	la $a2, mat2
	lw $t0, 0($a0)	#res[] @ $t0	#load words into registers
	lw $t1, 0($a1)	#mat1[] @ t1
	lw $t2, 0($a2)	#mat2[] @ $t2
	la $a3, temp	#load address of temp @ $a3
	lw $t3, 0($a3)	#temp  @t3
	lw $t4, 4($a3)	#h @ $t4
	lw $t5, 8($a3)	#i @ $t5
	lw $t6, 12($a3)	#size @ $t6
	lw $t7, 16($a3)	#off1 @ $t7
	lw $t8, 20($a3)	#off2 @ $t8

	mul $t9, $t6, $t6	#$t9= size*size


outfor:
	bgt $t4, $t9, endoutfor		#jump out of outer for when h> size*size
	mul $t3, $t3, 0			#temp=0
	mul $t5, $t5,0			#i=0

infor:	bge $t5, $t6, endinfor	#out of inner for when i>= size
	add $s0, $t5, $t7	#$s0 = i + off1
	mul $s0, $s0, 4		#(i+off1) *4 is the offset
	la $s1, mat1
	add $s2, $s1, $s0	#$s2 = mat1[0] + offset
	lw $s2, 0($s2)		#mat1[i+off1]

	mul $s4, $t5, $t6	#$s4 = i*size
	add $s4, $s4, $t8	#$s4 = (i*size) + off2
	mul $s4, $s4, 4		#$s4 = $s4 * 4  :real offset
	la $s1, mat2
	add $s5, $s1, $s4	#$s5 = mat2[0] + offset
	lw $s5, 0($s5)		#$s5 = mat2[off2+i * size]

	mul $s3, $s2, $s5	#mat1[1+off] * mat2[off+i*size]
	add $t3, $t3, $s3	#temp = temp+$s3
	addi $t5, $t5, 1	#i = i+1
	j infor

endinfor:
	addi $t8, $t8, 1	#off2=off2+1
	li $s1, 1
	sub $s6, $t4, $s1	#s6=h-1
	mul $s6, $s6, 4
	sw $t3, res($s6)	#res[h-1] = temp
 

if:	bne $t8, $t6, endif	#jump out if off2 !=size
	add $t7, $t7, $t6	#off1+=size;
	mul $t8, $t8, 0
	j if

endif:
	addi $t4, $t4, 1	#h = h+1
	j outfor

endoutfor:

	

	mul $t5, $t5, 0	#reset i=0 as counter
	la $a0, string  #Print the result
	li $v0, 4	#load code for print string
	syscall
	



printfor: bgt $t5, $s4, endprintfor	#iterate though the resulting array and print
	lw $a0, res($t5)
	li $v0, 1	#load code for print_int
	syscall
	la $a0, space 	#print " " to separate elements
	li $v0, 4	#load code to print string
	syscall		#print string
	addi $t5, $t5, 4	#i = i+1
	j printfor

endprintfor:
	  



