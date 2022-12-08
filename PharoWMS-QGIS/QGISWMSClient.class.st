Class {
	#name : #QGISWMSClient,
	#superclass : #QGISClient,
	#category : #'PharoWMS-QGIS'
}

{ #category : #api }
QGISWMSClient >> baseUrl [

	| baseUrl |
	baseUrl ifNil: [ 
		baseUrl := 'http://' , self host , ':' , self port asString
		           ,
		           (self endpoint ifNil: [ '' ] ifNotNil: [ :e | '/' , e ]).
		baseUrl := baseUrl, '?SERVICE=WMS'
		].
	^ baseUrl
]

{ #category : #api }
QGISWMSClient >> capabilities [

	| url xml |
	self isRunning ifFalse: [ self error: 'Server is not running' ].
	capabilities ifNil: [ 
		url := self baseUrl , '&REQUEST=GetCapabilities'.
		xml := self client get: url.
		capabilities := (XMLDOMParser parse: xml) document ].
	^ capabilities
]

{ #category : #api }
QGISWMSClient >> map: aLayerList bounds: aBounds size: aSize coordinates: aCoordinates [

	| layerList layerListWs url bbox img |
	self isRunning ifFalse: [ self error: 'Server is not running' ].
	layerList := aLayerList collect: [ :e | e asString ].
	layerListWs := String new writeStream.
	layerList
		do: [ :e | layerListWs nextPutAll: e ]
		separatedBy: [ layerListWs nextPut: $, ].
	bbox := aBounds origin x printString , ','
	        , aBounds origin y printString , ','
	        , aBounds corner x printString , ','
	        , aBounds corner y printString.
	url := self baseUrl , '&VERSION=1.3.0&REQUEST=GetMap&LAYERS='
	       , layerListWs contents , '&BBOX=' , bbox , '&CRS='
	       , aCoordinates , '&WIDTH=' , aSize x printString, '&HEIGHT=' , aSize y printString.
	img := self client get: url.
	^ Form fromBinaryStream: img readStream.
]

{ #category : #api }
QGISWMSClient >> map: aLayerList bounds: aBounds size: aSize epsg: aEPSGCoordinates [

	^ self
		  map: aLayerList
		  bounds: aBounds
		  size: aSize
		  coordinates: 'EPSG:' , aEPSGCoordinates
]
