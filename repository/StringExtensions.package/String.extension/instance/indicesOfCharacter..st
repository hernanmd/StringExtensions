*StringExtensions
indicesOfCharacter: aCharacter
	" Given aCharacter contained in the receiver, answer a <Collection> of positions where the aCharacter is found "
	
	| indices |

	indices := OrderedCollection new: self size.
	1 to: self size do: [ : pos |
		(self at: pos) asciiValue = aCharacter asciiValue ifTrue: [ indices addLast: pos ] ].
	^ indices