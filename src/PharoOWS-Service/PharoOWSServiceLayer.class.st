Class {
	#name : #PharoOWSServiceLayer,
	#superclass : #Object,
	#instVars : [
		'xmlElement',
		'name',
		'title'
	],
	#category : #'PharoOWS-Service'
}

{ #category : #'instance creation' }
PharoOWSServiceLayer class >> fromXMLLayer: aXMLElement [

	| tmp |
	tmp := self new.
	tmp xmlElement: aXMLElement.
	tmp parseElement.
	^ tmp
]

{ #category : #'instance creation' }
PharoOWSServiceLayer class >> fromXMLList: aList [
^aList collect: [ :e | self fromXMLLayer: e ].
]

{ #category : #accessing }
PharoOWSServiceLayer >> name [

	^ name
]

{ #category : #accessing }
PharoOWSServiceLayer >> name: anObject [

	name := anObject
]

{ #category : #parsing }
PharoOWSServiceLayer >> parseElement [

	name := (self xmlElement elementAt:'Name') strings first.
	title := (self xmlElement elementAt: 'Title') strings first.
]

{ #category : #printing }
PharoOWSServiceLayer >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' <'.
	aStream nextPutAll: self name.
	aStream nextPutAll: '>'.
]

{ #category : #accessing }
PharoOWSServiceLayer >> title [

	^ title
]

{ #category : #accessing }
PharoOWSServiceLayer >> title: anObject [

	title := anObject
]

{ #category : #accessing }
PharoOWSServiceLayer >> xmlElement [

	^ xmlElement
]

{ #category : #accessing }
PharoOWSServiceLayer >> xmlElement: anObject [

	xmlElement := anObject
]
