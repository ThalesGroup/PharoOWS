Class {
	#name : #OWSServiceXMLElement,
	#superclass : #Object,
	#instVars : [
		'xmlElement',
		'name'
	],
	#category : #'OWS-Service'
}

{ #category : #'instance creation' }
OWSServiceXMLElement class >> fromXMLLayer: aXMLElement [

	| tmp |
	tmp := self new.
	tmp xmlElement: aXMLElement.
	tmp parseElement.
	^ tmp
]

{ #category : #'instance creation' }
OWSServiceXMLElement class >> fromXMLList: aList [
^aList collect: [ :e | self fromXMLLayer: e ].
]

{ #category : #accessing }
OWSServiceXMLElement >> name [

	^ name
]

{ #category : #accessing }
OWSServiceXMLElement >> name: anObject [

	name := anObject
]

{ #category : #printing }
OWSServiceXMLElement >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' <'.
	aStream nextPutAll: self name.
	aStream nextPutAll: '>'.
]

{ #category : #accessing }
OWSServiceXMLElement >> xmlElement [

	^ xmlElement
]

{ #category : #accessing }
OWSServiceXMLElement >> xmlElement: anObject [

	xmlElement := anObject
]
