Class {
	#name : 'VVJShufflerResult',
	#superclass : 'Object',
	#instVars : [
		'shuffler'
	],
	#category : 'VVJValidator',
	#package : 'VVJValidator'
}

{ #category : 'testing' }
VVJShufflerResult >> isError [
	^ false
]

{ #category : 'accessing' }
VVJShufflerResult >> shuffler [

	^ shuffler
]

{ #category : 'accessing' }
VVJShufflerResult >> shuffler: anObject [

	shuffler := anObject
]
