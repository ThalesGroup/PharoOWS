Class {
	#name : #OWSAPIProcessesTest,
	#superclass : #TestCase,
	#instVars : [
		'api'
	],
	#category : #'OWS-Tests'
}

{ #category : #running }
OWSAPIProcessesTest >> setUp [
	super setUp.

	api := OWSAPIProcesses new.
	api url: 'https://demo.pygeoapi.io/master/'.
]

{ #category : #tests }
OWSAPIProcessesTest >> testConformance [

	| json |
	
	json := api conformance.
	self assert: (json isCollection).
]

{ #category : #tests }
OWSAPIProcessesTest >> testJobs [

	| json |
	
	json := api jobs.
   self assert: (json isCollection).
]

{ #category : #tests }
OWSAPIProcessesTest >> testLandingPage [

	| json |
	
	json := api landingpage.
	
   self assert: (json includesKey: 'links').
   self assert: (json includesKey: 'description').
   self assert: (json includesKey: 'title').
]

{ #category : #tests }
OWSAPIProcessesTest >> testProcesses [

	| json |
	
	json := api processes.
	self assert: json size equals: 6.
	
   json := api process: 'hello-world'.
   self assert: (json at: 'id') equals: 'hello-world'.
]
