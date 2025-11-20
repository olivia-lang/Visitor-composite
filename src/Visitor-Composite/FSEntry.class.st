Class {
	#name : 'FSEntry',
	#superclass : 'Object',
	#instVars : [
		'name',
		'parent'
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

{ #category : 'accessing' }
FSEntry >> parent [
	^parent
]

{ #category : 'accessing' }
FSEntry >> parent: anEntry [
	parent := anEntry 
]

{ #category : 'accessing' }
FSEntry >> path [
	parent isNil
		ifTrue: [ ^ '/' , name ].
		
   ^ parent path , '/' , name
]
