Class {
	#name : #PharoOWSServiceWMS,
	#superclass : #PharoOWSService,
	#category : #'PharoOWS-Service'
}

{ #category : #api }
PharoOWSServiceWMS >> map: aLayerList bounds: aBounds size: aSize coordinates: aCoordinates [

	| mapUrl bbox img layers |

	layers := ',' join: aLayerList.
	bbox := aBounds origin x printString , ','
	        , aBounds origin y printString , ','
	        , aBounds corner x printString , ','
	        , aBounds corner y printString.
	mapUrl := 'SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&FORMAT=image/png&STYLES=&LAYERS='
	       , layers , '&BBOX=' , bbox , '&CRS='
	       , aCoordinates , '&WIDTH=' , aSize x printString, '&HEIGHT=' , aSize y printString.
	img := self client get: self url, '?', mapUrl.
	^ Form fromBinaryStream: img readStream.
]

{ #category : #api }
PharoOWSServiceWMS >> map: aLayerList bounds: aBounds size: aSize epsg: aEPSGCoordinates [

	^ self
		  map: aLayerList
		  bounds: aBounds
		  size: aSize
		  coordinates: 'EPSG:' , aEPSGCoordinates
]
