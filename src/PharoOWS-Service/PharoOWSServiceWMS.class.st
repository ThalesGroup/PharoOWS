Class {
	#name : #PharoOWSServiceWMS,
	#superclass : #PharoOWSService,
	#category : #'PharoOWS-Service'
}

{ #category : #api }
PharoOWSServiceWMS >> map: aLayerList bounds: aBounds size: aSize coordinates: aCoordinates [

	| params bbox result layers error |
	layers := ',' join: aLayerList.
	bbox := aBounds origin x printString , ','
	        , aBounds origin y printString , ','
	        , aBounds corner x printString , ','
	        , aBounds corner y printString.

	params := 'SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&FORMAT=image/png&STYLES=&LAYERS='
	          , layers , '&BBOX=' , bbox , '&CRS=' , aCoordinates
	          , '&WIDTH=' , aSize x printString , '&HEIGHT='
	          , aSize y printString.

	result := self client get: self url , '?' , params.
	(result isKindOf: String) 
		ifTrue: [ 
			error := Error new.
			error messageText: result; signal. 
		].

	^ Form fromBinaryStream: result readStream
]

{ #category : #api }
PharoOWSServiceWMS >> map: aLayerList bounds: aBounds size: aSize epsg: aEPSGCoordinates [

	^ self
		  map: aLayerList
		  bounds: aBounds
		  size: aSize
		  coordinates: 'EPSG:' , aEPSGCoordinates
]
