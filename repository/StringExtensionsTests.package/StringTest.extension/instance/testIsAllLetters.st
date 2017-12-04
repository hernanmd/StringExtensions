*StringExtensionsTests
testIsAllLetters

	self deny: '3333' isAllLetters.
	self assert: 'aaaa' isAllLetters.
	self deny: '' isAllLetters.
	self deny: 'abc567' isAllLetters.