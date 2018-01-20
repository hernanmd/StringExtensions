*StringExtensions
isXML
	" Only answer <true> when the receiver's contents *looks like* XML, not performing any validity check.
	Yes, I know... "
	
	^ self beginsWith: '<?xml'