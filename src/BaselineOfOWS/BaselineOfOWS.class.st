Class {
	#name : #BaselineOfOWS,
	#superclass : #BaselineOf,
	#category : #BaselineOfOWS
}

{ #category : #baselines }
BaselineOfOWS >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Dependencies"
			self dependencies: spec.

			"Packages"
			spec
				package: 'OWS';
				package: 'OWS-Tests' with: [ spec requires: #('OWS') ].
		  ]
]

{ #category : #baselines }
BaselineOfOWS >> dependencies: spec [

	spec baseline: 'XMLParser' with: [
		spec repository: 'github://pharo-contributions/XML-XMLParser/src' ].
]
