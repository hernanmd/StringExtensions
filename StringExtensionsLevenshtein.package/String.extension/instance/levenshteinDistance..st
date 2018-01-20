*StringExtensionsLevenshtein
levenshteinDistance: aString
	| matrix colChar rowChar cost |
	self isEmpty
		ifTrue: [ ^ aString size ].
	aString isEmpty
		ifTrue: [ ^ self size ].
	matrix := Dictionary new.
	0 to: self size do: [ :col | 0 to: aString size do: [ :row | matrix at: col @ row put: 0 ] ].
	0 to: self size do: [ :col | matrix at: col @ 0 put: col ].
	0 to: aString size do: [ :row | matrix at: 0 @ row put: row ].
	1 to: self size do: [ :col | 
		colChar := self at: col.
		1 to: aString size do: [ :row | 
			rowChar := aString at: row.
			cost := colChar = rowChar
				ifTrue: [ 0 ]
				ifFalse: [ 1 ].
			matrix
				at: col @ row
				put:
					(((matrix at: (col - 1) @ row) + 1
						min: (matrix at: col @ (row - 1)) + 1)
						min: (matrix at: (col - 1) @ (row - 1)) + cost) ] ].
	^ matrix at: self size @ aString size