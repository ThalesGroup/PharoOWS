Class {
	#name : #PharoOWSServiceCapabilitiesLayer,
	#superclass : #PharoOWSServiceCapabilitiesElement,
	#instVars : [
		'title'
	],
	#category : #'PharoOWS-Service'
}

{ #category : #'instance creation' }
PharoOWSServiceCapabilitiesLayer class >> fromXMLLayer: aXMLElement [

	| tmp |
	tmp := self new.
	tmp xmlElement: aXMLElement.
	tmp parseElement.
	^ tmp
]

{ #category : #'instance creation' }
PharoOWSServiceCapabilitiesLayer class >> fromXMLList: aList [
^aList collect: [ :e | self fromXMLLayer: e ].
]

{ #category : #parsing }
PharoOWSServiceCapabilitiesLayer >> parseElement [

	name := (self xmlElement elementAt:'Name') strings first.
	title := (self xmlElement elementAt: 'Title') strings first.
]

{ #category : #accessing }
PharoOWSServiceCapabilitiesLayer >> title [

	^ title
]

{ #category : #accessing }
PharoOWSServiceCapabilitiesLayer >> title: anObject [

	title := anObject
]
