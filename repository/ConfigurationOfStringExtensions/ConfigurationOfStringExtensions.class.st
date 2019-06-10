"
See GitHub page for documentation

https://github.com/hernanmd/StringExtensions

"
Class {
	#name : #ConfigurationOfStringExtensions,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfStringExtensions'
}

{ #category : #'development support' }
ConfigurationOfStringExtensions class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfStringExtensions class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #catalog }
ConfigurationOfStringExtensions class >> catalogChangeLog [
	"Returns a paragraph describing the most important changes in the configuration class."
	
	^ 'Ported to Pharo 6.x'
]

{ #category : #catalog }
ConfigurationOfStringExtensions class >> catalogContactInfo [
	"Returns a paragraph describing contact information such as email, mailing lists and website."
	^ 'StringExtensions created and maintained by hernan.morales@gmail.com'
]

{ #category : #catalog }
ConfigurationOfStringExtensions class >> catalogDescription [
	"Returns a paragraph describing the project"
	^ 'StringExtensions adds String helper and utility methods not included in the default Pharo image'
]

{ #category : #catalog }
ConfigurationOfStringExtensions class >> catalogKeyClassesAndExample [
	"Returns a paragraph or more describing the key classes of your project. You can use Pillar/Pier syntax to layout out the text i.e., ==Code== and - for bullet."
	^ 'All methods are implemented as extensions in class ==String=='
]

{ #category : #catalog }
ConfigurationOfStringExtensions class >> catalogKeywords [
	"Returns an array of symbols"
	^ #(string utilities) 
]

{ #category : #private }
ConfigurationOfStringExtensions class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfStringExtensions class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfStringExtensions class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfStringExtensions class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfStringExtensions class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfStringExtensions class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfStringExtensions class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfStringExtensions class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfStringExtensions >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/'.
		spec package: #StringExtensions. ].

]

{ #category : #baselines }
ConfigurationOfStringExtensions >> baseline02: spec [
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.		
		spec repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/'.
		spec project: 'SMark' with: [
				spec
					className: #ConfigurationOfSMark;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main/' ].
		spec 
			package: #StringExtensions;
			package: #StringExtensionsBenchmarks with: [
				spec requires: #('SMark' ). ];
			package: #StringExtensionsLevenshtein with: [
				spec requires: #(#StringExtensions ). ];
			package: #'StringExtensionsLevenshtein-Tests' with: [
				spec requires: #(#StringExtensionsLevenshtein ). ];
			package: #StringExtensionsTests with: [
				spec requires: #(#StringExtensions ). ].
		spec 
			group: 'All' with: #(#StringExtensionsTests #StringExtensionsBenchmarks #StringExtensions #'StringExtensionsLevenshtein-Tests' #StringExtensionsLevenshtein );
			group: 'Benchmarks' with: #(#StringExtensionsLevenshtein #StringExtensionsBenchmarks #StringExtensions );
			group: 'Core' with: #(#StringExtensions );
			group: 'Tests' with: #(#StringExtensions #StringExtensionsTests #StringExtensionsLevenshtein #'StringExtensionsLevenshtein-Tests' ). ].

]

{ #category : #accessing }
ConfigurationOfStringExtensions >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfStringExtensions >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.2-baseline'.

]

{ #category : #accessing }
ConfigurationOfStringExtensions >> ensureMetacelloFileDownload [

	Metacello new           
		baseline: 'MetacelloFileDownload';              
		repository: 'github://hernanmd/MetacelloFileDownload';          
		load.
]

{ #category : #doits }
ConfigurationOfStringExtensions >> platformFilesUrl [

	^ Array with: (String streamContents: [ : stream |		
		stream 			
			nextPutAll: 'https://github.com/hernanmd/StringExtensions/raw/master/';
			nextPutAll: (
				Smalltalk os isWin32 					
					ifTrue: [ 'words.zip' ]
					ifFalse: [ 'words.tar.gz' ]) ])
]

{ #category : #accessing }
ConfigurationOfStringExtensions >> preLoad [

    self ensureMetacelloFileDownload.
    super preLoad.
]

{ #category : #accessing }
ConfigurationOfStringExtensions >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfStringExtensions >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.2'.

]

{ #category : #versions }
ConfigurationOfStringExtensions >> version10: spec [
	<version: '1.0' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.0'.
		spec author: 'HernanMoralesDurand'.
		spec timestamp: '12/24/2015 15:35'.
		spec package: #StringExtensions with: 'StringExtensions-HernanMoralesDurand.7'. ].

]

{ #category : #versions }
ConfigurationOfStringExtensions >> version11: spec [
	<version: '1.1' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.1'.
		spec author: 'HernanMoralesDurand'.
		spec timestamp: '4/1/2017 03:19'.
		spec package: #StringExtensions with: 'StringExtensions-HernanMoralesDurand.9'. ].

]

{ #category : #versions }
ConfigurationOfStringExtensions >> version12: spec [
	<version: '1.2' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.2'.
		spec author: 'HernanMoralesDurand'.
		spec timestamp: '1/20/2018 03:27'.
		spec project: 'SMark' with: '1.0.0'.
		spec 
			package: #StringExtensions with: 'StringExtensions-HernanMoralesDurand.12';
			package: #StringExtensionsBenchmarks with: 'StringExtensionsBenchmarks-HernanMoralesDurand.3';
			package: #StringExtensionsLevenshtein with: 'StringExtensionsLevenshtein-HernanMoralesDurand.2';
			package: #'StringExtensionsLevenshtein-Tests' with: 'StringExtensionsLevenshtein-Tests-HernanMoralesDurand.1';
			package: #StringExtensionsTests with: 'StringExtensionsTests-HernanMoralesDurand.3'. ].

]
