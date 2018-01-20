*StringExtensionsTests
testLowercaseFirstLetter

	self assert: '3333' lowercaseFirstLetter equals: '3333'.
	self assert: '<?xml' lowercaseFirstLetter equals: '<?xml'.
	self assert: 'ABc567' lowercaseFirstLetter equals: 'aBc567'.
	self assert: 'aaaaa' lowercaseFirstLetter equals: 'aaaaa'.	
	self assert: '' lowercaseFirstLetter equals: ''.