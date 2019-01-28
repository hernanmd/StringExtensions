*StringExtensions
hammingDistanceTo: aString
	" Answer a <Number> respresenting the minimum amount of substitutions to convert the receiver into aString. It is only defined for strings of equal length "

	^ (1 to: self size) count: [ : i | (self at: i) ~= (aString at: i) ]