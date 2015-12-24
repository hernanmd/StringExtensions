*StringExtensions
testAsCondensedString

	self assert: '  spaced-text   ' asCondensedString = 'spaced-text'.
	self deny: '

spaced text  ' asCondensedString = 'spaced-text'