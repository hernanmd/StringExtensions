baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec preLoadDoIt: #preLoad.		
		spec
			baseline: 'FuzzySearcher'		with: [ spec repository: 'github://hernanmd/FuzzySearcher/repository' ];
			configuration: 'SMark' 			with: [ spec versionString: #stable; repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main/' ];
			yourself.	
		
		spec
			package: #StringExtensions						with: [ spec requires: #('FuzzySearcher') ];
			package: #StringExtensionsBenchmarks 			with: [ spec requires: #('SMark' ). ];
			package: #StringExtensionsLevenshtein 			with: [ spec requires: #(#StringExtensions ). ];
			package: #'StringExtensionsLevenshtein-Tests' 	with: [ spec requires: #(#StringExtensionsLevenshtein ). ];
			package: #StringExtensionsTests 				with: [ spec requires: #(#StringExtensions ). ].
		spec 
			group: 'All' 			with: #(#StringExtensionsTests #StringExtensionsBenchmarks #StringExtensions #'StringExtensionsLevenshtein-Tests' #StringExtensionsLevenshtein 'FuzzySearcher');
			group: 'Benchmarks' 	with: #(#StringExtensionsLevenshtein #StringExtensionsBenchmarks #StringExtensions 'FuzzySearcher');
			group: 'Core' 			with: #(#StringExtensions 'FuzzySearcher');
			group: 'Tests' 			with: #(#StringExtensions #StringExtensionsTests #StringExtensionsLevenshtein #'StringExtensionsLevenshtein-Tests' 'FuzzySearcher') ].
