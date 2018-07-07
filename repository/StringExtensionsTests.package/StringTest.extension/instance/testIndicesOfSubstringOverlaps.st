*StringExtensionsTests
testIndicesOfSubstringOverlaps

	self assert: ('NNNN' indicesOfSubstringOverlaps: 'NN') asArray equals: #(1 3).
	self assert: ('GATATATGCATATACTT' indicesOfSubstringOverlaps: 'ATAT') asArray equals: #(2 4 10).
	self assert: ('TTTTACACTTTTTTGTGTAAAAA' indicesOfSubstringOverlaps: 'ACAC') asArray equals: #(5).
	self assert: ('AAAGAGTGTCTGATAGCAGCTTCTGAACTGGTTACCTGCCGTGAGTAAATTAAATTTTATTGACTTAGGTCACTAAATACTTTAACCAATATAGGCATAGCGCACAGACAGATAATAATTACAGAGTACACAACATCCAT' indicesOfSubstringOverlaps: 'AAA') asArray equals: #(1 47 52 75).
	self assert: ('AGCGTGCCGAAATATGCCGCCAGACCTGCTGCGGTGGCCTCGCCGACTTCACGGATGCCAAGTGCATAGAGGAAGCGAGCAAAGGTGGTTTCTTTCGCTTTATCCAGCGCGTTAACCACGTTCTGTGCCGACTTT' indicesOfSubstringOverlaps: 'TTT') asArray equals: #(89 93 99 133).
	self assert: ('ATATATA' indicesOfSubstringOverlaps: 'ATA') asArray equals: #(1 3 5).

	
	
	
	
	