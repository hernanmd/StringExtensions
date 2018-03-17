baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec preLoadDoIt: #preLoad.		
		spec
			configuration: 'SMark'
			with: [ spec versionString: #stable; repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main/' ];
			yourself.	
		
		spec
			package: #StringExtensions;
			package: #StringExtensionsBenchmarks 			with: [ spec requires: #('SMark' ). ];
			package: #StringExtensionsLevenshtein 			with: [ spec requires: #(#StringExtensions ). ];
			package: #'StringExtensionsLevenshtein-Tests' with: [ spec requires: #(#StringExtensionsLevenshtein ). ];
			package: #StringExtensionsTests 					with: [ spec requires: #(#StringExtensions ). ].
		spec 
			group: 'All' 			with: #(#StringExtensionsTests #StringExtensionsBenchmarks #StringExtensions #'StringExtensionsLevenshtein-Tests' #StringExtensionsLevenshtein );
			group: 'Benchmarks' 	with: #(#StringExtensionsLevenshtein #StringExtensionsBenchmarks #StringExtensions );
			group: 'Core' 			with: #(#StringExtensions );
			group: 'Tests' 			with: #(#StringExtensions #StringExtensionsTests #StringExtensionsLevenshtein #'StringExtensionsLevenshtein-Tests' ). 
	].
