distance
rawCostMatrix
	| matrix |
	matrix := self emptyMatrix.
	2 to: matrix rowCount do: [ :r | 
		2 to: matrix columnCount do: [ :c | 
			| m1 m2 m3 distance value pointer |
			"values"
			m1 := self rawMatrixValue: matrix atRow: r - 1 atColumn: c - 1.
			(self x at: r - 1) = (self y at: c - 1)
				ifFalse: [ m1 := m1 + self substitutionXY ].
			m2 := (self rawMatrixValue: matrix atRow: r - 1 atColumn: c)
				+ self deletionX.
			m3 := (self rawMatrixValue: matrix atRow: r atColumn: c - 1)
				+ self insertionY.
			distance := (m1 min: m2) min: m3.

			"pointer"
			pointer := nil.
			pointer := distance = m1
				ifTrue: [ {(r - 1).
					(c - 1).
					(self x at: r - 1).
					(self y at: c - 1)} ]
				ifFalse: [ distance = m2
						ifTrue: [ {(r - 1).
							c.
							(self x at: r - 1).
							(self y at: c - 1)}	"deletion" ]
						ifFalse: [ {r.
							(c - 1).
							(self x at: r - 1).
							(self y at: c - 1)}	"insertion" ] ].

			" save values "
			value := self
				m1: m1
				m2: m2
				m3: m3
				value: distance
				pointer: pointer.
			matrix at: r at: c put: value ] ].
	^ matrix