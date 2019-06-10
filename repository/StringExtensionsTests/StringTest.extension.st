Extension { #name : #StringTest }

{ #category : #'*StringExtensionsTests' }
StringTest >> testAsCondensedString [

	self assert: '  spaced-text   ' asCondensedString equals: 'spaced-text'.
	self deny: '

spaced text  ' asCondensedString = 'spaced-text'
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testAsFloat [

	self assert: '3' asFloat equals: 3.0.
	self should: [ 'a' asFloat ] raise: Error.
	self should: [ '' asFloat ] raise: Error.
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testBeginsWithOr [

	self assert: ('estudiantes' beginsWith: 'estu' or: 'campeon').
	self assert: ('estudiantes' beginsWith: 'campeon' or: 'est').
	self deny: ('estudiantes' beginsWith: 'subcampeon' or: 'amarg').
	
	self deny: ('' beginsWith: '' or: '').
	self deny: ('' beginsWith: 'test' or: '').
	self deny: ('' beginsWith: '' or: 'test').
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testCopyUpToStartParenthesis [

	self assert: 'this is a (test) followed by text' copyUpToStartParenthesis equals: 'this is a'.
	self assert: 'this is a' copyUpToStartParenthesis equals: 'this is a'.
	self assert: '' copyUpToStartParenthesis equals: ''.
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testHammingDistanceTo [

	self assert: ('AAAA' hammingDistanceTo: 'TTTT') equals: 4.
	self assert: ('ACGTACGT' hammingDistanceTo: 'TACGTACG') equals: 8.
	self assert: ('ACGTACGT' hammingDistanceTo: 'CCCCCCCC') equals: 6.
	self assert: ('ACGTACGT' hammingDistanceTo: 'TGCATGCA') equals: 8.
	self assert: ('GATAGCAGCTTCTGAACTGGTTACCTGCCGTGAGTAAATTAAAATTTTATTGACTTAGGTCACTAAATACT' hammingDistanceTo: 'AATAGCAGCTTCTCAACTGGTTACCTCGTATGAGTAAATTAGGTCATTATTGACTCAGGTCACTAACGTCT') equals: 15.
	self assert: ('AGAAACAGACCGCTATGTTCAACGATTTGTTTTATCTCGTCACCGGGATATTGCGGCCACTCATCGGTCAGTTGATTACGCAGGGCGTAAATCGCCAGAATCAGGCTG' hammingDistanceTo: 'AGAAACCCACCGCTAAAAACAACGATTTGCGTAGTCAGGTCACCGGGATATTGCGGCCACTAAGGCCTTGGATGATTACGCAGAACGTATTGACCCAGAATCAGGCTC') equals: 28.
	self assert: ('ATCGGTCAGTTGATTACGCAGGGCGTAAATC' hammingDistanceTo: 'AGGCCTTGGATGATTACGCAGAACGTATTGA') equals: 13.
	self assert: ('TTATCTCGTCACCGGGATATTGCGGCCACTCATCGGTCAGTTGATTACGCAGGGCGTAAATCGCCAGAATCAGGCTG' hammingDistanceTo: 'TAGTCAGGTCACCGGGATATTGCGGCCACTAAGGCCTTGGATGATTACGCAGAACGTATTGACCCAGAATCAGGCTC') equals: 20.
	self assert: ('CCGAAGCAATTGAAACCCCCCCGGCCTGGGAGGCGCAAAAATCTGACCTCTTTGTGAGTTGACCACTTAATTTATGTCTGACCACGAGAAGGGCTACTGATTTGGTACGTCGGGTCATGACCCCCAGTTCTTAGCCGCCTGCTCCAATCTCTGACTTGTTTATCGAGGGGATGGAGTAACGAAATGCGATTCGCCCGCTCAGGCCAAGGTATATATTTGAGTAGCGGAAGGTTGCACTACCTACAACCACGGCACACCGGCACGTTGTCGTGCCCTGGCGGCCTGCGCACTTTCGCCACTGTCAAGTACGACTTCCCAAGCTCAACCAACATTCATAATCCGGTGCAATTCATACCGTATCATCGTGCTATAAGCGACGCCGATTCTCGGGGCCTGATAATTGAGACTGGACTACATAGTGGGTGCCCTCTCTGCGAGTAAGTGACGGAACAACGGAGATCAGGGACCAAATGGTAGCAAAACAGATCGAGGTACACGCAGGTAGCTGTCCGTGGAGTAGACCGCGCTTAGCGTCTGTTAGAGTATCATCGGGGTATTAGACACAGGAACCTCTATGCTGTTAAAAGGCCATACCCCGTAATTGTGCAAATTTGTTACGTTCAAATCTACGCAGTGAGGGTCCTAAGGTGATGGCAGGGATTGGAACTTCTCCGCTGGCTCTTAGATTACTTAGCCAGTCTACCCTCGAAGATACAAATCCTTCCACCAGAGGGAGCTCATTGAAATTCATTCCATGCTACTCGACCGCGCGTATGGGTGCGGGGCTCTATGGGATCTAACTCGATCCTTCAGAGTCCTTATTCAAATGCATTTCCGTCCCCGTATGTTTCGACGAAGCCGAAGCCCAAACCCTGGGATGGACGAATTAAGGACAGTACAGGCAATAGTGTTCTCCCATACTCGGAACAGACGCCTCATTTTTTCGCGAAATCGATCTGGGTTGGAAGAAGTTCCAGTGCAGAGTTCCTATCACACAATTCGTTCTCGGGGCTTCCGGCCCATAAGCGATACTACTGTCTTTGCGAGCTAACGATTACATTCGGGGGAACTTAGCTCGGACTGGACCAGGTACATGATCCAAAGCGCGATGTCTGTCTGTTACCCTCACCGCCGCTCTTTTATCGGGTA' hammingDistanceTo: 'GCGTAGTAGGTTCGCGTACCTAGTTCCGCCGAAAAGACAAAGGAGAAGGGAATGCTCCTAGTAGTTTCAGTCTAGCAAACATGTTATAACGCTAACTGTGTGCTGCAAAAAGGATTTGAACCCAAATTTTAAAGCGCTGATCGACAGAACGCTGTTGAAGAGGCGATGGTACTGAGATTCCCCAGAAACCACCTCCGCGCTATGTGCTCAAGACAACCCGCATTCGTTTTTACTAGATTTGGAGCCGAGTTGTGATTTGGATATTTTCACATAAGACCGAGCAGGAAATATACCTTGTTGCAGCTATTGACCCCGTTCTCTCGGAAATCCATGGAATAGTCTTCGGATATTCGTACCAATGGGCGCGATGTTGCGATAAGAGAGCACATTTCATTAAGTGGTGCTCCGCCGCTAAGATGGGAAGGGGCGAGTCTATCGCAGCATCGAAGGCTGAGTTGGCCATTGCCGAGAGTATACATATTTACGATCACACTCGCATAGTCCCACGCATTACGTCCGAGATAGTATGTCCCAATGCAACCTAAAGCCGCGAGATTCCCTAAGGAGAAAATTAAACACTGGAAATTAGGTGATGCTACATCCCATGGACACTTTCGGAACAATATCGGTGACACACATCATCCGTGATCCCGTGATATTTCATCCATGGAGAGAGTATGGTTTTACTACACCTGGTCTAGGCCAAGCCTAACCCCCTGTTCATCCGTTTTATACGAGTATTACCTTGACGACCATAGAGGATAGACTCGGTATCCCGCACACTCTACACACACGACTTAATCCGCTCCACGACCTTCCTAGCGATCTTTGGCGCAGCCGGTTCGCGTATTTTACGACCAACTCGATGGATCCCAATTATCCCCCTGGTAGTGCCCCTCCGCCTGAGAATTCGACGGGCGAGGTCCGGGGGACCGACATAGAGTGGAATGCTTCTTTCCGGGATAACACGTGATTGACATAAAAATGTAGGGCAGATAGGCATCGTTAGCACCTCTCTCCTTGCTGCACTGCGTTTATCGATCGAATTCAAGACTTGTGCATGTTGAAAACAACCTCGCGTTATCCCTGCTATTTGCTTCAGAGCCGTAGGAGGGGACCATGCGTGAGTCCTCCTGAGCAACCTCAATT') equals: 844.
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testIncludesBeginWith [

	self assert: ('Rose is a rose of splendor' includesBeginWith: 'rose').
	self assert: ('Rose is a rose of splendor' includesBeginWith: 'Rose').
	self assert: ('Rose is a rose of splendor' includesBeginWith: 'ROSE').
	self assert: ('Raise the art to resistance' includesBeginWith: 'resist').
	self assert: ('Danger dare to be grand' includesBeginWith: 'dare').
	self deny: ('' includesBeginWith: 'dare').
	self deny: ('' includesBeginWith: '').
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testIncludesEndsWith [

	self assert: ('Rose is a rose of splendor' includesEndsWith: 'splendor').
	self assert: ('Rose is a rose of splendor' includesEndsWith: 'Splendor').
	self assert: ('Rose is a rose of splendor' includesEndsWith: 'SPLENDOR').
	self assert: ('Raise the art to resistance' includesEndsWith: 'tance').
	self assert: ('Danger dare to be grand' includesEndsWith: 'and').
	self deny: ('' includesEndsWith: 'dare').
	self deny: ('' includesEndsWith: '').
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testIndicesOfCharacter [

	self assert: ('estudiantes' indicesOfCharacter: $e) asArray equals: #(1 10).
	self assert: ('estudiantes' indicesOfCharacter: $z) isEmpty.
	self assert: ('' indicesOfCharacter: $a) isEmpty.
	self assert: ('' indicesOfCharacter: Character space) isEmpty.

]

{ #category : #'*StringExtensionsTests' }
StringTest >> testIndicesOfSubstring [

	self assert: ('NNNN' indicesOfSubstring: 'NN') asArray equals: #(1 2 3).
	self assert: ('GATATATGCATATACTT' indicesOfSubstring: 'ATAT') asArray equals: #(2 4 10).
	self assert: ('TTTTACACTTTTTTGTGTAAAAA' indicesOfSubstring: 'ACAC') asArray equals: #(5).
	self assert: ('AAAGAGTGTCTGATAGCAGCTTCTGAACTGGTTACCTGCCGTGAGTAAATTAAATTTTATTGACTTAGGTCACTAAATACTTTAACCAATATAGGCATAGCGCACAGACAGATAATAATTACAGAGTACACAACATCCAT' indicesOfSubstring: 'AAA') asArray equals: #(1 47 52 75).
	self assert: ('AGCGTGCCGAAATATGCCGCCAGACCTGCTGCGGTGGCCTCGCCGACTTCACGGATGCCAAGTGCATAGAGGAAGCGAGCAAAGGTGGTTTCTTTCGCTTTATCCAGCGCGTTAACCACGTTCTGTGCCGACTTT' indicesOfSubstring: 'TTT') asArray equals: #(89 93 99 133).
	self assert: ('ATATATA' indicesOfSubstring: 'ATA') asArray equals: #(1 3 5).

	
	
	
	
	
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testIndicesOfSubstringMismatches [

	self assert: ('CGCCCGAATCCAGAACGCATTCCCATATTTCGGGACCACTGGCCTCCACGGTACGGACGTCAATCAAAT' indicesOfSubstring: 'ATTCTGGA' mismatches: 3) asArray equals: #(7 8 27 28).
	self assert: ('TTTTTTAAATTTTAAATTTTTT' indicesOfSubstring: 'AAA' mismatches: 2) asArray equals: #(5 6 7 8 9 12 13 14 15 16).
	self assert: ('GAGCGCTGGGTTAACTCGCTACTTCCCGACGAGCGCTGTGGCGCAAATTGGCGATGAAACTGCAGAGAGAACTGGTCATCCAACTGAATTCTCCCCGCTATCGCATTTTGATGCGCGCCGCGTCGATT' indicesOfSubstring: 'GAGCGCTGG' mismatches: 2) asArray equals: #(1 31 67).
	self assert: ('CCAAATCCCCTCATGGCATGCATTCCCGCAGTATTTAATCCTTTCATTCTGCATATAAGTAGTGAAGGTATAGAAACCCGTTCAAGCCCGCAGCGGTAAAACCGAGAACCATGATGAATGCACGGCGATTGCGCCATAATCCAAACA' indicesOfSubstring: 'AATCCTTTCA' mismatches: 3) asArray equals: #(4 37 75 138).
	self assert: ('CCGTCATCCGTCATCCTCGCCACGTTGGCATGCATTCCGTCATCCCGTCAGGCATACTTCTGCATATAAGTACAAACATCCGTCATGTCAAAGGGAGCCCGCAGCGGTAAAACCGAGAACCATGATGAATGCACGGCGATTGC' indicesOfSubstring: 'CCGTCATCC' mismatches: 3) asArray equals: #(1 8 37 45 49 73 80 113).
	self assert: ('AAAAAA' indicesOfSubstring: 'TTT' mismatches: 3) asArray equals: #(1 2 3 4).

	
	
	
	
	
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testIndicesOfSubstringOverlaps [

	self assert: ('NNNN' indicesOfSubstringOverlaps: 'NN') asArray equals: #(1 3).
	self assert: ('GATATATGCATATACTT' indicesOfSubstringOverlaps: 'ATAT') asArray equals: #(2 4 10).
	self assert: ('TTTTACACTTTTTTGTGTAAAAA' indicesOfSubstringOverlaps: 'ACAC') asArray equals: #(5).
	self assert: ('AAAGAGTGTCTGATAGCAGCTTCTGAACTGGTTACCTGCCGTGAGTAAATTAAATTTTATTGACTTAGGTCACTAAATACTTTAACCAATATAGGCATAGCGCACAGACAGATAATAATTACAGAGTACACAACATCCAT' indicesOfSubstringOverlaps: 'AAA') asArray equals: #(1 47 52 75).
	self assert: ('AGCGTGCCGAAATATGCCGCCAGACCTGCTGCGGTGGCCTCGCCGACTTCACGGATGCCAAGTGCATAGAGGAAGCGAGCAAAGGTGGTTTCTTTCGCTTTATCCAGCGCGTTAACCACGTTCTGTGCCGACTTT' indicesOfSubstringOverlaps: 'TTT') asArray equals: #(89 93 99 133).
	self assert: ('ATATATA' indicesOfSubstringOverlaps: 'ATA') asArray equals: #(1 3 5).

	
	
	
	
	
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testIsAllLetters [

	self deny: '3333' isAllLetters.
	self assert: 'aaaa' isAllLetters.
	self deny: '' isAllLetters.
	self deny: 'abc567' isAllLetters.
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testIsNumeric [

	self assert: '3333' isNumeric.
	self deny: 'aaaa' isNumeric.
	self deny: '' isNumeric.
	self deny: 'abc567' isNumeric.
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testIsXML [

	self deny: '3333' isXML.
	self assert: '<?xml' isXML.
	self assert: '<?xml version="1.0"?>
<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "NCBI_BlastOutput.dtd">' isXML.
	self deny: '' isXML.
	self deny: 'abc567' isXML.
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testLevenshteinDistanceTo [

	self assert: ('apple' levenshteinDistanceTo: 'map') equals: 4.
	self assert: ('this is a test' levenshteinDistanceTo: 'this is a test') equals: 0.
	self assert: ('this ain''t no test' levenshteinDistanceTo: 'this is a test') equals: 6.
	self assert: ('dog' levenshteinDistanceTo: 'dogs') equals: 1.
	self assert: ('puppy' levenshteinDistanceTo: 'lucky') equals: 3.
	self assert: ('matrix' levenshteinDistanceTo: 'xxxmatr') equals: 5.
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testLowercaseFirstLetter [

	self assert: '3333' lowercaseFirstLetter equals: '3333'.
	self assert: '<?xml' lowercaseFirstLetter equals: '<?xml'.
	self assert: 'ABc567' lowercaseFirstLetter equals: 'aBc567'.
	self assert: 'aaaaa' lowercaseFirstLetter equals: 'aaaaa'.	
	self assert: '' lowercaseFirstLetter equals: ''.
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testShingle [

	self assertCollection: ('abcdabd' shingle: 2) hasSameElements: { 'ab' . 'bc' . 'cd' . 'da' . 'bd' }.
	self assertCollection: ('process' shingle: 2) hasSameElements: { 'pr' . 'ro' . 'oc' . 'ce' . 'es' . 'ss' }.
	

]

{ #category : #'*StringExtensionsTests' }
StringTest >> testShingleWords [

	| gertrudeText |
	
	gertrudeText := 'a rose is a rose is a rose'.
	self assertCollection: (gertrudeText shingleWords: 4) hasSameElements: 
		#(
			#('a' 'rose' 'is' 'a') 
			#('rose' 'is' 'a' 'rose') 
			#('is' 'a' 'rose' 'is') 
			#('a' 'rose' 'is' 'a') 
			#('rose' 'is' 'a' 'rose')).
	self assertCollection: (gertrudeText shingleWords: 2) hasSameElements: 
		#(
			 #('a' 'rose') 
			#('rose' 'is') 
			#('is' 'a') 
			#('a' 'rose') 
			#('rose' 'is') 
			#('is' 'a') 
			#('a' 'rose')).

]

{ #category : #'*StringExtensionsTests' }
StringTest >> testWithoutBlanks [

	self assert: '3333' withoutBlanks equals: '3333'.
	self assert: 'aa aa' withoutBlanks equals: 'aaaa'.
	self assert: 'aaaa ' withoutBlanks equals: 'aaaa'.
	self assert: ' aaaa' withoutBlanks equals: 'aaaa'.	
	self assert: '' withoutBlanks equals: ''.
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testWithoutCRs [

	self assert: '3333' withoutCRs equals: '3333'.
	self assert: '
	aaaa' withoutCRs equals: '	aaaa'.
	self assert: '
	aaaa
	' withoutCRs equals: '	aaaa	'.
	self assert: '
' withoutCRs equals: ''.
]

{ #category : #'*StringExtensionsTests' }
StringTest >> testWithoutNumbers [

	self assert: '3333' withoutNumbers equals: ''.
	self assert: 'aaaa' withoutNumbers equals: 'aaaa'.
	self assert: 'aaa1234' withoutNumbers equals: 'aaa'.
	self assert: '' withoutNumbers equals: ''.
]
