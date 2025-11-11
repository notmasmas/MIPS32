# faça um programa em assembly que coloque em maximo o valor entre x e y

.data
x: .word 5
y: .word 7
z: .word 0

.text

lw $t0, x
lw $t1, y

ble $t0, $t1, x_menor

y_menor:
sw $t0, z

j fimse

x_menor: 
sw $t1, z

fimse:
