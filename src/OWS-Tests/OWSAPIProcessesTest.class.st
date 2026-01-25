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
]

{ #category : #tests }
OWSAPIProcessesTest >> testConformance [

	| json |
	
	api url: 'https://demo.pygeoapi.io/master/'.
	json := api conformance.
]

{ #category : #tests }
OWSAPIProcessesTest >> testJobs [

	| json |
	
	api url: 'https://demo.pygeoapi.io/master/'.
	json := api jobs.
]

{ #category : #tests }
OWSAPIProcessesTest >> testProcesses [

	| json |
	
	api url: 'https://demo.pygeoapi.io/master/'.
	json := api processes.
]
