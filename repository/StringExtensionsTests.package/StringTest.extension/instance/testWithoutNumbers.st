*StringExtensionsTests
testWithoutNumbers

	self assert: '3333' withoutNumbers equals: ''.
	self assert: 'aaaa' withoutNumbers equals: 'aaaa'.
	self assert: 'aaa1234' withoutNumbers equals: 'aaa'.
	self assert: '' withoutNumbers equals: ''.