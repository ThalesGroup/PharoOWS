Class {
	#name : #PharoOWSServiceCapabilitiesElement,
	#superclass : #Object,
	#instVars : [
		'xmlElement',
		'name'
	],
	#category : #'PharoOWS-Service'
}

{ #category : #accessing }
PharoOWSServiceCapabilitiesElement >> name [

	^ name
]

{ #category : #accessing }
PharoOWSServiceCapabilitiesElement >> name: anObject [

	name := anObject
]

{ #category : #printing }
PharoOWSServiceCapabilitiesElement >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' <'.
	aStream nextPutAll: self name.
	aStream nextPutAll: '>'.
]

{ #category : #accessing }
PharoOWSServiceCapabilitiesElement >> xmlElement [

	^ xmlElement
]

{ #category : #accessing }
PharoOWSServiceCapabilitiesElement >> xmlElement: anObject [

	xmlElement := anObject
]
