Extension { #name : #SequenceableCollection }

{ #category : #'*StringExtensions' }
SequenceableCollection >> trimBoth [
	" Answer a <Collection> made up from the receiver whose elements are all trimmed <String> "
	
	^ self collect: #trimBoth
]
