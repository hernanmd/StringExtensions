*StringExtensions
testAsCondensedString

	self assert: '  spaced-text   ' asCondensedString equals: 'spaced-text'.
	self deny: '

spaced text  ' asCondensedString = 'spaced-text'