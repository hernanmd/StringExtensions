Class {
	#name : #StringExtensionsBenchmark,
	#superclass : #Object,
	#instVars : [
		'wordsFile1k',
		'wordsFile100k'
	],
	#category : #'StringExtensionsBenchmarks-Core'
}

{ #category : #benchmarking }
StringExtensionsBenchmark >> benchLevPW100k [

	(self readWordsFile: self words100kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistance: wordB ]
]

{ #category : #benchmarking }
StringExtensionsBenchmark >> benchLevPW100kFrom [

	(self readWordsFile: self words100kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceFrom: wordB ]
]

{ #category : #benchmarking }
StringExtensionsBenchmark >> benchLevPW100kTo [

	(self readWordsFile: self words100kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceTo: wordB ]
]

{ #category : #benchmarking }
StringExtensionsBenchmark >> benchLevPW100kToLD [

	(self readWordsFile: self words100kFile) pairsDo: [ : wordA : wordB | 
		(LevDistance onX: wordA onY: wordB) distance ]
]

{ #category : #benchmarking }
StringExtensionsBenchmark >> benchLevPW100kWith [

	(self readWordsFile: self words100kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceWith: wordB ]
]

{ #category : #benchmarking }
StringExtensionsBenchmark >> benchLevPW1k [

	(self readWordsFile: self words1kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistance: wordB ]
]

{ #category : #benchmarking }
StringExtensionsBenchmark >> benchLevPW1kFrom [

	(self readWordsFile: self words1kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceFrom: wordB ]
]

{ #category : #benchmarking }
StringExtensionsBenchmark >> benchLevPW1kLD [

	(self readWordsFile: self words1kFile) pairsDo: [ : wordA : wordB | 
		(LevDistance onX: wordA onY: wordB) distance ]
]

{ #category : #benchmarking }
StringExtensionsBenchmark >> benchLevPW1kTo [

	(self readWordsFile: self words1kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceTo: wordB ]
]

{ #category : #benchmarking }
StringExtensionsBenchmark >> benchLevPW1kWith [

	(self readWordsFile: self words1kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceWith: wordB ]
]

{ #category : #initialize }
StringExtensionsBenchmark >> initialize [ 

	" Download word files "
	BaselineOfStringExtensions new preLoad.
]

{ #category : #private }
StringExtensionsBenchmark >> readWordsFile: aFilename [
	" Answer a <Collection> with words to be used in the benchmark "
	
	^ aFilename asFileReference contents lines

]

{ #category : #private }
StringExtensionsBenchmark >> words100kFile [

	^ 'words.txt'
]

{ #category : #private }
StringExtensionsBenchmark >> words1kFile [

	^ 'words1000.txt'
]
