benchmarking
benchLevPW1kTo

	(self readWordsFile: 'words1000.txt') pairsDo: [ : wordA : wordB | 
		wordA levenshteinDistanceTo: wordB ]