*StringExtensions
testWithoutNumbers

	self assert: '3333' withoutNumbers = ''.
	self assert: 'aaaa' withoutNumbers = 'aaaa'.
	self assert: 'aaa1234' withoutNumbers = 'aaa'.
	self assert: '' withoutNumbers = ''.