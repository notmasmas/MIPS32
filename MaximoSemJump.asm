.data

x: .word 5
y: .word 10
maximo: .word

.text

lw $t0, x # carrega palavra de x em $t0
lw $t1, y # carrega palavra de y em $t1

sub $t2, $t0, $t1 # $t2 <- x - y
srl $t3, $t2, 31 # $t3 <- 31 bits para a direita (fica só o bit de sinal)
mul $t4, $t2, $t3 # $t4 <- diferença * sinal

sub $t4, $t0, $t4 # $t4 <- x - (diferença * sinal)

sw $t4, maximo # salva valor de $t4 na variável maximo