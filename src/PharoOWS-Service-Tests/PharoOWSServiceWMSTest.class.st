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

	| wms doc |
	wms := PharoOWSServiceWMS new.
	wms url: 'https://data.geopf.fr/wms-r'.
	doc := wms capabilities.
	self assert: doc root name equals: 'WMS_Capabilities'
]

{ #category : #testsGetMap }
PharoOWSServiceWMSTest >> testInvalidLayer [

	| wms map size |
	wms := PharoOWSServiceWMS new.
	size := 800 @ 600.
	wms url: 'https://data.geopf.fr/wms-r'.

	self
		should: [
			map := wms
				       map: { 'InvalidLayer' }
				       bbox: (-546079 @ 6126282 corner: -398839 @ 6212047)
				       size: size
				       epsg: '3857' ]
		raise: Error
]

{ #category : #testsGetCapabilities }
PharoOWSServiceWMSTest >> testLayers [

	| wms layers ok |
	wms := PharoOWSServiceWMS new.
	wms url: 'https://data.geopf.fr/wms-r'.
	layers := wms layers.
	self assert: layers isNotEmpty.

	ok := false.
	layers do: [ :layer |
		layer title = 'Carte du relief' ifTrue: [
			self assert: layer name equals: 'EL.GridCoverage'.
			ok := true ] ].

	self assert: ok
]

{ #category : #testsGetMap }
PharoOWSServiceWMSTest >> testOneLayer [

	| wms map size |
	wms := PharoOWSServiceWMS new.
	wms url: 'https://data.geopf.fr/wms-r'.

	size := 800 @ 600.
	map := wms
		       map: { 'GEOGRAPHICALGRIDSYSTEMS.COASTALMAPS' }
		       bbox: (-509969 @ 6164380 corner: -504505 @ 6167923)
		       size: size
		       epsg: '3857'.

	self assert: map height equals: size y.
	self assert: map width equals: size x

	"self image: map"
]

{ #category : #testsGetCapabilities }
PharoOWSServiceWMSTest >> testOperations [

	| wms requests ok x |
	wms := PharoOWSServiceWMS new.
	wms url: 'https://data.geopf.fr/wms-r'.
	requests := wms operations.
	self assert: requests isNotEmpty.

	x := requests detect: [ :request | request name = 'GetMap' ].
	self assert: x formats size equals: 5.

	ok := false.
	requests do: [ :request |
		request name = 'GetMap' ifTrue: [
			request formats do: [ :format |
				format = 'image/jpeg' ifTrue: [ ok := true ] ] ] ].

	ok := false.
	requests do: [ :request |
		request name = 'GetCapabilities' ifTrue: [
			request formats do: [ :format |
				format = 'text/xml' ifTrue: [ ok := true ] ] ] ].

	self assert: ok
]

{ #category : #testsGetMap }
PharoOWSServiceWMSTest >> testSeveralLayers [

	| wms map size |
	wms := PharoOWSServiceWMS new.
	size := 800 @ 600.
	wms url: 'https://data.geopf.fr/wms-r'.
	map := wms
		       map: { 'EL.GridCoverage'. 'FORETS.PUBLIQUES' }
		       bbox: (-546079 @ 6126282 corner: -398839 @ 6212047)
		       size: size
		       epsg: '3857'.

	self assert: map height equals: size y.
	self assert: map width equals: size x

	"self image: map"
]

{ #category : #testsGetCapabilities }
PharoOWSServiceWMSTest >> testVersion [

	| wms version |
	wms := PharoOWSServiceWMS new.
	wms url: 'https://data.geopf.fr/wms-r'.

	version := wms version.
	self assert: version equals: '1.3.0'
]
