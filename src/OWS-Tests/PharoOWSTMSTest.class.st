Class {
	#name : #PharoOWSTMSTest,
	#superclass : #TestCase,
	#category : #'OWS-Tests'
}

{ #category : #tests }
PharoOWSTMSTest >> testTile [

	| tms tile |
	tms := PharoOWSTMS new.
	tms url: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'.

	tile := tms tile: 0 y: 0 z: 0.

	self assert: tile height equals: 256.
	self assert: tile width equals: 256
]
