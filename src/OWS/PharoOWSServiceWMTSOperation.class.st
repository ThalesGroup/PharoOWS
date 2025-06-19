Class {
	#name : #PharoOWSServiceWMTSOperation,
	#superclass : #PharoOWSServiceXMLElement,
	#category : #'OWS-Service'
}

{ #category : #parsing }
PharoOWSServiceWMTSOperation >> parseElement [

	name := (self xmlElement attributeAt:'name').
]
