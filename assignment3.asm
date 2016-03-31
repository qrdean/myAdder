#Quinton Dean
#Dr. McGuire
#COSC 3327 Computer Architecture
#this program is adding the 2 biggest integers out of a 3 integer input

    .data
        prompt:    .asciiz    "Enter an integer.\n"
        
    .text    
        			   #value1
        li    $v0, 4               #Output for string
        la    $a0, prompt      	   #Load
        syscall                    #int21
        
        li      $v0, 5             #load integer input
        syscall                    #int21
        move  $s1, $v0             #move contents of v0 into s1
	
				   #value2			   
        li    $v0, 4		
        la    $a0, prompt
        syscall
                
        li    $v0, 5
        syscall
        move $s2, $v0
        
        			  #value3
        li    $v0, 4
        la    $a0, prompt
        syscall
        
        li    $v0, 5
        syscall
        move $s3, $v0
	
				 #start main function	
        bge $s1, $s2, CMP1       #IF s1 >= s2 we move to CMP1
        move $t1, $s1            #ELSE s2 > s1 then move s2 into s1
        move $s1, $s2            #and also move s1 into s2 using a temp value
        move $s2, $t1		 #this eliminates a problem with losing s1 after moving s2 into s1
    CMP1:     
        bge $s2, $s3, CMP2       #IF s2 >= s3 go to CMP2
        j ADD			 #ELSE s3 and s1 are already contain biggest values go add please
    CMP2: 
    	move $s3, $s2		 #moves value of s2 into s3 for adding b/c s2 is > s3
    ADD:
        add $s0, $s1, $s3	 #add the two largest integers which will be stored in s1 and s3
        
        li $v0, 1		 #get ready to print integer
        move $a0, $s0		 #sets a0 to the sum
        syscall		 	 #int21
                
        li    $v0, 10		 #exit and int21
        syscall
