benchmarking
benchLevPW1kWith

	(self readWordsFile: 'words1000.txt') pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceWith: wordB ]