*StringExtensions
testLowercaseFirstLetter

	self assert: '3333' lowercaseFirstLetter = '3333'.
	self assert: '<?xml' lowercaseFirstLetter = '<?xml'.
	self assert: 'ABc567' lowercaseFirstLetter = 'aBc567'.
	self assert: 'aaaaa' lowercaseFirstLetter = 'aaaaa'.	
	self assert: '' lowercaseFirstLetter = ''.