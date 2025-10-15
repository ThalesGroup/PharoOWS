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

	result := [ ZnClient new 
		url: tileUrl;
		get ] on: NameLookupFailure do:[ :ex |
		"Cannot reach the url, curently when there is no network, return nil"
		nil
	].
	
	result ifNil:[ ^ nil ].
	result isString ifTrue: [ ^ nil ].

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
