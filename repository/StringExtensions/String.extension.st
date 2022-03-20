Extension { #name : #String }

{ #category : #'*StringExtensions' }
String >> asCondensedString [
	"Return a copy of the receiver with leading/trailing blanks removed and white spaces condensed."

	^ self withoutBlanks withoutCRs

]

{ #category : #'*StringExtensions' }
String >> asFloat [
	" Answer a <Float> that represents the value of the receiver "
	
	^ self asNumber asFloat
]

{ #category : #'*StringExtensions' }
String >> beginsWith: firstPrefix or: secondPrefix [
	" Answer <true> if receiver's begins with firstPrefix or secondPrefix "

	^ (self beginsWith: firstPrefix) or: [ self beginsWith: secondPrefix ]
]

{ #category : #'*StringExtensions' }
String >> copyUpToAny: aCollection [ 
	"Answer a <String> discarding all elements in the receiver which appear after any of of the elements in aCollection.
	
	'This is a test*discarded' copyUpToAny: { $* }. 'This is a test'
	'This is a test,discard text' copyUpToAny: { $* . $, }. 'This is a test'
	"

	| result |
	
	result := self copy.
	aCollection do: [ : startDiscardChar |
		result := result copyUpTo: startDiscardChar ].
	^ result
]

{ #category : #'*StringExtensions' }
String >> copyUpToStartParenthesis [
	" Answer the receiver without preserving all Character's up to the first opening parenthesis.

	'this is a (test)' withoutParenthesis -> 'this is a '
	'this is another (test) (with several) parenthesis' -> 'this is another'

	"
	^ (self includes: $()
		ifTrue: [ (self copyUpTo: $() trimRight ]
		ifFalse: [ self ]
]

{ #category : #'*StringExtensions' }
String >> findNumbers [
	" Answer a <Collection> of numbers, removing other characters "

	| string collection element pos |
	string := self class fromString: self.
	collection := OrderedCollection new.
	[ string isEmpty ]
		whileFalse: [ element := string asInteger asString.
			(element notEmpty and: [ element ~= 'nil' ])
				ifTrue: [ collection add: element ].
			pos := (string indexOfSubCollection: element startingAt: 1)
				+ element size + 1.
			string := pos <= string size
				ifTrue: [ string copyFrom: pos to: string size ]
				ifFalse: [ '' ] ].
	^ collection
]

{ #category : #'*StringExtensions' }
String >> hammingDistanceTo: aString [
	" Answer a <Number> respresenting the minimum amount of substitutions to convert the receiver into aString. It is only defined for strings of equal length "

	^ (1 to: self size) count: [ : i | (self at: i) ~= (aString at: i) ]
]

{ #category : #'*StringExtensions' }
String >> includesBeginWith: aString [
	" Answer whether aString begins like one of the receiver's sub strings elements. "

	^ self substrings anySatisfy: [ : each | 
			each asUppercase beginsWith: aString asUppercase ]

]

{ #category : #'*StringExtensions' }
String >> includesEndsWith: aString [
	" Answer whether aString ends like one of the receiver's sub strings elements. "

	^ self substrings anySatisfy: [ : each | 
			each asUppercase endsWith: aString asUppercase ]

]

{ #category : #'*StringExtensions' }
String >> indexesOfMotif: motif [
	" Answer a <Collection> of indexes of a motif in a string. Based in the Phonetix implementation "
	
	| indexes pos |
	indexes := OrderedCollection new.
	pos := 1.
	[ | index |		
		((index := self indexOfSubCollection: motif startingAt: pos) > 0) 
			ifTrue: [ 
				indexes add: index.
				pos := index + motif size ].
				(index ~= 0 and: [ pos <= (self size - motif size) ])
	] whileTrue.
	^ indexes
]

{ #category : #'*StringExtensions' }
String >> indicesOfCharacter: aCharacter [
	" Given aCharacter contained in the receiver, answer a <Collection> of positions where the aCharacter is found "
	
	| indices |

	indices := OrderedCollection new: self size.
	1 to: self size do: [ : pos |
		(self at: pos) asciiValue = aCharacter asciiValue ifTrue: [ indices addLast: pos ] ].
	^ indices
]

{ #category : #'*StringExtensions' }
String >> indicesOfSubstring: subString [
	" Given aCharacter contained in the receiver, answer a <Collection> of positions where the aCharacter is found. Overlapping is NOT considered, i.e. : 'nnnn' indicesOfSubstring: 'nn' --> an OrderedCollection(1 2 3) "
	
	| indices i |

	indices := OrderedCollection new: self size.
	i := 0.
	[ (i := self findString: subString startingAt: i + 1 caseSensitive: true) > 0 ] whileTrue: [ 
		indices addLast: i ].
	^ indices
]

{ #category : #'*StringExtensions' }
String >> indicesOfSubstring: subString mismatches: d [
	" Answer a <Collection> of start positions where subString is found allowing at most d mismatches. "

	^ Array streamContents: [ : stream | 
		| i |
		i := 1.
		[ i <= (self size - subString size + 1) ] whileTrue: [
			((self copyFrom: i to: subString size + i - 1) fuzzyMatch: subString) <= d
				ifTrue: [ stream nextPut: i ].
			i := i + 1 ] ].

]

{ #category : #'*StringExtensions' }
String >> indicesOfSubstringOverlaps: subString [
	" Given aCharacter contained in the receiver, answer a <Collection> of positions where the aCharacter is found. Overlapping is considered, i.e. : 'nnnn' indicesOfSubstring: 'nn' --> an OrderedCollection(1 2 3) "
	
	| indices i |

	indices := OrderedCollection new: self size.
	i := 0.
	[ (i := self findString: subString startingAt: i + 1 caseSensitive: true) > 0 ] whileTrue: [ 
		indices addLast: i.
		i := i + 1 ].
	^ indices
]

{ #category : #'*StringExtensions' }
String >> isAllBlanks [
	"Answer <true> whether the receiver is composed entirely of space separators "
	
	^ self notEmpty and: [ self allSatisfy: #isSpaceSeparator ].

]

{ #category : #'*StringExtensions' }
String >> isAllLetters [
	"Answer <true> whether the receiver is composed entirely of letters "
	
	^ self notEmpty and: [ self allSatisfy: #isLetter ].

]

{ #category : #'*StringExtensions' }
String >> isNumeric [
	" Answer whether the receiver is a Number. "
	
	^ self matchesRegex: ('[+-]?[0-9]*\.?[0-9]+(e-?[0-9]+)?')
]

{ #category : #'*StringExtensions' }
String >> isXML [
	" Only answer <true> when the receiver's contents *looks like* XML, not performing any validity check.
	Yes, I know... "
	
	^ self beginsWith: '<?xml'
]

{ #category : #'*StringExtensions' }
String >> isZipped [
	" Answer <true> if receiver conforms to GZIP file format "

	^ (self first: 2) asByteArray = GZipConstants gzipMagic asByteArray reverse
]

{ #category : #'*StringExtensions' }
String >> levenshteinDistanceTo: anotherString [
	" Iterative calculation of the Levenshtein distance between two strings. Courtesy of Paul Wilke "

	| arrayTwo arrayOne |
	"degenerate cases"
	anotherString = self 
		ifTrue: [ ^ 0 ].
	anotherString isEmpty
		ifTrue: [ ^ self size ].
	self isEmpty
		ifTrue: [ ^ anotherString size ].
	"create two work vectors of integer distances"
	arrayOne := Array new: anotherString size + 1.
	arrayTwo := Array new: anotherString size + 1.
	"initialize v0 (the previous row of distances)
    	this row is A[0][i]: edit distance for an empty s
    	the distance is just the number of characters to delete from t"
	1 to: arrayOne size do: [ :i | arrayOne at: i put: i - 1 ].
	1 to: self size do: [ :i | 
			arrayTwo at: 1 put: i.
			" use formula to fill in the rest of the row"
			1 to: anotherString size
				do: [ :j | 
					| cost minimum minimumAux |
					cost := (self at: i) = (anotherString at: j)
						ifTrue: [ 0 ]
						ifFalse: [ 1 ].
					minimumAux := (arrayTwo at: j) + 1 min: (arrayOne at: j + 1) + 1.
					minimum := minimumAux min: (arrayOne at: j) + cost.
					arrayTwo at: j + 1 put: minimum ].
			1 to: arrayOne size do: [ :j | arrayOne at: j put: (arrayTwo at: j) ] ].
	" calculate v1 (current row distances) from the previous row v0
		first element of v1 is A[i+1][0] edit distance is delete (i+1) chars from s to match empty t"
	^ arrayTwo at: anotherString size + 1
]

{ #category : #'*StringExtensions' }
String >> lowercaseFirstLetter [
	" Answer a String made up from the receiver whose first character is lowercase. "

	self isEmpty
		ifTrue: [ ^ self ].
	^ self class streamContents: [ : stream |
		stream 
			nextPut: self first asLowercase;
			nextPutAll: self copy asString allButFirst ]
]

{ #category : #'*StringExtensions' }
String >> shingle: n [
	" Answer an <OrderedSet> with contiguous sequences (shingles) of n characters.
	n is the number of characters per shingle "

	^ (1 to: self size - n + 1) 
			collect: [ : i | self copyFrom: i to: i + n - 1 ] 
			as: OrderedSet.
]

{ #category : #'*StringExtensions' }
String >> shingleMax: n [
	" Answer an maximally shingled <Set> with contiguous sequences (shingles) of n characters.
	n is the number of characters per shingle "

	^ (1 to: self size - n + 1) 
			collect: [ : i | self copyFrom: i to: i + n - 1 ] 
			as: Set.
]

{ #category : #'*StringExtensions' }
String >> shingleWords: n [
	" Word shingling. Answer a <Collection> of n-shingles, which are the with contiguous sequences (shingles) of n words.
	n is the number of word per shingle "

	| words |
	words := self findTokens: ' '.
	self assert: [ n < words size and: [ n > 0 ] ].
	^ (1 to: words size - n + 1) collect: [ : i | (words copyFrom: i to: i + n - 1) asArray ].
]

{ #category : #'*StringExtensions' }
String >> withoutBlanks [
	" Return a copy of the receiver with leading/trailing blanks removed and white spaces condensed. "

	| trimmed |
	trimmed := self trimBoth.
	^ self class streamContents: [ : stream |
		trimmed do: [ : c | c == Character space ifFalse: [ stream nextPut: c ] ] ].

	" ' abc  d   ' withoutBlanks "

]

{ #category : #'*StringExtensions' }
String >> withoutCRs [
	" Answer the receiver without carriage returns. "
	
	^ self lines joinUsing: self class empty
]

{ #category : #'*StringExtensions' }
String >> withoutNumbers [
	"Return a copy of the receiver with numbers removed "

	^ self reject: #isDigit
]
