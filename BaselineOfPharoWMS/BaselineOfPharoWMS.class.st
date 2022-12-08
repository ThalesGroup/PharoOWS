Class {
	#name : #BaselineOfPharoWMS,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoWMS
}

{ #category : #baselines }
BaselineOfPharoWMS >> baseline: spec [
	<baseline> 
	spec
		for: #common
		do: [								
			"Packages"
			spec
				package: 'PharoWMS-QGIS';
				package: 'PharoWMS-QGIS-Tests' with: [ spec requires: #('PharoWMS-QGIS') ].
		  ]
]
