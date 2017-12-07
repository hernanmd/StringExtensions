benchmarking
benchLevPW100kFrom

	(self readWordsFile: self words100kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceFrom: wordB ]