.data

VET: .word 2, 1

.text

la $t0, VET #endereço base do vetor
move $t1, $zero #registrador temporário

lw $t2, 0($t0) #primeiro valor do vetor (2)
lw $t3, 4($t0) #segundo valor do vetor (1)

bge $t2, $t3, eh_maior #se primeiro valor >= segundo valor

j fim

eh_maior:
move $t1, $t2
move $t2, $t3
move $t3, $t1

fim:

sw $t2, 0($t0)
sw $t3, 4($t0)