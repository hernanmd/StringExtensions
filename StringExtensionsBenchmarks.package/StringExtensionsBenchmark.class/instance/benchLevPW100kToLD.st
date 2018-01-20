benchmarking
benchLevPW100kToLD

	(self readWordsFile: self words100kFile) pairsDo: [ : wordA : wordB | 
		(LevDistance onX: wordA onY: wordB) distance ]