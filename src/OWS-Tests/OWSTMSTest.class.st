Class {
	#name : #OWSTMSTest,
	#superclass : #TestCase,
	#category : #'OWS-Tests'
}

{ #category : #tests }
OWSTMSTest >> testTile [

	| tms tile |
	tms := OWSTMS new.
	tms url: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'.

	tile := tms tile: 0 y: 0 z: 0.

	self assert: tile height equals: 256.
	self assert: tile width equals: 256
]
