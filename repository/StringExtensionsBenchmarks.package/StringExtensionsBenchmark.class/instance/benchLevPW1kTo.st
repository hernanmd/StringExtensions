benchmarking
benchLevPW1kTo

	(self readWordsFile: self words1kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceTo: wordB ]