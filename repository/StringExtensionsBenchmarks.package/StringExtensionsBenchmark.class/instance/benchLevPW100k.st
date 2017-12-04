benchmarking
benchLevPW100k

	(self readWordsFile: 'words.txt') pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceTo: wordB ]