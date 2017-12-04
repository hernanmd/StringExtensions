*StringExtensions
levenshteinDistanceTo: anotherString
	" Iterative calculation of the Levenshtein distance between two strings. Courtesy of Paul Wilke "

	| arrayTwo arrayOne |
	"degenerate cases"
	anotherString = self
		ifTrue: [ ^ 0 ].
	anotherString size = 0
		ifTrue: [ ^ self size ].
	self size = 0
		ifTrue: [ ^ anotherString size ].

	"create two work vectors of integer distances"
	arrayOne := Array new: anotherString size + 1.
	arrayTwo := Array new: anotherString size + 1.

	"initialize v0 (the previous row of distances)
    	this row is A[0][i]: edit distance for an empty s
    	the distance is just the number of characters to delete from t"
	(1 to: arrayOne size) do: [ :i | arrayOne at: i put: i - 1 ].
	(1 to: self size)
		do:
			[ :i | 
			arrayTwo at: 1 put: i.

			" use formula to fill in the rest of the row"
			(1 to: anotherString size)
				do:
					[ :j | 
					| cost minimum minimumAux |
					(self at: i) = (anotherString at: j)
						ifTrue: [ cost := 0 ]
						ifFalse: [ cost := 1 ].
					minimumAux := (arrayTwo at: j) + 1 min: (arrayOne at: j + 1) + 1.
					minimum := minimumAux min: (arrayOne at: j) + cost.
					arrayTwo at: j + 1 put: minimum ].
			(1 to: arrayOne size) do: [ :j | arrayOne at: j put: (arrayTwo at: j) ] ].
	" calculate v1 (current row distances) from the previous row v0
		first element of v1 is A[i+1][0] edit distance is delete (i+1) chars from s to match empty t"
	^ arrayTwo at: anotherString size + 1