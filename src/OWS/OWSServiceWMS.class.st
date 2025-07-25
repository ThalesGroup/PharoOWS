Class {
	#name : #OWSServiceWMS,
	#superclass : #OWSService,
	#category : #'OWS-Service'
}

{ #category : #api }
OWSServiceWMS >> map: aLayerList bbox: aBbox size: aSize epsg: aEPSG format: aFormat [

	^ self map: aLayerList
		    bbox: aBbox
		    size: aSize
		    epsg: aEPSG
			 format: aFormat
			 style: {}
			 transparent: false.
]

{ #category : #api }
OWSServiceWMS >> map: aLayerList bbox: aBbox size: aSize epsg: aEPSG format: aFormat style: aStyleList transparent: aTransparent [

	| params bbox result layers styles |
	
	layers := ',' join: aLayerList.
	
	styles := ',' join: aStyleList.
	
	bbox := aBbox origin x printString , ',' ,
	        aBbox origin y printString , ',',
	        aBbox corner x printString , ',',
	        aBbox corner y printString.

	params := '&REQUEST=GetMap',
				 '&FORMAT=', aFormat,
				 '&VERSION=', self version,
				 '&STYLES=', styles,
				 '&LAYERS=', layers,
	          '&BBOX=' , bbox,
				 '&CRS=EPSG:' , aEPSG,
	          '&WIDTH=' , aSize x printString,
	          '&HEIGHT=', aSize y printString,
				 '&TRANSPARENT=', aTransparent asString asUppercase.

   Transcript show: params; cr.

	result := self client get: self url , params.
	(result isKindOf: String)
		ifTrue: [ 
			(Error new messageText: result) signal.
		].

	^ Form fromBinaryStream: result readStream
]

{ #category : #accessing }
OWSServiceWMS >> operations [

	^OWSServiceWMSOperation fromXMLList:
		((self capabilities document descendantElementsNamed: 'Request') first elements)
]

{ #category : #accessing }
OWSServiceWMS >> url [
	^ super url, '?', 'SERVICE=WMS' 
]
