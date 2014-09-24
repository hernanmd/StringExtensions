*StringExtensions
isZipped
	" Answer <true> if receiver conforms to GZIP file format "

	^ (self first: 2) asByteArray = GZipConstants gzipMagic asByteArray reverse