*StringExtensions
indicesOfSubstring: subString
	" Given aCharacter contained in the receiver, answer a <Collection> of positions where the aCharacter is found "
	
	| indices i |

	indices := OrderedCollection new: self size.
	i := 0.
	[ (i := self findString: subString startingAt: i + 1) > 0 ] whileTrue: [ 
		indices addLast: i ].
	^ indices