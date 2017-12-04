benchmarking
benchLevPW1k

	(self readWordsFile: 'words1000.txt') pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceTo: wordB ]