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

{ #category : #private }
OWSAPIProcesses >> execute: id params: aJsonDict [

	| params res |
	params := '/processes/', id, '/execution?f=json'.
	res := self client get: self url, params.
	^ res
]

{ #category : #accessing }
OWSAPIProcesses >> job: id [ 

	| params json |
	params := '/jobs/', id, '?f=json'.
	json := self client get: self url, params.
	^ NeoJSONReader  fromString: json
]

{ #category : #'as yet unclassified' }
OWSAPIProcesses >> jobs [

	| params json |
	params := '/jobs?f=json'.
	json := self client get: self url, params.
	^ (NeoJSONReader  fromString: json) at: 'jobs'
]

{ #category : #accessing }
OWSAPIProcesses >> process: id [ 

	| params json |
	params := '/processes/', id, '?f=json'.
	json := self client get: self url, params.
	^ NeoJSONReader  fromString: json
]

{ #category : #private }
OWSAPIProcesses >> processes [

	| params json |
	params := '/processes?f=json'.
	json := self client get: self url, params.
	^ (NeoJSONReader  fromString: json) at: 'processes'
]
