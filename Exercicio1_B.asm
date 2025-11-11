.data

chave: .asciiz "REPUBLICAS" # String chave
preco: .asciiz "4567.01" # String preco
cifrada: .space 20 # Buffer para a string cifrada (espaço suficiente)

.text

# --- REGISTRADORES ---
# $t0 = endereço do primeiro caractere da chave (PONTEIRO)
# $t1 = endereço do primeiro caractere do preço (PONTEIRO)
# $t2 = endereço do primeiro caractere da palavra cifrada (PONTEIRO)
# $t3 = caractere do preço sendo analisado
# $t4 = caractere correspondente na chave
# $t5 = código do ponto '.' (46)
# $t6 = endereço temporário para índice dinâmico
#-----------------------

la $t0, chave #salva endereço do primeiro caractere da chave (PONTEIRO)
la $t1, preco #salva endereço do primeiro caractere do preço (PONTEIRO)
la $t2, cifrada #salva endereço do primeiro caractere da palavra cifrada (PONTEIRO)
li $t5, 46 #salva código do . em ASCII (46)

loop:

lb $t3 0($t1) #carrega primeiro byte (caractere) do preço 

beq $t3, $t5 ponto #se caractere for ponto
beqz $t3, fim #se byte for 0x00 (fim de String)

addi $t3, $t3, -48 #código ASCII do 0. Se subtrair dele pega o número real (49 (1) - 48 (0) --> 1)

addu $t6, $t0, $t3 #endereço base + quantidade de endereços para pular (offset dinâmico)
lb $t4 0($t6) #carrega o caractere correspondente ao número no índice

sb $t4 0($t2) #salva no primeiro byte do preço o caractere correspondente

j continua

ponto:

sb $t3 0($t2) #salva o valor do byte (.)

continua:

addi $t1, $t1, 1 #vai para o próximo endereço
addi $t2, $t2, 1 #vai para o próximo endereço

j loop

fim:

sb $zero 0($t2) #adiciona caractere 0x00 (fim de String)

#função de print
li $v0, 4
la $a0, cifrada
syscall
