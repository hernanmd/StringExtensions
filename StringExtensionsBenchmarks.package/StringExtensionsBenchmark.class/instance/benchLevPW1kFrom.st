benchmarking
benchLevPW1kFrom

	(self readWordsFile: self words1kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceFrom: wordB ]