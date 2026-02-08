Class {
	#name : #OWSAPI,
	#superclass : #Object,
	#instVars : [
		'url',
		'client'
	],
	#category : #'OWS-API'
}

{ #category : #accessing }
OWSAPI >> client [
	client ifNil:[client := ZnClient new].
	^ client
]

{ #category : #accessing }
OWSAPI >> client: anObject [

	client := anObject
]

{ #category : #accessing }
OWSAPI >> url [

	^ url ifNil: [ url := 'localhost' ]
]

{ #category : #accessing }
OWSAPI >> url: anObject [

	url := anObject
]
