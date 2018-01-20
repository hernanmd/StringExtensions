benchmarking
benchLevPW100kWith

	(self readWordsFile: self words100kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceWith: wordB ]