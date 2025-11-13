Class {
	#name : 'FSEntry',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'Visitor-Composite',
	#package : 'Visitor-Composite'
}

{ #category : 'as yet unclassified' }
FSEntry >> match: aString in: aPattern [
	^ aString beginsWith: aPattern
]

{ #category : 'accessing' }
FSEntry >> name [
	^name
]

{ #category : 'accessing' }
FSEntry >> name: aName [
	name := aName
]

{ #category : 'as yet unclassified' }
FSEntry >> searchByName: aString [
	self subclassResponsibility 
]
