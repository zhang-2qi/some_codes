.data 
Site:.word  0,0,0,0,0,0,0,0
result:.word  4
myzero:.word 0
prompt: .asciiz "Eight Queen problems,entering the number of queens:"
lala: .asciiz "lalal"
.text
main:
	add $a1, $zero, $zero #iconut in $a1
	add $t9, $zero,$zero
	la $t6, Site
	li $v0, 4
	la $a0, prompt
	syscall               #output prompt
	li $v0, 5
	syscall
	add $a0, $v0, $zero   #a0 parameter
	add $a2, $zero, $zero #0
	jal Queen
	li $v0, 1
	la $a0,($s0)
	syscall
	li $v0, 10
	syscall
Queen:
	addi $sp, $sp, -20
#	addi $t9, $t9, 1
	sw $ra, 16($sp)
#	sw $a0, 16($sp)	      #save n ,Queens
	sw $a1, 12($sp)	      #svae icount
	sw $a2, 8($sp)	      #save putnumber,n
	sw $t0, 4($sp)	      #save i before
	sw $s4, 0($sp)
	addi $t0, $zero, 1    #i in t0
 	bne $a2, $a0, L1
 	addi $a1, $a1, 1
 	add $s0, $a1, $zero   #return s0
 	lw $s4, 0($sp)
 	lw $t0, 4($sp)
#	li $v0,1
# 	la $a0, ($t0) 
# 	syscall
 	lw $a2, 8($sp)
 	lw $a1, 12($sp)
# 	lw $a0, 16($sp)
 	lw $ra, 16($sp)
 	addi $sp,$sp,20
 	jr $ra
 L1:
 	ble  $t0, $a0, Loop
 	add $s0, $a1, $zero   #return s0
 	lw $s4, 0($sp)
 	lw $t0, 4($sp)
 #	li $v0,1
# 	la $a0, ($t0) 
#	syscall
 	lw $a2, 8($sp)
 	lw $a1, 12($sp)
# 	lw $a0, 16($sp)
 	lw $ra, 16($sp)
 	addi $sp,$sp,20

 	jr $ra
Loop:

	sll $t1, $a2, 2
	add $t2, $t6, $t1
	sw  $t0, 0($t2)
	add $t3, $zero, $zero #return t3
	jal Valid
	bgt $t3, $zero, L2
	addi $t0, $t0, 1
	j L1
 L2:
 	add $s4, $a2, $zero
 	addi $a2, $a2, 1
 	
 	jal Queen
 	add $a2, $s4, $zero #recover a2,n
 	add $a1,$s0,$zero
  	addi $t0, $t0, 1
 	j L1
 Valid:
 	addi $sp,$sp,-4
 	sw $ra, 0($sp)
# 	sw $a2, 0($sp)
 	add $s5, $zero, $zero #i in Valid
 	j Loop2
Loop2:
 	beq $s5, $a2, L3
 	sll $s6, $s5, 2
 	sll $s7, $a2, 2
 	add $t7, $t6, $s6
 	add $t8, $t6, $s7
 	lw $k0, 0($t7)
 	lw $k1, 0($t8)
 	beq $k0, $k1, L4
 	sub $s6, $a2, $s5
 	sub $s7, $k0, $k1
 	beq $s6,$s7,L4
 	sub $s7, $k1, $k0
 	beq $s6, $s7, L4 
 	addi $s5, $s5, 1
 	j Loop2
 	
 L3:
 	addi $t3, $zero, 1
# 	lw $a2, 0($sp)
 	lw $ra, 0($sp)
 	addi $sp, $sp, 4	
 	jr $ra
 L4:
 	add $t3, $zero, $zero
 #	lw $a2, 0($sp)
 	lw $ra, 0($sp)
 	addi $sp, $sp, 4	
 	jr $ra

 		
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
	
	
	
