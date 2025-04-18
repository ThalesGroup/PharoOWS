"
A PharoOWSServiceWMSTest is a test class for testing the behavior of PharoOWSServiceWMS
"
Class {
	#name : #PharoOWSServiceWMSTest,
	#superclass : #TestCase,
	#category : #'PharoOWS-Service-Tests'
}

{ #category : #tests }
PharoOWSServiceWMSTest >> testMap [

	| qc map size |
	qc := PharoOWSServiceWMS new.
	size := 1920@1080.
	qc endpoint: 'https://data.geopf.fr/wms-r'.
	map := qc
		       map: { 'Carte littorale (SHOM/IGN)' }
		       bounds: (-90 @ -180 corner: 90 @ 180)
				 size: size
		       epsg: '4326'
]
