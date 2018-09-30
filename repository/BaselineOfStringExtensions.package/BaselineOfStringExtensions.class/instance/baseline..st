baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec preLoadDoIt: #preLoad.		
		spec
			baseline: 'FuzzySearch'			with: [ spec repository: 'github://hernanmd/FuzzySearcher/repository' ];
			baseline: 'OrderedSet'			with: [ spec repository: 'github://hernanmd/OrderedSet/repository' ];
			configuration: 'SMark' 			with: [ spec versionString: #stable; repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main/' ];
			yourself.	
		
		spec
			package: #StringExtensions							with: [ spec requires: #('FuzzySearch' 'OrderedSet') ];
			package: #StringExtensionsBenchmarks 			with: [ spec requires: #('SMark' ). ];
			package: #StringExtensionsLevenshtein 			with: [ spec requires: #(#StringExtensions ). ];
			package: #'StringExtensionsLevenshtein-Tests' 	with: [ spec requires: #(#StringExtensionsLevenshtein ). ];
			package: #StringExtensionsTests 					with: [ spec requires: #(#StringExtensions ). ].
		spec 
			group: 'All' 			with: #(#StringExtensionsTests #StringExtensionsBenchmarks #StringExtensions #'StringExtensionsLevenshtein-Tests' #StringExtensionsLevenshtein 'FuzzySearch' 'OrderedSet');
			group: 'Benchmarks' 	with: #(#StringExtensionsLevenshtein #StringExtensionsBenchmarks #StringExtensions 'FuzzySearch');
			group: 'Core' 			with: #(#StringExtensions 'FuzzySearch' 'OrderedSet');
			group: 'Tests' 			with: #(#StringExtensions #StringExtensionsTests #StringExtensionsLevenshtein #'StringExtensionsLevenshtein-Tests' 'FuzzySearch') ].
