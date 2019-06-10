Extension { #name : #Dictionary }

{ #category : #'*StringExtensions' }
Dictionary >> asLowercase [
	" Answer a <Collection> made up from the receiver whose elements are all lowercased <String> "

	^ self values collect: #asLowercase
]
