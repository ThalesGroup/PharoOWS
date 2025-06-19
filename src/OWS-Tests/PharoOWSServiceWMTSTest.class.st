Class {
	#name : #PharoOWSServiceWMTSTest,
	#superclass : #TestCase,
	#traits : 'TTestTools',
	#classTraits : 'TTestTools classTrait',
	#category : #'OWS-Tests'
}

{ #category : #testsGetTile }
PharoOWSServiceWMTSTest >> testGetTile [

	| wmts tile |
	wmts := PharoOWSServiceWMTS new.
	wmts url: 'https://data.geopf.fr/wmts'.

	tile := wmts
		        tile: { 'ELEVATION.SLOPES' }
		        matrixset: 'PM_6_14'
		        matrix: 9
		        row: 179
		        col: 253
		        format: 'image/jpeg'
		        style: 'normal'.


	self assert: tile height equals: 256.
	self assert: tile width equals: 256

	"self image: tile"
]

{ #category : #testsGetCapabilities }
PharoOWSServiceWMTSTest >> testOperations [

	| wmts requests gettile |
	wmts := PharoOWSServiceWMTS new.
	wmts url: 'https://data.geopf.fr/wmts'.
	requests := wmts operations.
	self assert: requests size equals: 3.

	gettile := requests detect: [ :request | request name = 'GetTile' ].
	self assert: gettile name equals: 'GetTile'
]

{ #category : #testsGetCapabilities }
PharoOWSServiceWMTSTest >> testVersion [

	| wmts version |
	wmts := PharoOWSServiceWMTS new.
	wmts url: 'https://data.geopf.fr/wmts'.
	
	version := wmts version.
	self assert: version equals: '1.0.0'.
]
