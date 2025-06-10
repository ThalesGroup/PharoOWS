Class {
	#name : #PharoOWSServiceWMTSOperation,
	#superclass : #PharoOWSServiceXMLElement,
	#category : #'PharoOWS-Service'
}

{ #category : #parsing }
PharoOWSServiceWMTSOperation >> parseElement [

	name := (self xmlElement attributeAt:'name').
]
