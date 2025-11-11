.data

numero: .word 8
ascii_par: .asciiz "Par"
ascii_impar: .asciiz "Ímpar"

.text

li $v0, 5 # pega input
syscall

add $t0, $v0, $zero # carrega numero em t0

andi $t1, $t0, 1 #salva t1 o valor do && de bit a bit com 1 (par ou impar)

beqz $t1, par # branch se for igual a 0 (par)

la $a0, ascii_impar

j print_programa 

par:

la $a0, ascii_par

print_programa:

li $v0, 4 # printar string
syscall
