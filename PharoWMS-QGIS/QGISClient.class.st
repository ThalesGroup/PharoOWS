Class {
	#name : #QGISClient,
	#superclass : #Object,
	#instVars : [
		'host',
		'port',
		'endpoint',
		'client',
		'capabilities'
	],
	#category : #'PharoWMS-QGIS'
}

{ #category : #'instance creation' }
QGISClient class >> host: aName port: aPort [

	| qc |
	qc  := self basicNew.
	qc
		host: aName;
		port: aPort;
		yourself.
	^ qc
]

{ #category : #'instance creation' }
QGISClient class >> new [
^self host:'localhost' port:80.
]

{ #category : #accessing }
QGISClient >> baseUrl [

	| baseUrl |
	baseUrl ifNil: [ 
		baseUrl := 'http://' , self host , ':' , self port asString
		           ,
		           (self endpoint ifNil: [ '' ] ifNotNil: [ :e | '/' , e  ]) ].
	^ baseUrl
]

{ #category : #api }
QGISClient >> capabilities [
^self subclassResponsibility 
]

{ #category : #accessing }
QGISClient >> client [
	client ifNil:[client := ZnClient new].
	^ client
]

{ #category : #accessing }
QGISClient >> client: anObject [

	client := anObject
]

{ #category : #accessing }
QGISClient >> endpoint [

	^ endpoint
]

{ #category : #accessing }
QGISClient >> endpoint: anObject [

	endpoint := anObject
]

{ #category : #accessing }
QGISClient >> host [

	^ host ifNil: [ host := 'localhost' ]
]

{ #category : #accessing }
QGISClient >> host: anObject [

	host := anObject
]

{ #category : #api }
QGISClient >> isRunning [

	^ '*http://www.opengis.net/ogc*' match:
		  (self client get: self baseUrl)
]

{ #category : #api }
QGISClient >> layers [

	^QGISLayer fromXMLList:
		((self capabilities document descendantElementsNamed: 'Layer') first 
			 descendantElementsNamed: 'Layer')
]

{ #category : #accessing }
QGISClient >> port [

	^ port ifNil: [ port := 80 ]
]

{ #category : #accessing }
QGISClient >> port: anObject [

	port := anObject
]
