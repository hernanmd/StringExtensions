*StringExtensionsTests
testIndicesOfCharacter

	self assert: ('estudiantes' indexesOfCharacter: $e) asArray equals: #(1 10).
	self assert: ('estudiantes' indexesOfCharacter: $z) isEmpty.
	self assert: ('' indexesOfCharacter: $a) isEmpty.
	self assert: ('' indexesOfCharacter: Character space) isEmpty.
