benchmarking
benchLevPW100kTo

	(self readWordsFile: 'words.txt') pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceTo: wordB ]