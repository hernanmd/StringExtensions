*StringExtensionsTests
testIndicesOfCharacter

	self assert: ('estudiantes' indicesOfCharacter: $e) asArray equals: #(1 10).
	self assert: ('estudiantes' indicesOfCharacter: $z) isEmpty.
	self assert: ('' indicesOfCharacter: $a) isEmpty.
	self assert: ('' indicesOfCharacter: Character space) isEmpty.
