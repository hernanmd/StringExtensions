Extension { #name : #Collection }

{ #category : #'*StringExtensions' }
Collection >> asLowercase [
	" Answer a <Collection> made up from the receiver whose elements are all lowercased <String> "

	^ self collect: #asLowercase
]
