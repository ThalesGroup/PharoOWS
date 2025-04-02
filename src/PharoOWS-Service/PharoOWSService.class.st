Class {
	#name : #PharoOWSService,
	#superclass : #Object,
	#instVars : [
		'host',
		'port',
		'endpoint',
		'client',
		'capabilities'
	],
	#category : #'PharoOWS-Service'
}

{ #category : #'instance creation' }
PharoOWSService class >> host: aName port: aPort [

	| qc |
	qc  := self basicNew.
	qc
		host: aName;
		port: aPort;
		yourself.
	^ qc
]

{ #category : #'instance creation' }
PharoOWSService class >> new [
^self host:'localhost' port:80.
]

{ #category : #accessing }
PharoOWSService >> baseUrl [

	| baseUrl |
	baseUrl ifNil: [
		baseUrl := 'http://' , self host , ':' , self port asString
		           ,
		           (self endpoint ifNil: [ '' ] ifNotNil: [ :e | '/' , e  ]) ].
	^ baseUrl
]

{ #category : #api }
PharoOWSService >> capabilities [
^self subclassResponsibility
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

{ #category : #accessing }
PharoOWSService >> endpoint [

	^ endpoint
]

{ #category : #accessing }
PharoOWSService >> endpoint: anObject [

	endpoint := anObject
]

{ #category : #accessing }
PharoOWSService >> host [

	^ host ifNil: [ host := 'localhost' ]
]

{ #category : #accessing }
PharoOWSService >> host: anObject [

	host := anObject
]

{ #category : #api }
PharoOWSService >> isRunning [

	^ '*http://www.opengis.net/ogc*' match:
		  (self client get: self baseUrl)
]

{ #category : #api }
PharoOWSService >> layers [

	^PharoOWSServiceLayer fromXMLList:
		((self capabilities document descendantElementsNamed: 'Layer') first
			 descendantElementsNamed: 'Layer')
]

{ #category : #accessing }
PharoOWSService >> port [

	^ port ifNil: [ port := 80 ]
]

{ #category : #accessing }
PharoOWSService >> port: anObject [

	port := anObject
]
