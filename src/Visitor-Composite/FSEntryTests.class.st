Class {
	#name : 'FSEntryTests',
	#superclass : 'TestCase',
	#instVars : [
		'fsEntry',
		'rootDirectory',
		'documentsDirectory',
		'file1',
		'file2'
	],
	#category : 'Visitor-Composite',
	#package : 'Visitor-Composite'
}

{ #category : 'running' }
FSEntryTests >> setUp [
	super setUp.
	
	fsEntry := FSEntry new.
	
	rootDirectory := FSDirectory new.
	rootDirectory name: 'root'.
	
	documentsDirectory := FSDirectory new.
	documentsDirectory name: 'documents'.
	
	file1 := FSFile new.
	file1 name: 'file1'.
	file1 contents: 'je suis file1'.
	
	file2 := FSFile new.
	file2 name: 'file2'.
	"Put here a common initialization logic for tests"
	
]

{ #category : 'tests' }
FSEntryTests >> testSearchByContentsFileOne [
"root/
	-- file1 --> 'je suis file1'
"
	|  result |

	rootDirectory addEntry: file1.
	
	result := rootDirectory searchByContents: 'je suis file1'.
	self assert: result equals: file1 contents.
]

{ #category : 'tests' }
FSEntryTests >> testSearchByNameDirectoryInRoot [
"root/
	-- file1
	-- documents/
"
	|  result |

	rootDirectory addEntry: file1.
	
	
	rootDirectory addEntry: documentsDirectory .
	
	result := rootDirectory searchByName: 'documents'.
	self assert: result name equals: documentsDirectory name.
]

{ #category : 'tests' }
FSEntryTests >> testSearchByNameFileInDirectoryInRoot [
"root/
	-- file1
	-- documents/
			-- file2
"
	| result |
	
	rootDirectory addEntry: file1.
	
	rootDirectory addEntry: documentsDirectory .
	documentsDirectory addEntry: file2.
	
	result := rootDirectory searchByName: 'file2'.
	self assert: result name equals: file2 name.
]

{ #category : 'tests' }
FSEntryTests >> testSearchByNameFileOneInRoot [
"root/
	-- file1
"
	| file1 result |
	
	file1 := FSFile new.
	file1 name: 'file1'.

	rootDirectory addEntry: file1.
	
	result := rootDirectory searchByName: 'file1'.
	self assert: result name equals: file1 name.
]

{ #category : 'tests' }
FSEntryTests >> testSearchByNameRootDirectory [
"root/
"
	| result |
	
	result := #rootDirectory searchByName: 'root'.
	
	self assert: result name equals: #rootDirectory name.
]
