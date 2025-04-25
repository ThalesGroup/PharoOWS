Class {
	#name : #PharoOWSServiceWMTS,
	#superclass : #PharoOWSService,
	#category : #'PharoOWS-Service'
}

{ #category : #api }
PharoOWSServiceWMTS >> tile: aLayerList matrixset: aMatrixSet matrix: aMatrix row: aRow col: aCol format: aFormat style: aStyle [

	| params result layers |
	
	layers := ',' join: aLayerList.

	params := '&REQUEST=GetTile',
				 '&FORMAT=', aFormat,
				 '&VERSION=', self version,
				 '&STYLE=', aStyle,
				 '&LAYER=', layers,
				 '&TILEMATRIXSET=' , aMatrixSet,
				 '&TILEMATRIX=' , aMatrix printString,
	          '&TILEROW=' , aRow printString,
	          '&TILECOL=', aCol printString.
	
	result := self client get: self url , params.
	(result isKindOf: String)
		ifTrue: [ 
			(Error new messageText: result) signal.
		].

	^ Form fromBinaryStream: result readStream
	
]

{ #category : #accessing }
PharoOWSServiceWMTS >> url [
	^ super url, '?', 'SERVICE=WMTS'
]
