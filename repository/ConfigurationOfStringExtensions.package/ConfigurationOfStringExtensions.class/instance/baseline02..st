baselines
baseline02: spec
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/'.
		spec 
			package: #StringExtensions;
			package: #StringExtensionsBenchmarks;
			package: #StringExtensionsTests.
		spec 
			group: 'All' with: #(#StringExtensionsTests #StringExtensionsBenchmarks #StringExtensions );
			group: 'Core' with: #(#StringExtensions );
			group: 'Tests' with: #(#StringExtensions #StringExtensionsTests ). ].
