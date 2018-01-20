*StringExtensionsTests
testIncludesBeginWith

	self assert: ('Rose is a rose of splendor' includesBeginWith: 'rose').
	self assert: ('Rose is a rose of splendor' includesBeginWith: 'Rose').
	self assert: ('Rose is a rose of splendor' includesBeginWith: 'ROSE').
	self assert: ('Raise the art to resistance' includesBeginWith: 'resist').
	self assert: ('Danger dare to be grand' includesBeginWith: 'dare').
	self deny: ('' includesBeginWith: 'dare').
	self deny: ('' includesBeginWith: '').