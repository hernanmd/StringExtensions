*StringExtensions
hammingDistanceTo: aString
	"  "

	self assert: self size equals: aString size.
	^ (1 to: self size) count: [ : i | (self at: i) ~= (aString at: i) ]