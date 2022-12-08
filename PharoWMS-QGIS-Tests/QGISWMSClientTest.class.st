"
A QGISWMSClientTest is a test class for testing the behavior of QGISWMSClient
"
Class {
	#name : #QGISWMSClientTest,
	#superclass : #TestCase,
	#category : #'PharoWMS-QGIS-Tests'
}

{ #category : #tests }
QGISWMSClientTest >> testMap [

	| qc map size |
	qc := QGISWMSClient new.
	size := 1920@1080.
	qc endpoint: 'qgisserver'.
	map := qc
		       map: { 'countries'. 'countries_shapeburst' }
		       bounds: (-90 @ -180 corner: 90 @ 180)
				 size: size
		       epsg: '4326'
]
