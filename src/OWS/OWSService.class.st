Class {
	#name : #OWSService,
	#superclass : #Object,
	#instVars : [
		'capabilities',
		'url',
		'client'
	],
	#category : #'OWS-Service'
}

{ #category : #'instance creation' }
OWSService class >> new [
^self url:'localhost'
]

{ #category : #'instance creation' }
OWSService class >> url: aUrl [
	| qc |
	qc  := self basicNew.
	qc
		url: aUrl;
		yourself.
	^ qc
]

{ #category : #api }
OWSService >> capabilities [

	| params xml |
	capabilities ifNil: [
		params := '&REQUEST=GetCapabilities'.
		xml := self client get: self url, params.
		capabilities := (XMLDOMParser parse: xml) document].
	^ capabilities
]

{ #category : #accessing }
OWSService >> client [
	client ifNil:[client := ZnClient new].
	^ client
]

{ #category : #accessing }
OWSService >> client: anObject [

	client := anObject
]

{ #category : #api }
OWSService >> layers [

	^OWSServiceWMSLayer fromXMLList:
		((self capabilities document descendantElementsNamed: 'Layer') first
			 descendantElementsNamed: 'Layer')
]

{ #category : #accessing }
OWSService >> url [

	^ url ifNil: [ url := 'localhost' ]
]

{ #category : #accessing }
OWSService >> url: anObject [

	url := anObject
]

{ #category : #versions }
OWSService >> version [

	^ self capabilities root attributeAt: 'version' ifAbsent: [ '' ]
]
