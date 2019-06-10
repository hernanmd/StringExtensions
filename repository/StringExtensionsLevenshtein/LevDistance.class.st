"
Levensthein distance for strings. ""hacky"" implementation, but reasonably fast ... 
"
Class {
	#name : #LevDistance,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'operationCosts'
	],
	#category : 'StringExtensionsLevenshtein'
}

{ #category : #'instance creation' }
LevDistance class >> defaultOperationCosts [
	" costs for A->B substitution, ->A insertion. A-> deletion "
	" { X->X, Y->Y. X->Y. Y-X. ->X. ->Y. X->. Y->. } "
	^ { 0. 0. 1. 1. 1. 1. 1. 1. }
]

{ #category : #'instance creation' }
LevDistance class >> onX: aString onY: anotherString [
	^ self onX: aString onY: anotherString withCosts: self defaultOperationCosts.
]

{ #category : #'instance creation' }
LevDistance class >> onX: aString onY: anotherString withCosts: anArray [
	^ self new initialize 
		x: aString;
		y: anotherString;
		operationCosts: anArray;
		yourself
]

{ #category : #converting }
LevDistance >> asSimpleDistanceMatrix [

	^ self rawCostMatrix collect: #last.

]

{ #category : #costs }
LevDistance >> deletionX [
	^ self operationCosts at: 7.
]

{ #category : #costs }
LevDistance >> deletionY [
	^ self operationCosts at: 8.
]

{ #category : #distance }
LevDistance >> distance [
	^ self rawMatrixValue: (self rawCostMatrix) atRow: (self x size + 1) atColumn: (self y size + 1)
]

{ #category : #initializing }
LevDistance >> emptyMatrix [
	| matrix |

	matrix := Matrix rows: (self x size + 1) columns: (self y size + 1).

	matrix at: 1 at: 1 put: (self m1: 0 m2: 0 m3: 0 value: 0).
	2 to: (matrix rowCount) do: [ :index | 
		matrix at: index at: 1 put: 
			(self m1: 0 m2: 0 m3: 0 value: ((matrix at: index-1 at: 1) last + self deletionX)) ].
	2 to: (matrix columnCount) do: [ :index | 
		matrix at: 1 at: index put:
			(self m1: 0 m2: 0 m3: 0 value: ((matrix at: 1 at: index-1) last + self insertionY)) ].

	^ matrix
]

{ #category : #initializing }
LevDistance >> initialize [
	self x: self nullString.
	self y: self nullString.
	self operationCosts: self class defaultOperationCosts.
]

{ #category : #costs }
LevDistance >> insertionX [
	^ self operationCosts at: 5.
]

{ #category : #costs }
LevDistance >> insertionY [
	^ self operationCosts at: 6.
]

{ #category : #private }
LevDistance >> m1: m1 m2: m2 m3: m3 value: anInteger [
	^ self m1: m1 m2: m2 m3: m3 value: anInteger pointer: nil 
]

{ #category : #private }
LevDistance >> m1: m1 m2: m2 m3: m3 value: anInteger pointer: anArray [
	^ { 	{ m1. m2. m3. }. anArray. anInteger. }
]

{ #category : #initializing }
LevDistance >> nullString [
	^ String new.
]

{ #category : #costs }
LevDistance >> operationCosts [
	^ operationCosts
]

{ #category : #accessing }
LevDistance >> operationCosts: anArray [
	(self validateOperationCosts: anArray) 
		ifTrue: [ operationCosts := anArray ]
		ifFalse: [ self error: 'invalid costs' ]
]

{ #category : #transcripting }
LevDistance >> printComplexCostMatrix [
	self transcript: #streamComplexCostMatrix: 
]

{ #category : #transcripting }
LevDistance >> printCostMatrix [
	self transcript: #streamCostMatrix: 
]

{ #category : #transcripting }
LevDistance >> printPointer [
	self transcript: #streamPointers: 
]

{ #category : #transcripting }
LevDistance >> printSimpleCostMatrix [
	self transcript: #streamSimpleCostMatrix: 
]

{ #category : #distance }
LevDistance >> rawCostMatrix [
	| matrix |
	matrix := self emptyMatrix.
	2 to: matrix rowCount do: [ :r | 
		2 to: matrix columnCount do: [ :c | 
			| m1 m2 m3 distance value pointer |
			"values"
			m1 := self rawMatrixValue: matrix atRow: r - 1 atColumn: c - 1.
			(self x at: r - 1) = (self y at: c - 1)
				ifFalse: [ m1 := m1 + self substitutionXY ].
			m2 := (self rawMatrixValue: matrix atRow: r - 1 atColumn: c)
				+ self deletionX.
			m3 := (self rawMatrixValue: matrix atRow: r atColumn: c - 1)
				+ self insertionY.
			distance := (m1 min: m2) min: m3.

			"pointer"
			pointer := nil.
			pointer := distance = m1
				ifTrue: [ {(r - 1).
					(c - 1).
					(self x at: r - 1).
					(self y at: c - 1)} ]
				ifFalse: [ distance = m2
						ifTrue: [ {(r - 1).
							c.
							(self x at: r - 1).
							(self y at: c - 1)}	"deletion" ]
						ifFalse: [ {r.
							(c - 1).
							(self x at: r - 1).
							(self y at: c - 1)}	"insertion" ] ].

			" save values "
			value := self
				m1: m1
				m2: m2
				m3: m3
				value: distance
				pointer: pointer.
			matrix at: r at: c put: value ] ].
	^ matrix
]

{ #category : #private }
LevDistance >> rawMatrix: aMatrix atRow: xInteger atColumn: yInteger [
	 ^ aMatrix at: xInteger at: yInteger
]

{ #category : #private }
LevDistance >> rawMatrixArray: aMatrix atRow: xInteger atColumn: yInteger [
	 ^ (self rawMatrix: aMatrix atRow: xInteger atColumn: yInteger) first
]

{ #category : #private }
LevDistance >> rawMatrixPointer: aMatrix atRow: xInteger atColumn: yInteger [
	 ^ (self rawMatrix: aMatrix atRow: xInteger atColumn: yInteger) at: 2
]

{ #category : #private }
LevDistance >> rawMatrixValue: aMatrix atRow: xInteger atColumn: yInteger [
	 ^ (self rawMatrix: aMatrix atRow: xInteger atColumn: yInteger) last
]

{ #category : #representing }
LevDistance >> streamComplexCostMatrix: aStream [
	| matrix |
	matrix := self rawCostMatrix.
	self streamMatrix: aStream.
	1 to: matrix rowCount do: [ :r |
		1 to: matrix columnCount do: [ :c |
			aStream nextPutAll: (self rawMatrixArray: matrix atRow: r atColumn: c) asString.
			aStream nextPut: Character space.
			aStream nextPutAll: (self rawMatrixValue: matrix atRow: r atColumn: c) asString.
			aStream nextPut: Character tab.].
		aStream nextPut: Character cr.]
]

{ #category : #representing }
LevDistance >> streamCostMatrix: aStream [
	| matrix |
	matrix := self rawCostMatrix.
	self streamMatrix: aStream.
	1 to: matrix rowCount do: [ :r | 
		1 to: matrix columnCount do: [ :c | 
			aStream
				nextPutAll: (matrix at: r at: c) asString;
				tab ].
		aStream nextPut: Character cr ]
]

{ #category : #representing }
LevDistance >> streamMatrix: aStream [

	aStream
		nextPutAll: 'x:';
		nextPutAll: self x;
		nextPutAll: ' y:';
		nextPutAll: self y;
		nextPutAll: ' costs:';
		nextPutAll: self operationCosts asString.
	aStream nextPut: Character cr
]

{ #category : #representing }
LevDistance >> streamPointers: aStream [
	| matrix |
	matrix := self rawCostMatrix.
	self streamMatrix: aStream.
	1 to: matrix rowCount do: [ :r |
		1 to: matrix columnCount do: [ :c |
			aStream nextPutAll: (self rawMatrixPointer: matrix atRow: r atColumn: c) asString.
			aStream nextPut: Character tab.].
		aStream nextPut: Character cr.]
]

{ #category : #representing }
LevDistance >> streamSimpleCostMatrix: aStream [
	| matrix |
	matrix := self rawCostMatrix.
	self streamMatrix: aStream.
	1 to: matrix rowCount do: [ :r |
		1 to: matrix columnCount do: [ :c |
			aStream nextPutAll: (self rawMatrixValue: matrix atRow: r atColumn: c) asString.
			aStream nextPut: Character tab.].
		aStream nextPut: Character cr.]
]

{ #category : #costs }
LevDistance >> substitutionXX [
	^ self operationCosts at: 1.
]

{ #category : #costs }
LevDistance >> substitutionXY [
	^ self operationCosts at: 3.
]

{ #category : #costs }
LevDistance >> substitutionYX [
	^ self operationCosts at: 4.
]

{ #category : #costs }
LevDistance >> substitutionYY [
	^ self operationCosts at: 2.
]

{ #category : #transcripting }
LevDistance >> transcript: aSelectorReturningaStream [
	self perform: aSelectorReturningaStream with: Transcript.
	Transcript flush.
]

{ #category : #validating }
LevDistance >> validateOperationCosts: anArray [
	anArray size = self class defaultOperationCosts size
		ifFalse: [ ^ false ].
	^ anArray allSatisfy: [ :each | each asInteger isInteger ]
]

{ #category : #accessing }
LevDistance >> x [ 
	^ x
]

{ #category : #accessing }
LevDistance >> x: aString [
	x := aString
]

{ #category : #accessing }
LevDistance >> y [
	^ y
]

{ #category : #accessing }
LevDistance >> y: aString [
	y := aString
]
