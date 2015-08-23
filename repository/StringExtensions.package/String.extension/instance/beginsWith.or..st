*StringExtensions
beginsWith: firstPrefix or: secondPrefix

	^ ((self beginsWith: firstPrefix) or:  [ self beginsWith: secondPrefix ])