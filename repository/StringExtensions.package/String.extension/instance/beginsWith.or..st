*StringExtensions
beginsWith: firstPrefix or: secondPrefix
	" Answer <true> if receiver's begins with firstPrefix or secondPrefix "

	^ ((self beginsWith: firstPrefix) or: [ self beginsWith: secondPrefix ])