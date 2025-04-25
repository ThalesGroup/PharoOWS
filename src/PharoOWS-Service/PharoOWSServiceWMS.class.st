Class {
	#name : #PharoOWSServiceWMS,
	#superclass : #PharoOWSService,
	#category : #'PharoOWS-Service'
}

{ #category : #api }
PharoOWSServiceWMS >> map: aLayerList bbox: aBbox size: aSize epsg: aEPSG [

	| params bbox result layers |
	
	layers := ',' join: aLayerList.
	
	bbox := aBbox origin x printString , ',' ,
	        aBbox origin y printString , ',',
	        aBbox corner x printString , ',',
	        aBbox corner y printString.

	params := '&REQUEST=GetMap',
				 '&FORMAT=image/png',
				 '&STYLES=&',
				 '&LAYERS=', layers,
	          '&BBOX=' , bbox,
				 '&CRS=EPSG:' , aEPSG,
	          '&WIDTH=' , aSize x printString,
	          '&HEIGHT=', aSize y printString.

	result := self client get: self url , params.
	(result isKindOf: String)
		ifTrue: [ 
			(Error new messageText: result) signal.
		].

	^ Form fromBinaryStream: result readStream
]

{ #category : #accessing }
PharoOWSServiceWMS >> url [
	^ super url, '?', 'SERVICE=WMS&VERSION=1.3.0' 
]
