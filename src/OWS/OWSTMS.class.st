Class {
	#name : #OWSTMS,
	#superclass : #Object,
	#instVars : [
		'url'
	],
	#category : #'OWS-TMS'
}

{ #category : #accessing }
OWSTMS >> tile: aX y: aY z: aZ [

	| tileUrl result |
	tileUrl := self url copyReplaceAll: '{x}' with: aX printString.
	tileUrl := tileUrl copyReplaceAll: '{y}' with: aY printString.
	tileUrl := tileUrl copyReplaceAll: '{z}' with: aZ printString.

	result := ZnClient new 
		url: tileUrl;
		get.
	
	result isString ifTrue: [ (Error new messageText: result) signal ].

	^ Form fromBinaryStream: result readStream
]

{ #category : #accessing }
OWSTMS >> url [

	^ url ifNil: [ url := 'localhost' ]
]

{ #category : #accessing }
OWSTMS >> url: anObject [

	url := anObject
]
