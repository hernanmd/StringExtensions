*StringExtensionsTests
testShingle

	self assertCollection: ('abcdabd' shingle: 2) hasSameElements: { 'ab' . 'bc' . 'cd' . 'da' . 'bd' }.
	self assertCollection: ('process' shingle: 2) hasSameElements: { 'pr' . 'ro' . 'oc' . 'ce' . 'es' . 'ss' }.
	
