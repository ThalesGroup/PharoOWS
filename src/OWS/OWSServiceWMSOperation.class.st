Class {
	#name : #OWSServiceWMSOperation,
	#superclass : #OWSServiceXMLElement,
	#instVars : [
		'formats'
	],
	#category : #'OWS-Service'
}

{ #category : #accessing }
OWSServiceWMSOperation >> formats [

	^ formats
]

{ #category : #accessing }
OWSServiceWMSOperation >> formats: anObject [

	formats := anObject
]

{ #category : #parsing }
OWSServiceWMSOperation >> parseElement [

	| text |
	name := (self xmlElement name).
	formats := OrderedCollection new.
	(self xmlElement descendantElementsNamed: 'Format') do: [ :format |
    text := format strings first.  
    formats add: text.  
	].
]
