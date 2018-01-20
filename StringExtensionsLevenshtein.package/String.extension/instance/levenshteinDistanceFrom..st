*StringExtensionsLevenshtein
levenshteinDistanceFrom: aCollection
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