*StringExtensions
findNumbers
	" Answer a <Collection> of numbers, removing other characters " 
	
	| string collection element pos |

	string:= String fromString: self.
	collection:= OrderedCollection new.
	[ string isEmpty ] whileFalse: [ 
		element:= string asInteger asString.
		(element notEmpty and:[ element ~= 'nil' ])
			ifTrue: [ collection add: element ].
		pos:= (string indexOfSubCollection: element startingAt: 1) + element size + 1.
		pos <= string size 
			ifTrue:[	string:= string copyFrom:pos to: string size ]
			ifFalse:[ string := '' ] ].
	^ collection
