*StringExtensions
testIsNumeric

	self assert: '3333' isNumeric.
	self deny: 'aaaa' isNumeric.
	self deny: '' isNumeric.
	self deny: 'abc567' isNumeric.