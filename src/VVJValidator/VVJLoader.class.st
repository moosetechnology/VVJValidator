"
```smalltalk
files := #(
		'/Users/guille/Downloads/cc31/apache/commons/collections/ArrayStack.java'
		'/Users/guille/Downloads/cc31/apache/commons/collections/MapUtils.java').
jar := FileLocator home / 'git/VerveineJ/app/build/libs/VerveineJ-Snapshot.jar'.

model := VVJLoader new
	jar: jar;
	paths: files;
	load.

e := model entityNamed: 'org.apache.commons.collections.ArrayStack.ArrayStack()'.
e incomingInvocations size
```
"
Class {
	#name : 'VVJLoader',
	#superclass : 'VVJHandlerClass',
	#instVars : [
		'outputFilePath',
		'paths'
	],
	#category : 'VVJValidator',
	#package : 'VVJValidator'
}

{ #category : 'parsing' }
VVJLoader >> import [

	^ self ok: (outputFilePath readStreamDo: [ :st | FamixJavaModel new importFromJSONStream: st ])
]

{ #category : 'parsing' }
VVJLoader >> initialize [

	super initialize.
	outputFilePath := (FileSystem workingDirectory / ('output-', UUID new asString)) , 'json'
]

{ #category : 'parsing' }
VVJLoader >> load [

	| result |
	result := self parse.
	result isError ifTrue: [ ^ result ].
	^ self import
]

{ #category : 'accessing' }
VVJLoader >> outputFilePath [

	^ outputFilePath
]

{ #category : 'accessing' }
VVJLoader >> outputFilePath: anObject [

	outputFilePath := anObject
]

{ #category : 'parsing' }
VVJLoader >> parse [

	| arguments err |
	self validate.
	
	arguments := {
				'-jar'.
				jar fullName.
				'-format'.
				'json'.
				'-o'.
				outputFilePath fullName.
			}.
	
	"by default we choose 1.7 version, we could also make it a parameter"
	jdkMode ifTrue: [ 
		arguments := arguments , { '-jdkMode'. '-1.7'. } ].
	
	arguments := arguments , paths.

	OSSUnixSubprocess new
			command: '/usr/bin/java';
			arguments: arguments;
			redirectStdout;
			redirectStderr;
			runAndWaitPollingEvery: (Delay forMilliseconds: 50)
			retrievingStreams: true onExitDo: [ :command :outString :errString | 
				err := errString ].
			
	err ifNotEmpty: [ 
		^ self fail: 'Errors while parsing: ', err ].
	^ self ok: nil
]

{ #category : 'accessing' }
VVJLoader >> paths [

	^ paths
]

{ #category : 'accessing' }
VVJLoader >> paths: anObject [

	paths := anObject
]

{ #category : 'parsing' }
VVJLoader >> validate [
	
	jar asFileReference exists ifFalse: [ 
		self error: 'Missing vvj jar file' ].
]
