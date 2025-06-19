Trait {
	#name : #TTestTools,
	#category : #'OWS-Tests'
}

{ #category : #accessing }
TTestTools >> image: aImage [ 

	| morph window |
	morph := ImageMorph new.
	morph image: aImage.
	morph position: 10 @ 40.

	window := SystemWindow new.
	window extent: aImage extent + (20 @ 80).
	window addMorph: morph.

	window openInWorld
]
