Class {
	#name : #PharoOWSServiceXMLElement,
	#superclass : #Object,
	#instVars : [
		'xmlElement',
		'name'
	],
	#category : #'OWS-Service'
}

{ #category : #'instance creation' }
PharoOWSServiceXMLElement class >> fromXMLLayer: aXMLElement [

	| tmp |
	tmp := self new.
	tmp xmlElement: aXMLElement.
	tmp parseElement.
	^ tmp
]

{ #category : #'instance creation' }
PharoOWSServiceXMLElement class >> fromXMLList: aList [
^aList collect: [ :e | self fromXMLLayer: e ].
]

{ #category : #accessing }
PharoOWSServiceXMLElement >> name [

	^ name
]

{ #category : #accessing }
PharoOWSServiceXMLElement >> name: anObject [

	name := anObject
]

{ #category : #printing }
PharoOWSServiceXMLElement >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' <'.
	aStream nextPutAll: self name.
	aStream nextPutAll: '>'.
]

{ #category : #accessing }
PharoOWSServiceXMLElement >> xmlElement [

	^ xmlElement
]

{ #category : #accessing }
PharoOWSServiceXMLElement >> xmlElement: anObject [

	xmlElement := anObject
]
