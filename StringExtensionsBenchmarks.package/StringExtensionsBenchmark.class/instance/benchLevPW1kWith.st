benchmarking
benchLevPW1kWith

	(self readWordsFile: self words1kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceWith: wordB ]