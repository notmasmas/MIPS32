.data 

n: .word 5
f: .word

.text

#CÁLCULO DE FATORIAL

lw $t0, n #carrega n (5) em $t0
li $t1, 1 #carrega o valor 1 de imediato em $t1 (pseudoinstrução)
li $a0, 1 #carrega valor 1 em $at para evitar usar subi (atribuiria 1
# toda vez que o loop roda, ineficiente)

loop:
ble $t0, 1, fim_loop #se $t0 <= 1, pula para o fim do loop
mul $t1, $t1, $t0 #$t1 *= $t0
sub $t0, $t0, $a0 #$t0 -= 1

j loop #volta para o loop

fim_loop:

sw $t1, f #guarda o resultado na variável f