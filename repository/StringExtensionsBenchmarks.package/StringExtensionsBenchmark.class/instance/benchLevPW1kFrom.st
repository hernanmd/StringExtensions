benchmarking
benchLevPW1kFrom

	(self readWordsFile: 'words1000.txt') pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceFrom: wordB ]