.text
.globl main

main:
la $s0,Arr            #Adresa e arrays ne s0
li $s1,0              #Vlera e iter qe eshte 0 ruhet ne s1
li $s2,5              #Vlera e num qe eshte 5 ruhet ne s2
li $s3,0              #Vlera e shifres maksimale ruet ne s3
li $s4,-1             #Indeksi ruhet ne s4

loop:
sll $t0,$s1,2            #Ne t0 iter shumezohet me 4
add $t0,$t0,$s0          #Ne t0 iter shumezohet me 4 dhe i shtohet adresa nga array
lw $t1, 0($t0)           #t1 eshte e barabarte me arr[i]
slt $t2,$t1,$s3          #nese t1 eshte me i vogel se vlera max atehere t2 merr vleren 1 ne te kunderten 0 
bne $t2,$zero,shto       #nese t2 eshte 1 atehere s3 ka vleren max kshtu qe shko ne "shto"
ori $s3,$t1,0            #ndrysho vleren maksimale
ori $s4,$s1,0            #ndrysho indeksin e vleres maksimale
shto: 
addi $s1,$s1,1           #iter + 1
bne $s1,$s2,loop         #nese vlera e iter nuk eshte e barabart me 5 shko ne loop
loop_exit:

li $v0,4
la $a0,Message1          #Mesazhi te paraqitet ne Console
syscall

li $v0,1
move $a0,$s3             #Vendosim vleren maksimale nga s3 ne a0
syscall
sw $s3,Max1              #E therrasim ne Console vleren max me masazhin
	 
li $v0, 10
syscall

.data
Arr: .word 10, 324, 45, 90, 9808
Message1:      .asciiz "Largest in given array is "
Max1:         .word 0