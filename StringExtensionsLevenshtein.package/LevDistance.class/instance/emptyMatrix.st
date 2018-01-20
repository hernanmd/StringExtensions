initializing
emptyMatrix
	| matrix |

	matrix := Matrix rows: (self x size + 1) columns: (self y size + 1).

	matrix at: 1 at: 1 put: (self m1: 0 m2: 0 m3: 0 value: 0).
	2 to: (matrix rowCount) do: [ :index | 
		matrix at: index at: 1 put: 
			(self m1: 0 m2: 0 m3: 0 value: ((matrix at: index-1 at: 1) last + self deletionX)) ].
	2 to: (matrix columnCount) do: [ :index | 
		matrix at: 1 at: index put:
			(self m1: 0 m2: 0 m3: 0 value: ((matrix at: 1 at: index-1) last + self insertionY)) ].

	^ matrix