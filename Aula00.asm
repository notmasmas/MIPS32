.data

x: .word 5
y: .word 7

.text

# if x > y:
# y += 2
# else:
# x += 2

lw $t0, x #t0 <- x
lw $t1, y #t1 <- y

slt $at, $t1, $t0 # se y é menor ou igual a x = 0, senão = 1
# invertemos para lidar com x == y

beq $at, $zero, else # se at == 0, pular para else

addi $t1, $t1, 2 # y += 2
sw $t1, y # salva y

j fimse # se x > y, precisa pular a label else

else:
addi $t0, $t0, 2 # x += 2
sw $t0, x # salva x

fimse:


# beq (branch not equal)
# bne (branch not equal)
# bgt (branch greater than)
# bge (branch greater or equal than)
# blt (branch less than)
# ble (branch less or equal than)
# ori
