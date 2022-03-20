
# Table of Contents

- [Description](#description)
- [Installation](#installation)
  - [Install from CLI](#install-from-cli)
  - [Install from Pharo](#install-from-pharo)
  - [Baseline Snippet](#baseline-snippet)
- [Details](#details)
  - [Extraction Methods](#extraction-methods)
  - [Conversion Methods](#conversion-methods)
  - [Testing Methods](#testing-methods)
- [Implementation notes](#implementation-note)
- [License](#license)

# Description

Add missing useful String extension method to Pharo String class.

# Installation

## Install from CLI

Install **StringExtensions** from Command-Line Interface using [Pharo Install](https://github.com/hernanmd/pi):

```bash
pi install StringExtensions
```

## Install from Pharo

```smalltalk
EpMonitor disableDuring: [ 
	Metacello new
		baseline: 'StringExtensions';
		repository: 'github://hernanmd/StringExtensions/repository';
		load ]
```

## Baseline Snippet

If you want to add the ProjectFramework to your Metacello Baselines or Configurations, copy and paste the following expression:

```smalltalk
	" ... "
		baseline: 'StringExtensions' 
		with: [ spec repository: 'github://hernanmd/StringExtensions/repository' ].
	" ... "
```

# Details

To quickly find methods provided by this package, please evaluate:

```smalltalk
(String methods select: #isExtension) select: [ : p | p package name = 'StringExtensions' ]
```

## Extraction Methods

### findNumbers

Extracting numbers in Strings is easily supported in Pharo:

```smalltalk
'Hola123Mundo' asInteger. "123"
```

However, consider the following:

```smalltalk
'Hola123Mundo234' asInteger. "123"
```

If we want to extract all numbers in the received **String**, then we could use #findNumbers:

```smalltalk
'Hola123Mundo234'  "an OrderedCollection('123' '234')"
```

- On empty **String**, answer an empty **Collection**
- Negative Integers are extracted with sign: `'Hola-10' findNumbers. "an OrderedCollection('-10')"`
- Floats are not supported: `'Hola30.6' findNumbers.  "an OrderedCollection('30' '6')"`

### withoutBlanks

Return a copy of the receiver with leading/trailing blanks removed and white spaces condensed.

### withoutNumbers

Reject all digits from the received **String**. Examples:

```smalltalk
'3333' withoutNumbers = ''.

'aaaa' withoutNumbers = 'aaaa'.

'aaa1234' withoutNumbers = 'aaa'.

'' withoutNumbers = ''
```

## Conversion Methods

### asCondensedString

Return a copy of the receiver with leading/trailing blanks removed and white spaces condensed.

### withoutCRs

Return a copy of the receiver without carriage returns.

## Testing Methods

### includesBeginWith:

Answer whether the parameter **String** begins like one of the receiver's sub strings elements. For example, the following expressions evaluate all to *true*:

```smalltalk
'Rose is a rose of splendor' includesBeginWith: 'rose'.

'Rose is a rose of splendor' includesBeginWith: 'ROSE'.

'Raise the art to resistance' includesBeginWith: 'resist'.

'Danger dare to be grand' includesBeginWith: 'dar'.
```

### isAllLetters

Answer *true* whether the receiver is composed entirely of letters.

### isNumeric

Answer whether the receiver is a **Number**. It uses a regular expression. 

### isXML

Cheap checking of beggining XML document, no parsing involved, just check '<?xml'.

### isZipped

Uses **GZipConstants** gzipMagic to check if the received **String** conforms to GZip file format.


# License

This software is licensed under the MIT License.

Copyright Hernán Morales, 2018-2022

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
