*StringExtensionsLevenshtein-Tests
testLevenshteinDistanceFrom

	self assert: ('apple' levenshteinDistanceFrom: 'map') equals: 4.
	self assert: ('this is a test' levenshteinDistanceFrom: 'this is a test') equals: 0.
	self assert: ('this ain''t no test' levenshteinDistanceTo: 'this is a test') equals: 6.
	self assert: ('dog' levenshteinDistanceFrom: 'dogs') equals: 1.
	self assert: ('puppy' levenshteinDistanceFrom: 'lucky') equals: 3.
	self assert: ('matrix' levenshteinDistanceFrom: 'xxxmatr') equals: 5.