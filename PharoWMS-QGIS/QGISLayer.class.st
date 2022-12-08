Class {
	#name : #QGISLayer,
	#superclass : #Object,
	#instVars : [
		'xmlElement',
		'name',
		'title'
	],
	#category : #'PharoWMS-QGIS'
}

{ #category : #'instance creation' }
QGISLayer class >> fromXMLLayer: aXMLElement [

	| tmp |
	tmp := self new.
	tmp xmlElement: aXMLElement.
	tmp parseElement.
	^ tmp
]

{ #category : #'instance creation' }
QGISLayer class >> fromXMLList: aList [
^aList collect: [ :e | self fromXMLLayer: e ].
]

{ #category : #accessing }
QGISLayer >> name [

	^ name
]

{ #category : #accessing }
QGISLayer >> name: anObject [

	name := anObject
]

{ #category : #parsing }
QGISLayer >> parseElement [

	name := (self xmlElement elementAt:'Name') strings first.
	title := (self xmlElement elementAt: 'Title') strings first.
]

{ #category : #printing }
QGISLayer >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' <'.
	aStream nextPutAll: self name.
	aStream nextPutAll: '>'.
]

{ #category : #accessing }
QGISLayer >> title [

	^ title
]

{ #category : #accessing }
QGISLayer >> title: anObject [

	title := anObject
]

{ #category : #accessing }
QGISLayer >> xmlElement [

	^ xmlElement
]

{ #category : #accessing }
QGISLayer >> xmlElement: anObject [

	xmlElement := anObject
]
