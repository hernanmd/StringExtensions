*StringExtensions
indexesOfMotif: motif
	" Answer a <Collection> of indexes of a motif in a string. Based in the Phonetix implementation "
	
	| indexes pos |
	indexes := OrderedCollection new.
	pos := 1.
	[ | index |		
		((index := self indexOfSubCollection: motif startingAt: pos) > 0) 
			ifTrue: [ 
				indexes add: index.
				pos := index + motif size ].
				(index ~= 0 and: [ pos <= (self size - motif size) ])
	] whileTrue.
	^ indexes