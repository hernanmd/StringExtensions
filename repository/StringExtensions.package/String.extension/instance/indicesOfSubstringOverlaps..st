*StringExtensions
indicesOfSubstringOverlaps: subString
	" Given aCharacter contained in the receiver, answer a <Collection> of positions where the aCharacter is found. Overlapping is considered, i.e. : 'nnnn' indicesOfSubstring: 'nn' --> an OrderedCollection(1 2 3) "
	
	| indices i |

	indices := OrderedCollection new: self size.
	i := 0.
	[ (i := self findString: subString startingAt: i + 1) > 0 ] whileTrue: [ 
		indices addLast: i.
		i := i + 1 ].
	^ indices