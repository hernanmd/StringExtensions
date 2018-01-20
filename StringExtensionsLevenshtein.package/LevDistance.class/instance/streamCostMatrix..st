representing
streamCostMatrix: aStream
	| matrix |
	matrix := self rawCostMatrix.
	self streamMatrix: aStream.
	1 to: matrix rowCount do: [ :r | 
		1 to: matrix columnCount do: [ :c | 
			aStream
				nextPutAll: (matrix at: r at: c) asString;
				tab ].
		aStream nextPut: Character cr ]