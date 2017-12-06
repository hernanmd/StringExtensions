instance creation
defaultOperationCosts
	" costs for A->B substitution, ->A insertion. A-> deletion "
	" { X->X, Y->Y. X->Y. Y-X. ->X. ->Y. X->. Y->. } "
	^ { 0. 0. 1. 1. 1. 1. 1. 1. }