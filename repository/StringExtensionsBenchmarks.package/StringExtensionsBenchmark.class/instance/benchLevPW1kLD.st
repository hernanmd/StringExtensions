benchmarking
benchLevPW1kLD

	(self readWordsFile: 'words1000.txt') pairsDo: [ : wordA : wordB | 
		(LevDistance onX: wordA onY: wordB) distance ]