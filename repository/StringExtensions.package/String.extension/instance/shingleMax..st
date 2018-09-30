*StringExtensions
shingleMax: n
	" Answer an maximally shingled <Set> with contiguous sequences (shingles) of n characters.
	n is the number of characters per shingle "

	^ (1 to: self size - n + 1) 
			collect: [ : i | self copyFrom: i to: i + n - 1 ] 
			as: Set.