*StringExtensions
testCopyUpToStartParenthesis

	self assert: 'this is a (test) followed by text' copyUpToStartParenthesis equals: 'this is a'.
	self assert: 'this is a' copyUpToStartParenthesis equals: 'this is a'.
	self assert: '' copyUpToStartParenthesis equals: ''.