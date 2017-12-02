*StringExtensions
testWithoutBlanks

	self assert: '3333' withoutBlanks equals: '3333'.
	self assert: 'aa aa' withoutBlanks equals: 'aaaa'.
	self assert: 'aaaa ' withoutBlanks equals: 'aaaa'.
	self assert: ' aaaa' withoutBlanks equals: 'aaaa'.	
	self assert: '' withoutBlanks equals: ''.