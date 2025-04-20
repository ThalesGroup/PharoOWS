Class {
	#name : #PharoOWSService,
	#superclass : #Object,
	#instVars : [
		'url',
		'client',
		'capabilities'
	],
	#category : #'PharoOWS-Service'
}

{ #category : #'instance creation' }
PharoOWSService class >> new [
^self url:'localhost'
]

{ #category : #'instance creation' }
PharoOWSService class >> url: aUrl [
	| qc |
	qc  := self basicNew.
	qc
		url: aUrl;
		yourself.
	^ qc
]

{ #category : #api }
PharoOWSService >> capabilities [

	| capabilitiesUrl xml |
	capabilities ifNil: [
		capabilitiesUrl := self url , '&REQUEST=GetCapabilities'.
		xml := self client get: url.
		capabilities := (XMLDOMParser parse: xml) document ].
	^ capabilities
]

{ #category : #accessing }
PharoOWSService >> client [
	client ifNil:[client := ZnClient new].
	^ client
]

{ #category : #accessing }
PharoOWSService >> client: anObject [

	client := anObject
]

{ #category : #api }
PharoOWSService >> isRunning [

	| isValid response |
	isValid := false.

	[ 
		response := self client get: self url.
   		isValid := response isSuccess
	] on: ZnHttpUnsuccessful do: [ :ex |
	   isValid := false
	].

	^ isValid
]

{ #category : #api }
PharoOWSService >> layers [

	^PharoOWSServiceLayer fromXMLList:
		((self capabilities document descendantElementsNamed: 'Layer') first
			 descendantElementsNamed: 'Layer')
]

{ #category : #accessing }
PharoOWSService >> url [

	^ url ifNil: [ url := 'localhost' ]
]

{ #category : #accessing }
PharoOWSService >> url: anObject [

	url := anObject
]
