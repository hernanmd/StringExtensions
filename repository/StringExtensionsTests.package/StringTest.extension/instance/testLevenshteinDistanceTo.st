*StringExtensionsTests
testLevenshteinDistanceTo

	self assert: ('apple' levenshteinDistanceTo: 'map') equals: 4.
	self assert: ('this is a test' levenshteinDistanceTo: 'this is a test') equals: 0.
	self assert: ('this ain''t no test' levenshteinDistanceTo: 'this is a test') equals: 6.
	self assert: ('dog' levenshteinDistanceTo: 'dogs') equals: 1.
	self assert: ('puppy' levenshteinDistanceTo: 'lucky') equals: 3.
	self assert: ('matrix' levenshteinDistanceTo: 'xxxmatr') equals: 5.