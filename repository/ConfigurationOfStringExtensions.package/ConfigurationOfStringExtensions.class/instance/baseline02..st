baselines
baseline02: spec
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
