*StringExtensionsLevenshtein
levenshteinDistanceWith: anotherWord
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