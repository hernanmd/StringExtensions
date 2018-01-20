benchmarking
benchLevPW100k

	(self readWordsFile: self words100kFile) pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistance: wordB ]