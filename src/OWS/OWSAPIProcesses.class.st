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
OWSAPIProcesses >> process: id params: aJsonDict [

	| params json entity res |
	params := '/processes/', id, '/execution?f=json'.
	json := NeoJSONWriter toString: aJsonDict.
	
	entity := ZnEntity text: json.
   entity contentType: ZnMimeType applicationJson.

	res := self client 
	   url: self url, params;
	   entity: entity;
	   post.
	
	^ NeoJSONReader fromString: res
]

{ #category : #private }
OWSAPIProcesses >> processes [

	| params json |
	params := '/processes?f=json'.
	json := self client get: self url, params.
	^ (NeoJSONReader  fromString: json) at: 'processes'
]
