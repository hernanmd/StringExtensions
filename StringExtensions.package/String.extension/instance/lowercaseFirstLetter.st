*StringExtensions
lowercaseFirstLetter
	" Answer a String made up from the receiver whose first character is lowercase. "

	self isEmpty
		ifTrue: [ ^ self ].
	^ self class streamContents: [ : stream |
		stream 
			nextPut: self first asLowercase;
			nextPutAll: self copy asString allButFirst ]