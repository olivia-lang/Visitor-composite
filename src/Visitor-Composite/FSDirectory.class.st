Class {
	#name : 'FSDirectory',
	#superclass : 'FSEntry',
	#instVars : [
		'children'
	],
	#classInstVars : [
		'children'
	],
	#category : 'Visitor-Composite',
	#package : 'Visitor-Composite'
}

{ #category : 'adding' }
FSDirectory >> addEntry: anEntry [
	children add: anEntry
]

{ #category : 'accessing' }
FSDirectory >> children [
	^children
]

{ #category : 'initialization' }
FSDirectory >> initialize [
	super initialize.
	children := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
FSDirectory >> searchByContents: aString [

	children do: [ :child |
			| result | 
			result := child searchByContents: aString.
			result ifNotNil: [ ^ result ] ]
]

{ #category : 'as yet unclassified' }
FSDirectory >> searchByName: aString [

	self name = aString ifTrue: [ ^ self ].

	children do: [ :child |
			| result |" on stock le resultat car child est lié avec le premier directory parcouru."
			result := child searchByName: aString.
			result ifNotNil: [ ^ result ] ]
]
