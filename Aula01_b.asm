#programinha bem simples graças a deus
#programa que escreve os pares de 0 a n

.data

n: .word 10

.text

lw $t0, n # número max
li $t1, 0
li $t2, 2 # número a somar

programa:

bgt $t1, $t0, fim_programa # se número for maior que número max, termina

li $v0, 1 # função de print inteiro
move $a0, $t1 # move para $a0 o valor a ser printado
syscall # chama o sistema operacional para realizar a ação

add $t1, $t1, $t2 # soma 2 ao valor que foi printado (próximo par)

j programa

fim_programa: