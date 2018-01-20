private
readWordsFile: aFilename
	" Answer a <Collection> with words to be used in the benchmark "
	
	^ aFilename asFileReference contents lines
