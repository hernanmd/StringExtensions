tests
testDistanceByPrototypes
	| ld |
	ld := LevDistance onX: 'ababbb' onY: 'babaaa' withCosts: { 0. 0. 2. 2. 1. 1. 1. 1. }.
	self assert: ld asSimpleDistanceMatrix asArray equals: #(0 1 2 3 4 5 6 1 2 1 2 3 4 5 2 1 2 1 2 3 4 3 2 1 2 1 2 3 4 3 2 1 2 3 4 5 4 3 2 3 4 5 6 5 4 3 4 5 6).
	self assert: ld distance equals: 6.

	ld := LevDistance onX: 'cbaba' onY: 'abbabca' withCosts: { 0. 0. 1. 1. 1. 1. 1. 1. }.
	self assert: ld asSimpleDistanceMatrix asArray equals: #(0 1 2 3 4 5 6 7 1 1 2 3 4 5 5 6 2 2 1 2 3 4 5 6 3 2 2 2 2 3 4 5 4 3 2 2 3 2 3 4 5 4 3 3 2 3 3 3).
	self assert: ld distance equals: 3.
	