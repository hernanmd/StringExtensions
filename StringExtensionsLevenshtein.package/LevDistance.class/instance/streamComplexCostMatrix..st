representing
streamComplexCostMatrix: aStream
	| matrix |
	matrix := self rawCostMatrix.
	self streamMatrix: aStream.
	1 to: matrix rowCount do: [ :r |
		1 to: matrix columnCount do: [ :c |
			aStream nextPutAll: (self rawMatrixArray: matrix atRow: r atColumn: c) asString.
			aStream nextPut: Character space.
			aStream nextPutAll: (self rawMatrixValue: matrix atRow: r atColumn: c) asString.
			aStream nextPut: Character tab.].
		aStream nextPut: Character cr.]