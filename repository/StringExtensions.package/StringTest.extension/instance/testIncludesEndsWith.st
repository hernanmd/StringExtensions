*StringExtensions
testIncludesEndsWith

	self assert: ('Rose is a rose of splendor' includesEndsWith: 'splendor').
	self assert: ('Rose is a rose of splendor' includesEndsWith: 'Splendor').
	self assert: ('Rose is a rose of splendor' includesEndsWith: 'SPLENDOR').
	self assert: ('Raise the art to resistance' includesEndsWith: 'tance').
	self assert: ('Danger dare to be grand' includesEndsWith: 'and').
	self deny: ('' includesEndsWith: 'dare').
	self deny: ('' includesEndsWith: '').