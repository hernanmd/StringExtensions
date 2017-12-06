*StringExtensionsTests
testLevDistance

	self assert: (LevDistance onX: 'apple' onY: 'map') distance equals: 4.
	self assert: (LevDistance onX: 'this is a test' onY: 'this is a test') distance equals: 0.
	self assert: (LevDistance onX: 'this ain''t no test' onY: 'this is a test') distance equals: 6.
	self assert: (LevDistance onX: 'dog' onY: 'dogs') distance equals: 1.
	self assert: (LevDistance onX: 'puppy' onY: 'lucky') distance equals: 3.
	self assert: (LevDistance onX: 'matrix' onY: 'xxxmatr') distance equals: 5.