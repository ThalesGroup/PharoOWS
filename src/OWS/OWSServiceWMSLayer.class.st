Class {
	#name : #OWSServiceWMSLayer,
	#superclass : #OWSServiceXMLElement,
	#instVars : [
		'title'
	],
	#category : #'OWS-Service'
}

{ #category : #parsing }
OWSServiceWMSLayer >> parseElement [

	name := (self xmlElement elementAt:'Name') strings first.
	title := (self xmlElement elementAt: 'Title') strings first.
]

{ #category : #accessing }
OWSServiceWMSLayer >> title [

	^ title
]

{ #category : #accessing }
OWSServiceWMSLayer >> title: anObject [

	title := anObject
]
