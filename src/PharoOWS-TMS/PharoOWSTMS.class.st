Class {
	#name : #PharoOWSTMS,
	#superclass : #Object,
	#instVars : [
		'url'
	],
	#category : #'PharoOWS-TMS'
}

{ #category : #accessing }
PharoOWSTMS >> tile: aX y: aY z: aZ [

	| tileUrl result |
	tileUrl := self url copyReplaceAll: '{x}' with: aX printString.
	tileUrl := tileUrl copyReplaceAll: '{y}' with: aY printString.
	tileUrl := tileUrl copyReplaceAll: '{z}' with: aZ printString.

	result := ZnClient new 
		url: tileUrl;
		get.
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
