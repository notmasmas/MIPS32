# 1) Faça um programa em assembly do MIPS32 que verifique 
# o valor das variáveis X, Y e Z e coloque em W o valor da maior delas

.data

x: .word 1
y: .word 2
z: .word 3

w: .word

.text

lw $t0, x
lw $t1, y
lw $t2, z

bge $t0, $t1, x_maior

move $t3, $t1

j continua

x_maior:

move $t3, $t0

continua:

bge $t3, $t2, primeiro_maior

sw $t2, w

j fim_programa

primeiro_maior:

sw $t3, w

fim_programa:

