doits
platformFilesUrl
	" Private - See superimplementor's comment "

	^ Array with: (String streamContents: [ : stream |		
		stream 			
			nextPutAll: 'https://github.com/hernanmd/StringExtensions/raw/master/';
			nextPutAll: (
				Smalltalk os isWin32 					
					ifTrue: [ 'words.zip' ]
					ifFalse: [ 'words.tar.gz' ]) ])