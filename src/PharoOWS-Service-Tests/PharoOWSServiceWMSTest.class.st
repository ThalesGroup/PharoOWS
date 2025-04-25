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

{ #category : #testsGetCapabilities }
PharoOWSServiceWMSTest >> testDocument [

	| qc doc |
	qc := PharoOWSServiceWMS new.
	qc url: 'https://data.geopf.fr/wms-r'.
	doc := qc capabilities.
	self assert: doc root name equals: 'WMS_Capabilities'.
]

{ #category : #testsGetMap }
PharoOWSServiceWMSTest >> testInvalidLayer [

	| qc map size |
	qc := PharoOWSServiceWMS new.
	size := 800 @ 600.
	qc url: 'https://data.geopf.fr/wms-r'.
	
	self should: [
		map := qc
			      map: { 'InvalidLayer' }
		 	      bbox: (-546079 @ 6126282 corner: -398839 @ 6212047)
		  	      size: size
		   		   epsg: '3857'.
   ] raise: Error.

]

{ #category : #testsGetCapabilities }
PharoOWSServiceWMSTest >> testLayers [

	| qc layers ok |
	qc := PharoOWSServiceWMS new.
	qc url: 'https://data.geopf.fr/wms-r'.
	layers := qc layers.
	self assert: layers isNotEmpty.
	
	ok := false.
	layers do: [ :layer |
		(layer title = 'Carte du relief')
   			ifTrue: [ 
				self assert: layer name equals: 'EL.GridCoverage'.
				ok := true.
			]
	].

	self assert: ok.
]

{ #category : #testsGetMap }
PharoOWSServiceWMSTest >> testOneLayer [

	| qc map size |
	qc := PharoOWSServiceWMS new.
	qc url: 'https://data.geopf.fr/wms-r'.
	
	size := 800 @ 600.
	map := qc
		       map: { 'GEOGRAPHICALGRIDSYSTEMS.COASTALMAPS' }
		       bbox: (-509969 @ 6164380 corner: -504505 @ 6167923)
		       size: size
		       epsg: '3857'.

	self assert: map height equals: size y.
	self assert: map width equals: size x.

	"self image: map"
]

{ #category : #testsGetCapabilities }
PharoOWSServiceWMSTest >> testRequests [

	| qc requests ok x |
	qc := PharoOWSServiceWMS new.
	qc url: 'https://data.geopf.fr/wms-r'.
	requests := qc requests.
	self assert: requests isNotEmpty.

	x := requests detect: [ :request | request name = 'GetMap' ].
	self assert: x formats size equals: 5.
	
	ok := false.
	requests do: [ :request |
		(request name = 'GetMap')
   			ifTrue: [ 
				request formats do: [ :format |
					(format = 'image/jpeg')
						ifTrue: [ 
							ok := true.
						].
				].
			]
	].

	ok := false.
	requests do: [ :request |
		(request name = 'GetCapabilities')
   			ifTrue: [ 
				request formats do: [ :format |
					(format = 'text/xml')
						ifTrue: [ 
							ok := true.
						].
				].
			]
	].

	self assert: ok.
]

{ #category : #testsGetMap }
PharoOWSServiceWMSTest >> testSeveralLayers [

	| qc map size |
	qc := PharoOWSServiceWMS new.
	size := 800 @ 600.
	qc url: 'https://data.geopf.fr/wms-r'.
	map := qc
		       map: { 'EL.GridCoverage'. 'FORETS.PUBLIQUES' }
		       bbox: (-546079 @ 6126282 corner: -398839 @ 6212047)
		       size: size
		       epsg: '3857'.
		
	self assert: map height equals: size y.
	self assert: map width equals: size x.
			
	"self image: map"
]

{ #category : #tests }
PharoOWSServiceWMSTest >> testVersion [

	| qc version |
	qc := PharoOWSServiceWMS new.
	qc url: 'https://data.geopf.fr/wms-r'.
	
	version := qc version.
	self assert: version equals: '1.3.0'.
]
