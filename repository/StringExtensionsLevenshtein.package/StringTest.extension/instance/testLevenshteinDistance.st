*StringExtensionsLevenshtein-Tests
testLevenshteinDistance

	self assert: ('apple' levenshteinDistance: 'map') equals: 4.
	self assert: ('this is a test' levenshteinDistance: 'this is a test') equals: 0.
	self assert: ('this ain''t no test' levenshteinDistance: 'this is a test') equals: 6.
	self assert: ('dog' levenshteinDistance: 'dogs') equals: 1.
	self assert: ('puppy' levenshteinDistance: 'lucky') equals: 3.
	self assert: ('matrix' levenshteinDistance: 'xxxmatr') equals: 5.