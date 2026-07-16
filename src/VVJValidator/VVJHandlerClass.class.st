"
Common ancestor class used by VVJValidator class to share VVJ specific properties, for example parameter like the jdkMode flag.
"
Class {
	#name : 'VVJHandlerClass',
	#superclass : 'Object',
	#instVars : [
		'jdkMode',
		'jar'
	],
	#category : 'VVJValidator',
	#package : 'VVJValidator'
}

{ #category : 'accessing' }
VVJHandlerClass >> fail: aModel [

	^ VVJShufflerOffendingResult new
		shuffler: self;
		fail: aModel
]

{ #category : 'initialization' }
VVJHandlerClass >> initialize [ 

	super initialize.
	jdkMode := false
]

{ #category : 'accessing' }
VVJHandlerClass >> jar [

	^ jar
]

{ #category : 'as yet unclassified' }
VVJHandlerClass >> jar: aJarPath [

	jar := aJarPath
]

{ #category : 'accessing' }
VVJHandlerClass >> jdkMode [

	^ jdkMode
]

{ #category : 'accessing' }
VVJHandlerClass >> jdkMode: anObject [

	jdkMode := anObject
]

{ #category : 'accessing' }
VVJHandlerClass >> ok [

	^ VVJShufflerOKResult new
		shuffler: self;
		yourself
]

{ #category : 'accessing' }
VVJHandlerClass >> ok: value [

	^ VVJShufflerOKResult new
		shuffler: self;
		value: value;
		yourself
]
