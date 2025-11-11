.data

msg: .asciiz "Tudo saiu como planejado."
cifra: .word 0x77 #Valor em HEX
msg_criptografada: .space 100

.text

#--- REGISTRADORES ---
# $t0 - endereço do primeiro caractere da String (PONTEIRO)
# $t1 - valor da cifra
# $t2 - endereço do primeiro caractere da String destino (PONTEIRO)
# $t3 - primeiro byte da String
# $t4 - valor do XOR entre o byte e a cifra
#---------------------

la $t0, msg #salva o endereço do primeiro byte da String origem (PONTEIRO)
lw $t1, cifra
la $t2, msg_criptografada #salva o endereço do primeiro byte da String destino (PONTEIRO)

loop:

lb $t3, 0($t0) #carrega o byte 0 (primeiro caractere) da palavra

beqz $t3, fim_string #se o byte for 0x00 (fim de String, pula p/ final)

xor $t4, $t3, $t1 #XOR entre esse byte (caractere) e 0b01110111

#guarda o byte de $t3 no 1o endereço da msg_criptografada
sb $t4, 0($t2)

addi $t0, $t0, 1 #vai para o próximo endereço = byte = caractere
addi $t2, $t2, 1 #vai para o próximo endereço = byte = caractere

j loop #volta para o começo do loop

fim_string:

sb $zero, 0($t2) #adiciona byte 0x00 (end of String)

#função de print
li $v0, 4
la $a0, msg_criptografada
syscall

