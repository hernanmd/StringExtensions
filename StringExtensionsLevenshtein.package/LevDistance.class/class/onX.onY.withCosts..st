instance creation
onX: aString onY: anotherString withCosts: anArray
	^ self new initialize 
		x: aString;
		y: anotherString;
		operationCosts: anArray;
		yourself