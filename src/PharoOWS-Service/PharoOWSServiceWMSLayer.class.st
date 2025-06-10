Class {
	#name : #PharoOWSServiceWMSLayer,
	#superclass : #PharoOWSServiceXMLElement,
	#instVars : [
		'title'
	],
	#category : #'PharoOWS-Service'
}

{ #category : #parsing }
PharoOWSServiceWMSLayer >> parseElement [

	name := (self xmlElement elementAt:'Name') strings first.
	title := (self xmlElement elementAt: 'Title') strings first.
]

{ #category : #accessing }
PharoOWSServiceWMSLayer >> title [

	^ title
]

{ #category : #accessing }
PharoOWSServiceWMSLayer >> title: anObject [

	title := anObject
]
