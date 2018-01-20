*StringExtensionsTests
testIsXML

	self deny: '3333' isXML.
	self assert: '<?xml' isXML.
	self assert: '<?xml version="1.0"?>
<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "NCBI_BlastOutput.dtd">' isXML.
	self deny: '' isXML.
	self deny: 'abc567' isXML.