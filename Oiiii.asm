.data
	palavra: .ascii "Oiii :3"

.text

	li $v0, 4
	la $a0, palavra
	
	syscall