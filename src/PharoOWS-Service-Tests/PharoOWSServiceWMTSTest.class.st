Class {
	#name : #PharoOWSServiceWMTSTest,
	#superclass : #TestCase,
	#category : #'PharoOWS-Service-Tests'
}

{ #category : #tests }
PharoOWSServiceWMTSTest >> testTile [

	| qc map size |
	qc := PharoOWSServiceWMTS new.
	size := 1920@1080.
	qc endpoint: 'qgisserver'.
	map := qc
		       map: { 'countries' }
		       bounds: (-90 @ -180 corner: 90 @ 180)
				 size: size
		       epsg: '4326'
]
