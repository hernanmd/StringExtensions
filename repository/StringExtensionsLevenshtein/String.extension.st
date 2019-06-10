Extension { #name : #String }

{ #category : #'*StringExtensionsLevenshtein' }
String >> levenshteinDistance: aString [
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
]

{ #category : #'*StringExtensionsLevenshtein' }
String >> levenshteinDistanceFrom: aCollection [
	" Levenshtein implemented from the http://www.squeaksource.com/Fuzz repository "

	| matrix cost up back upback |

	matrix := Matrix rows: self size + 1 columns: aCollection size + 1.
	0 to: self size do: [ :i | matrix at: i + 1 at: 1 put: i ].
	0 to: aCollection size do: [ :j | matrix at: 1 at: j + 1 put: j ].
	self
		keysAndValuesDo: [ :i :l | 
			aCollection
				keysAndValuesDo: [ :j :r | 
					cost := l = r
						ifTrue: [ 0 ]
						ifFalse: [ 1 ].
					up := matrix at: i at: j + 1.
					back := matrix at: i + 1 at: j.
					upback := matrix at: i at: j.
					matrix
						at: i + 1
						at: j + 1
						put: ((up + 1 min: back + 1) min: upback + cost) ] ].
	^ matrix at: self size + 1 at: aCollection size + 1
]

{ #category : #'*StringExtensionsLevenshtein' }
String >> levenshteinDistanceWith: anotherWord [
	" Answer a <Number> representing the Levenshtein distance between two words. Implementation taken and adapted from the Phonetix repository with permission from Olivier Auverlot "

	| stab cost |
	"if a string is empty, answer the length of the another string"
	self isEmpty
		ifTrue: [ ^ anotherWord size ].
	anotherWord isEmpty
		ifTrue: [ ^ self size ].
	stab := Matrix
		rows: anotherWord size + 1
		columns: self size + 1.
	1 to: stab columnCount do: [ :i | stab at: 1 at: i put: i - 1 ].
	1 to: stab rowCount do: [ :i | stab at: i at: 1 put: i - 1 ].
	2 to: stab columnCount do: [ :i | 
		2 to: stab rowCount do: [ :j | 
			cost := (self at: i - 1) = (anotherWord at: j - 1)
				ifTrue: [ 0 ]
				ifFalse: [ 1 ].
			stab
				at: j
				at: i
				put:
					({((stab at: j at: i - 1) + 1).
					((stab at: j - 1 at: i) + 1).
					((stab at: j - 1 at: i - 1) + cost)}
						asSortedCollection: [ :a :b | a < b ]) first ] ].
	^ stab at: stab rowCount at: stab columnCount
]
