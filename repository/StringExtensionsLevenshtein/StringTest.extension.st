Extension { #name : #StringTest }

{ #category : #'*StringExtensionsLevenshtein-Tests' }
StringTest >> testLevDistance [

	self assert: (LevDistance onX: 'apple' onY: 'map') distance equals: 4.
	self assert: (LevDistance onX: 'this is a test' onY: 'this is a test') distance equals: 0.
	self assert: (LevDistance onX: 'this ain''t no test' onY: 'this is a test') distance equals: 6.
	self assert: (LevDistance onX: 'dog' onY: 'dogs') distance equals: 1.
	self assert: (LevDistance onX: 'puppy' onY: 'lucky') distance equals: 3.
	self assert: (LevDistance onX: 'matrix' onY: 'xxxmatr') distance equals: 5.
]

{ #category : #'*StringExtensionsLevenshtein-Tests' }
StringTest >> testLevenshteinDistance [

	self assert: ('apple' levenshteinDistance: 'map') equals: 4.
	self assert: ('this is a test' levenshteinDistance: 'this is a test') equals: 0.
	self assert: ('this ain''t no test' levenshteinDistance: 'this is a test') equals: 6.
	self assert: ('dog' levenshteinDistance: 'dogs') equals: 1.
	self assert: ('puppy' levenshteinDistance: 'lucky') equals: 3.
	self assert: ('matrix' levenshteinDistance: 'xxxmatr') equals: 5.
]

{ #category : #'*StringExtensionsLevenshtein-Tests' }
StringTest >> testLevenshteinDistanceFrom [

	self assert: ('apple' levenshteinDistanceFrom: 'map') equals: 4.
	self assert: ('this is a test' levenshteinDistanceFrom: 'this is a test') equals: 0.
	self assert: ('this ain''t no test' levenshteinDistanceTo: 'this is a test') equals: 6.
	self assert: ('dog' levenshteinDistanceFrom: 'dogs') equals: 1.
	self assert: ('puppy' levenshteinDistanceFrom: 'lucky') equals: 3.
	self assert: ('matrix' levenshteinDistanceFrom: 'xxxmatr') equals: 5.
]

{ #category : #'*StringExtensionsLevenshtein-Tests' }
StringTest >> testLevenshteinDistanceWith [

	self assert: ('apple' levenshteinDistanceWith: 'map') equals: 4.
	self assert: ('this is a test' levenshteinDistanceWith: 'this is a test') equals: 0.
	self assert: ('this ain''t no test' levenshteinDistanceTo: 'this is a test') equals: 6.
	self assert: ('dog' levenshteinDistanceWith: 'dogs') equals: 1.
	self assert: ('puppy' levenshteinDistanceWith: 'lucky') equals: 3.
	self assert: ('matrix' levenshteinDistanceWith: 'xxxmatr') equals: 5.
]
