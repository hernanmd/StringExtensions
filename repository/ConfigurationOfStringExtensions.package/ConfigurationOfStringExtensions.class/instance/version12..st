versions
version12: spec
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
