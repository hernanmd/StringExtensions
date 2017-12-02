*StringExtensions
testWithoutCRs

	self assert: '3333' withoutCRs equals: '3333'.
	self assert: '
	aaaa' withoutCRs equals: '	aaaa'.
	self assert: '
	aaaa
	' withoutCRs equals: '	aaaa	'.
	self assert: '
' withoutCRs equals: ''.