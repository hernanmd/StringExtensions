accessing
operationCosts: anArray
	(self validateOperationCosts: anArray) 
		ifTrue: [ operationCosts := anArray ]
		ifFalse: [ self error: 'invalid costs' ]