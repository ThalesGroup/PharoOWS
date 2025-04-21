Class {
	#name : #PharoOWSServiceRequest,
	#superclass : #Object,
	#instVars : [
		'xmlElement',
		'name',
		'formats'
	],
	#category : #'PharoOWS-Service'
}

{ #category : #'instance creation' }
PharoOWSServiceRequest class >> fromXMLLayer: aXMLElement [

	| tmp |
	tmp := self new.
	tmp xmlElement: aXMLElement.
	tmp parseElement.
	^ tmp
]

{ #category : #'instance creation' }
PharoOWSServiceRequest class >> fromXMLList: aList [
^aList collect: [ :e | self fromXMLLayer: e ].
]

{ #category : #accessing }
PharoOWSServiceRequest >> formats [

	^ formats
]

{ #category : #accessing }
PharoOWSServiceRequest >> formats: anObject [

	formats := anObject
]

{ #category : #accessing }
PharoOWSServiceRequest >> name [

	^ name
]

{ #category : #accessing }
PharoOWSServiceRequest >> name: anObject [

	name := anObject
]

{ #category : #parsing }
PharoOWSServiceRequest >> parseElement [

	| text |
	name := (self xmlElement name).
	formats := OrderedCollection new.
	(self xmlElement descendantElementsNamed: 'Format') do: [ :format |
    text := format strings first.  
    formats add: text.  
	].
]

{ #category : #printing }
PharoOWSServiceRequest >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' <'.
	aStream nextPutAll: self name.
	aStream nextPutAll: '>'.
]

{ #category : #accessing }
PharoOWSServiceRequest >> xmlElement [

	^ xmlElement
]

{ #category : #accessing }
PharoOWSServiceRequest >> xmlElement: anObject [

	xmlElement := anObject
]
