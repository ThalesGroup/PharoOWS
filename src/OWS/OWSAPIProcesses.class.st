Class {
	#name : #OWSAPIProcesses,
	#superclass : #OWSAPI,
	#category : #'OWS-API'
}

{ #category : #'as yet unclassified' }
OWSAPIProcesses >> conformance [

	| params json |
	params := '/conformance?f=json'.
	json := self client get: self url, params.
	^ (NeoJSONReader  fromString: json) at: 'conformsTo'
]

{ #category : #'as yet unclassified' }
OWSAPIProcesses >> jobs [

	| params json |
	params := '/jobs?f=json'.
	json := self client get: self url, params.
	^ (NeoJSONReader  fromString: json) at: 'jobs'
]

{ #category : #private }
OWSAPIProcesses >> processes [

	| params json |
	params := '/processes?f=json'.
	json := self client get: self url, params.
	^ (NeoJSONReader  fromString: json) at: 'processes'
]
