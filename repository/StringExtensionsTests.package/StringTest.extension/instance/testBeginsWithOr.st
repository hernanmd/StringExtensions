*StringExtensionsTests
testBeginsWithOr

	self assert: ('estudiantes' beginsWith: 'estu' or: 'campeon').
	self assert: ('estudiantes' beginsWith: 'campeon' or: 'est').
	self deny: ('estudiantes' beginsWith: 'subcampeon' or: 'amarg').
	
	self deny: ('' beginsWith: '' or: '').
	self deny: ('' beginsWith: 'test' or: '').
	self deny: ('' beginsWith: '' or: 'test').