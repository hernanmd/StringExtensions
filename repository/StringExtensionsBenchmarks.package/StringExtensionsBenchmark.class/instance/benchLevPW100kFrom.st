benchmarking
benchLevPW100kFrom

	(self readWordsFile: 'words.txt') pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceFrom: wordB ]