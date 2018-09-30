*StringExtensions
shingleWords: n
	" Word shingling. Answer a <Collection> of n-shingles, which are the with contiguous sequences (shingles) of n words.
	n is the number of word per shingle "

	| words |
	words := self findTokens: ' '.
	self assert: [ n < words size and: [ n > 0 ] ].
	^ (1 to: words size - n + 1) collect: [ : i | (words copyFrom: i to: i + n - 1) asArray ].