benchmarking
benchLevPW1kLD

	(self readWordsFile: self words1kFile) pairsDo: [ : wordA : wordB | 
		(LevDistance onX: wordA onY: wordB) distance ]