\.data

# Guarde os valores em HEX, MIPS32 não reconhece prefixo 0b para bin

resultado: .word 0x2284A922 #resultado oficial dos jogos
cartao: .word 0x1F91A937 #cartão feito pela pessoa
total: .word #armazenaremos o total de acertos aqui depois

.text

# --- REGISTRADORES UTILIZADOS ---
# $t0 = resultado
# $t1 = cartao
# $t2 = and bit a bit de resultado e cartao (acertos no cartão todo)
# $t3 = and bit a bit de acertos com 0b111 (acertos por jogo)
# $t4 = total de acertos

lw $t0, resultado
lw $t1, cartao
li $t4, 0

and $t2, $t0, $t1 #and bit a bit do cartão e do resultado
# exemplo:
# cartão: 0111 / resultado: 0101
# and: 0101 = 2 acertos

loop:

and $t3, $t2, 0x7 #and bit a bit com os primeiros 3 bits (1 jogo)

bgt $t3, 0, tem_acertos #se for maior que 0, existem acertos nesse jogo

j sem_acertos #pula o código que adiciona ao número de acertos

tem_acertos:

addi $t4, $t4, 1 # total++ / total += 1

sem_acertos:

# desloca 3 bits à direita ("exclui" o jogo que estava sendo analizado,
# vai para o próximo)
sra $t2, $t2, 3

bgt $t2, 0, loop #se for maior que 0 (ainda existem acertos no cartão)

sw $t4, total #salva o total

# função de print
move $a0, $t4
li $v0, 1
syscall
