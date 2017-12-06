benchmarking
benchLevPW100kToLD

	(self readWordsFile: 'words.txt') pairsDo: [ : wordA : wordB | 
		(LevDistance onX: wordA onY: wordB) distance ]