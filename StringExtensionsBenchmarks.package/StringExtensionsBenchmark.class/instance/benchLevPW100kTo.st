benchmarking
benchLevPW100kTo

	(self readWordsFile: self words100kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceTo: wordB ]