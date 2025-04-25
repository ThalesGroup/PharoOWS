Class {
	#name : #PharoOWSServiceCapabilitiesRequest,
	#superclass : #PharoOWSServiceCapabilitiesElement,
	#instVars : [
		'formats'
	],
	#category : #'PharoOWS-Service'
}

{ #category : #'instance creation' }
PharoOWSServiceCapabilitiesRequest class >> fromXMLLayer: aXMLElement [

	| tmp |
	tmp := self new.
	tmp xmlElement: aXMLElement.
	tmp parseElement.
	^ tmp
]

{ #category : #'instance creation' }
PharoOWSServiceCapabilitiesRequest class >> fromXMLList: aList [
^aList collect: [ :e | self fromXMLLayer: e ].
]

{ #category : #accessing }
PharoOWSServiceCapabilitiesRequest >> formats [

	^ formats
]

{ #category : #accessing }
PharoOWSServiceCapabilitiesRequest >> formats: anObject [

	formats := anObject
]

{ #category : #parsing }
PharoOWSServiceCapabilitiesRequest >> parseElement [

	| text |
	name := (self xmlElement name).
	formats := OrderedCollection new.
	(self xmlElement descendantElementsNamed: 'Format') do: [ :format |
    text := format strings first.  
    formats add: text.  
	].
]
