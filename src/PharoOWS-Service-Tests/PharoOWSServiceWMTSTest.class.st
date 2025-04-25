Class {
	#name : #PharoOWSServiceWMTSTest,
	#superclass : #TestCase,
	#traits : 'TTestTools',
	#classTraits : 'TTestTools classTrait',
	#category : #'PharoOWS-Service-Tests'
}

{ #category : #tests }
PharoOWSServiceWMTSTest >> testOneLayer [

	| qc tile |
	qc := PharoOWSServiceWMTS new.
	qc url: 'https://data.geopf.fr/wmts'.
	
	tile := qc
		       tile: { 'ELEVATION.SLOPES' }
		       matrixset: 'PM_6_14'
		       matrix: 9
		       row: 179
				 col: 253.

	self assert: tile height equals: 256.
	self assert: tile width equals: 256.

	self image: tile
]
