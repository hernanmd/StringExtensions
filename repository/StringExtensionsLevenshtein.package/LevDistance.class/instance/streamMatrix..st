representing
streamMatrix: aStream

	aStream
		nextPutAll: 'x:';
		nextPutAll: self x;
		nextPutAll: ' y:';
		nextPutAll: self y;
		nextPutAll: ' costs:';
		nextPutAll: self operationCosts asString.
	aStream nextPut: Character cr