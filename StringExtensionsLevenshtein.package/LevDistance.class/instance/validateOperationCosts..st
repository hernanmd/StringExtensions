validating
validateOperationCosts: anArray
	anArray size = self class defaultOperationCosts size
		ifFalse: [ ^ false ].
	^ anArray allSatisfy: [ :each | each asInteger isInteger ]