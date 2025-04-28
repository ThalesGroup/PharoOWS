Class {
	#name : #PharoOWSServiceWMTSTest,
	#superclass : #TestCase,
	#traits : 'TTestTools',
	#classTraits : 'TTestTools classTrait',
	#category : #'PharoOWS-Service-Tests'
}

{ #category : #testsGetTile }
PharoOWSServiceWMTSTest >> testGetTile [

	| qc tile |
	qc := PharoOWSServiceWMTS new.
	qc url: 'https://data.geopf.fr/wmts'.
	
	tile := qc
		       tile: { 'ELEVATION.SLOPES' }
		       matrixset: 'PM_6_14'
		       matrix: 9
		       row: 179
				 col: 253
				 format: 'image/jpeg'
				 style: 'normal'.


	self assert: tile height equals: 256.
	self assert: tile width equals: 256.

	self image: tile
]

{ #category : #testsGetCapabilities }
PharoOWSServiceWMTSTest >> testOperations [

	| qc requests gettile |
	qc := PharoOWSServiceWMTS new.
	qc url: 'https://data.geopf.fr/wmts'.
	requests := qc operations.
   self assert: requests size equals: 3.

	gettile := requests detect: [ :request | request name = 'GetTile' ].
	self assert: gettile name equals: 'GetTile'.
]

{ #category : #testsGetCapabilities }
PharoOWSServiceWMTSTest >> testVersion [

	| qc version |
	qc := PharoOWSServiceWMTS new.
	qc url: 'https://data.geopf.fr/wmts'.
	
	version := qc version.
	self assert: version equals: '1.0.0'.
]
