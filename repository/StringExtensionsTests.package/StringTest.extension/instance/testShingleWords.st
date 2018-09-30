*StringExtensionsTests
testShingleWords

	| gertrudeText |
	
	gertrudeText := 'a rose is a rose is a rose'.
	self assertCollection: (gertrudeText shingleWords: 4) hasSameElements: 
		#(
			#('a' 'rose' 'is' 'a') 
			#('rose' 'is' 'a' 'rose') 
			#('is' 'a' 'rose' 'is') 
			#('a' 'rose' 'is' 'a') 
			#('rose' 'is' 'a' 'rose')).
	self assertCollection: (gertrudeText shingleWords: 2) hasSameElements: 
		#(
			 #('a' 'rose') 
			#('rose' 'is') 
			#('is' 'a') 
			#('a' 'rose') 
			#('rose' 'is') 
			#('is' 'a') 
			#('a' 'rose')).
