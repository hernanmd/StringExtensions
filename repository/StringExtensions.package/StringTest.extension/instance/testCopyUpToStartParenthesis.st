*StringExtensions
testCopyUpToStartParenthesis

	self assert: 'this is a (test) followed by text' copyUpToStartParenthesis = 'this is a'.
	self assert: 'this is a' copyUpToStartParenthesis = 'this is a'.
	self assert: '' copyUpToStartParenthesis = ''.