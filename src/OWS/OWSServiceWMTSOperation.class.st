Class {
	#name : #OWSServiceWMTSOperation,
	#superclass : #OWSServiceXMLElement,
	#category : #'OWS-Service'
}

{ #category : #parsing }
OWSServiceWMTSOperation >> parseElement [

	name := (self xmlElement attributeAt:'name').
]
