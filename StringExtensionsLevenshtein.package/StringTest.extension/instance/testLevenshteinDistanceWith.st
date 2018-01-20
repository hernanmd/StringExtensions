*StringExtensionsLevenshtein-Tests
testLevenshteinDistanceWith

	self assert: ('apple' levenshteinDistanceWith: 'map') equals: 4.
	self assert: ('this is a test' levenshteinDistanceWith: 'this is a test') equals: 0.
	self assert: ('this ain''t no test' levenshteinDistanceTo: 'this is a test') equals: 6.
	self assert: ('dog' levenshteinDistanceWith: 'dogs') equals: 1.
	self assert: ('puppy' levenshteinDistanceWith: 'lucky') equals: 3.
	self assert: ('matrix' levenshteinDistanceWith: 'xxxmatr') equals: 5.