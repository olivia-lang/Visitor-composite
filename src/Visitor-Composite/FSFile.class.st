Class {
	#name : 'FSFile',
	#superclass : 'FSEntry',
	#instVars : [
		'contents'
	],
	#category : 'Visitor-Composite',
	#package : 'Visitor-Composite'
}

{ #category : 'accessing' }
FSFile >> contents [
	^contents
]

{ #category : 'accessing' }
FSFile >> contents: aString [
	contents := aString
]

{ #category : 'as yet unclassified' }
FSFile >> searchByContents: aString [

	^(self contents includesSubstring: aString)
		ifTrue: [ self contents ]
]

{ #category : 'as yet unclassified' }
FSFile >> searchByName: aString [
	^ (self match: name in: aString)
		ifTrue: [ self ] 
		ifFalse: [ nil ]
]
