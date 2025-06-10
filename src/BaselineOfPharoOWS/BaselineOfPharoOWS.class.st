Class {
	#name : #BaselineOfPharoOWS,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoOWS
}

{ #category : #baselines }
BaselineOfPharoOWS >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Dependencies"
			self dependencies: spec.

			"Packages"
			spec
				package: 'PharoOWS-Service';
				package: 'PharoOWS-Service-Tests' with: [ spec requires: #('PharoOWS-Service') ].
		  ]
]

{ #category : #baselines }
BaselineOfPharoOWS >> dependencies: spec [

	spec baseline: 'XMLParser' with: [
		spec repository: 'github://pharo-contributions/XML-XMLParser/src' ].
]
