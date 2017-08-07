#*****************    	ICOM 4036   	 	*****************#
#*****************	Sec. 156   	 	*****************#
#***************** Rafael Vega #802-01-8317	*****************#
#***************** Orlando Ferrer #802-01-2321  *****************#




		andi	0	# matrix 1 value 1 
		addi	1
		storei	100	
		andi	0	# matrix 1 value 2
		addi	2
		storei	102
		andi	0	# matrix 1 value 3
		addi	3
		storei	104
		andi	0	# matrix 1 value 4
		addi	4
		storei	106
		andi	0	# matrix 1 location pointer
		addi	100
		storei	108
		andi	0	# matrix 2 value 1
		addi	4
		storei	200
		andi	0	# matrix 2 value 2
		addi	3
		storei	202
		andi	0	# matrix 2 value 3
		addi	2
		storei	204
		andi	0	# matrix 2 value 4
		addi	1
		storei	206
		andi	0	# matrix 2 location pointer
		addi	200
		storei	208
		andi	0	# matrix 2 value pointer
		add	200
		storei	210		
		andi	0	# result matrix values
		storei	300
		storei	302
		storei	304
		storei	306
		storei	310	# result matrix value pointer
		add	300
		storei	308	# result matrix location pointer
		andi	0
		addi	2	# matrix size
		storei	350
		andi	0
		addi	4
		storei	352	# size^2
		andi	0
		storei	354	# count1
		storei	356	# count2
		storei	358	# count3		
main:		loadi	354	# count1; for loop 1
		comp
		addi	1	
		add	352	# size^2
		brni	exit
loop:		loadi	356	# count2; for loop 2
		comp
		addi	1
		add	350	# size
		brni	endloop
		load	108	# matrix 1 pointer
		and	210	# matrix 2 value
		add	310	# res matrix value
		store	308	# res matrix location
		loadi	108	# matrix 1 location
		addi	2
		storei	108	# martix 1 location
		loadi 	356	# count2
		and 	350	# size
		andi	2
		add	208	# matrix 2 location 
		storei	208	# matrix 2 location
		loadi	208	# matrix 2 location
		store	210	# matrix 2 value
		loadi	356	# count2
		addi	1	
		storei	356	# count2
		jumpi	loop
endloop:	loadi 	350	# size
		andi	2
		comp
		addi	1
		add	108	#matrix 1 location
		storei	108	# matrix 1 location		
		andi	0	# reset matrix2 loc
		addi	1
		comp
		addi	1
		add	356	# count2
		and	350	# size
		andi	2
		comp
		addi	1
		add	208	# matrix 2 location
		storei	208	# matrix 2 location
		loadi 	308	# res matrix location
		addi	2	
		storei	308	# res matrix location
		store	310	# res matrix value		
		loadi	354	# count1
		addi	1	
		storei	354	# count1		
if:		loadi	350	# size; if control
		andi 	1
		comp
		addi	1
		add	358	# count 3
		brni	next
		loadi	208	# matrix 2 location
		addi 	2
		storei	208	# matrix2 location		
		loadi	358	# count 3
		addi	1
		storei	358	# count 3
		jumpi	main
next:		loadi	350	# size; increment row
		andi	2
		add	108	# matrix 1 location
		storei	108	# matrix 1 location
		andi	0
		store	358	# reset count 3
		jumpi	main
exit: