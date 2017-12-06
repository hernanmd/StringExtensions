benchmarking
benchLevPW100kWith

	(self readWordsFile: 'words.txt') pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceWith: wordB ]