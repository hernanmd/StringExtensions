*StringExtensions
findNumbers
	" Answer a <Collection> of numbers, removing other characters "

	| string collection element pos |
	string := self class fromString: self.
	collection := OrderedCollection new.
	[ string isEmpty ]
		whileFalse: [ element := string asInteger asString.
			(element notEmpty and: [ element ~= 'nil' ])
				ifTrue: [ collection add: element ].
			pos := (string indexOfSubCollection: element startingAt: 1)
				+ element size + 1.
			string := pos <= string size
				ifTrue: [ string copyFrom: pos to: string size ]
				ifFalse: [ '' ] ].
	^ collection