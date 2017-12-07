benchmarking
benchLevPW1k

	(self readWordsFile: self words1kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistance: wordB ]