.eqv ULT_POSICAO_VET 36 #nona palavra
.data
VET: .word 11, 21, 13, 44, 57, 0xA, 7, 0xB, 9, 0xC


.text
la $a0, VET #endereço do primeiro byte de VET[0]
li $t0, ULT_POSICAO_VET
move $t1, $zero

loop:
	bge $t1, $t0, fim #if $t1 >= $t0 goto fim
	addi $a0, $a0, 4 #soma o índice do vetor ao endereço
	lw $t3, 0($a0) #copia esse valor
	sll $t3, $t3, 1 #multiplica por 2
	sw $t3, 0($a0) #salva o dobro
	addi $t1, $t1, 4
	j loop
	
fim:
	