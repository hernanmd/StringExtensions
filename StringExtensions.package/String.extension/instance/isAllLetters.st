*StringExtensions
isAllLetters
	"Answer <true> whether the receiver is composed entirely of letters "
	
	^ self notEmpty and: [ self allSatisfy: #isLetter ].
