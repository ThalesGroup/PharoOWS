Class {
	#name : #PharoOWSServiceWMSOperation,
	#superclass : #PharoOWSServiceXMLElement,
	#instVars : [
		'formats'
	],
	#category : #'OWS-Service'
}

{ #category : #accessing }
PharoOWSServiceWMSOperation >> formats [

	^ formats
]

{ #category : #accessing }
PharoOWSServiceWMSOperation >> formats: anObject [

	formats := anObject
]

{ #category : #parsing }
PharoOWSServiceWMSOperation >> parseElement [

	| text |
	name := (self xmlElement name).
	formats := OrderedCollection new.
	(self xmlElement descendantElementsNamed: 'Format') do: [ :format |
    text := format strings first.  
    formats add: text.  
	].
]
