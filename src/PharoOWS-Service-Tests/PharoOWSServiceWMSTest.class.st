"
A PharoOWSServiceWMSTest is a test class for testing the behavior of PharoOWSServiceWMS
"
Class {
	#name : #PharoOWSServiceWMSTest,
	#superclass : #TestCase,
	#traits : 'TTestTools',
	#classTraits : 'TTestTools classTrait',
	#category : #'PharoOWS-Service-Tests'
}

{ #category : #tests }
PharoOWSServiceWMSTest >> testMapInvalidLayer [

	| qc map size |
	qc := PharoOWSServiceWMS new.
	size := 800 @ 600.
	qc url: 'https://data.geopf.fr/wms-r'.
	
	self should: [
		map := qc
			       map: { 'InvalidLayer' }
		 	      bounds: (-546079 @ 6126282 corner: -398839 @ 6212047)
		  	      size: size
		   		   epsg: '3857'.
   ] raise: Error.

]

{ #category : #tests }
PharoOWSServiceWMSTest >> testMapOneLayer [

	| qc map size |
	qc := PharoOWSServiceWMS new.
	size := 800 @ 600.
	qc url: 'https://data.geopf.fr/wms-r'.
	map := qc
		       map: { 'GEOGRAPHICALGRIDSYSTEMS.COASTALMAPS' }
		       bounds: (-509969 @ 6164380 corner: -504505 @ 6167923)
		       size: size
		       epsg: '3857'.

	self assert: map height equals: size y.
	self assert: map width equals: size x.

	"self image: map"
]

{ #category : #tests }
PharoOWSServiceWMSTest >> testMapSeveralLayers [

	| qc map size |
	qc := PharoOWSServiceWMS new.
	size := 800 @ 600.
	qc url: 'https://data.geopf.fr/wms-r'.
	map := qc
		       map: { 'EL.GridCoverage'. 'FORETS.PUBLIQUES' }
		       bounds: (-546079 @ 6126282 corner: -398839 @ 6212047)
		       size: size
		       epsg: '3857'.
		
	self assert: map height equals: size y.
	self assert: map width equals: size x.
			
	"self image: map"
]
