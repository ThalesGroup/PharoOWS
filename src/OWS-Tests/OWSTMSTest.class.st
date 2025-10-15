Class {
	#name : #OWSTMSTest,
	#superclass : #TestCase,
	#instVars : [
		'tms'
	],
	#category : #'OWS-Tests'
}

{ #category : #running }
OWSTMSTest >> setUp [

	super setUp.

	tms := OWSTMS new
]

{ #category : #tests }
OWSTMSTest >> testTile [

	| tile |
	tms url: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'.

	tile := tms tile: 0 y: 0 z: 0.
	self assert: tile height equals: 256.
	self assert: tile width equals: 256
]

{ #category : #tests }
OWSTMSTest >> testTileNotExists [

	| tile |
	tms url: 'https://tile.thisdomaindoesnotexist.org/{z}/{x}/{y}.png'.

	tile := tms tile: 0 y: 0 z: 0.
	self assert: tile isNil
]
