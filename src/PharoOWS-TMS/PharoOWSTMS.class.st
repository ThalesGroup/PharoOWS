Class {
	#name : #PharoOWSTMS,
	#superclass : #Object,
	#instVars : [
		'client',
		'url'
	],
	#category : #'PharoOWS-TMS'
}

{ #category : #accessing }
PharoOWSTMS >> client [

	client ifNil: [ client := ZnClient new ].
	^ client
]

{ #category : #accessing }
PharoOWSTMS >> client: anObject [

	client := anObject
]

{ #category : #accessing }
PharoOWSTMS >> tile: aX y: aY z: aZ [

	| tileUrl result |
	tileUrl := self url copyReplaceAll: '{x}' with: aX printString.
	tileUrl := tileUrl copyReplaceAll: '{y}' with: aY printString.
	tileUrl := tileUrl copyReplaceAll: '{z}' with: aZ printString.

	result := self client get: tileUrl.
	(result isKindOf: String) ifTrue: [
		(Error new messageText: result) signal ].

	^ Form fromBinaryStream: result readStream
]

{ #category : #accessing }
PharoOWSTMS >> url [

	^ url ifNil: [ url := 'localhost' ]
]

{ #category : #accessing }
PharoOWSTMS >> url: anObject [

	url := anObject
]
