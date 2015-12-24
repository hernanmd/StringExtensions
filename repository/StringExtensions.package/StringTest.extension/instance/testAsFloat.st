*StringExtensions
testAsFloat

	self assert: '3' asFloat = 3.0.
	self should: [ 'a' asFloat ] raise: Error.
	self should: [ '' asFloat ] raise: Error.