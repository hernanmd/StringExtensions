*StringExtensions
lowercaseFirstLetter
	"Answer a String made up from the receiver whose first character is lowercase."

	^ self first asLowercase asString , self copy asString allButFirst