*StringExtensionsTests
testIndicesOfSubstring

	self assert: ('NNNN' indicesOfSubstring: 'NN') asArray equals: #(1 2 3).
	self assert: ('GATATATGCATATACTT' indicesOfSubstring: 'ATAT') asArray equals: #(2 4 10).
	self assert: ('TTTTACACTTTTTTGTGTAAAAA' indicesOfSubstring: 'ACAC') asArray equals: #(5).
	self assert: ('AAAGAGTGTCTGATAGCAGCTTCTGAACTGGTTACCTGCCGTGAGTAAATTAAATTTTATTGACTTAGGTCACTAAATACTTTAACCAATATAGGCATAGCGCACAGACAGATAATAATTACAGAGTACACAACATCCAT' indicesOfSubstring: 'AAA') asArray equals: #(1 47 52 75).
	self assert: ('AGCGTGCCGAAATATGCCGCCAGACCTGCTGCGGTGGCCTCGCCGACTTCACGGATGCCAAGTGCATAGAGGAAGCGAGCAAAGGTGGTTTCTTTCGCTTTATCCAGCGCGTTAACCACGTTCTGTGCCGACTTT' indicesOfSubstring: 'TTT') asArray equals: #(89 93 99 133).
	self assert: ('ATATATA' indicesOfSubstring: 'ATA') asArray equals: #(1 3 5).

	
	
	
	
	