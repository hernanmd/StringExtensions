*StringExtensions
testWithoutBlanks

	self assert: '3333' withoutBlanks = '3333'.
	self assert: 'aa aa' withoutBlanks = 'aaaa'.
	self assert: 'aaaa ' withoutBlanks = 'aaaa'.
	self assert: ' aaaa' withoutBlanks = 'aaaa'.	
	self assert: '' withoutBlanks = ''.