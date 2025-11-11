.data

primo_ascii: .asciiz "É primo!"
naoprimo_ascii: .asciiz "Não é primo!"

.text

#--- REGISTRADORES ---
# $t0 = número pego no input
# $t1 = metade do número ($t0 com shift de 1 bit para a direita)
# $t2 = divisor atual
# $t3 = resto da divisão
#---------------------

#função de input
li $v0, 5
syscall

move $t0, $v0 #movendo para outro registrador

sra $t1, $t0, 1 #metade do número (shift de bit para a direita)
li $t2, 2 #número inicial

#casos base
beq $t0, 2, primo #n = 2 / primo
beq $t0, 1, nao_primo #n = 1 / não é primo
ble $t0, 0, nao_primo #n <= 0 / não é primo

loop:

bgt $t2, $t1, primo #se chegarmos na metade do número, é primo (ideal seria raiz quadrada)

div $t0, $t2 #número/divisor atual
mfhi $t3 #pega o resto da divisão
beqz $t3, nao_primo #se resto da divisão == 0, não é primo

addi $t2, $t2, 1 #divisor++

j loop

nao_primo:

la $a0, naoprimo_ascii
j fim #pula as instruções de número primo

primo:

la $a0, primo_ascii

fim:

#função de print
li $v0, 4
syscall