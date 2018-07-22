*StringExtensions
indicesOfSubstring: subString mismatches: d
	" Answer a <Collection> of start positions where subString is found allowing at most d mismatches. "

	^ Array streamContents: [ : stream | 
		| i |
		i := 1.
		[ i <= (self size - subString size + 1) ] whileTrue: [
			((self copyFrom: i to: subString size + i - 1) fuzzyMatch: subString) <= d
				ifTrue: [ stream nextPut: i ].
			i := i + 1 ] ].
