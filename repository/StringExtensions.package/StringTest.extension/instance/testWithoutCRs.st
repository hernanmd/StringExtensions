*StringExtensions
testWithoutCRs

	self assert: '3333' withoutCRs = '3333'.
	self assert: '
	aaaa' withoutCRs = '	aaaa'.
	self assert: '
	aaaa
	' withoutCRs = '	aaaa	'.
	self assert: '
' withoutCRs = ''.