Class {
	#name : 'VVJShufflerOffendingResult',
	#superclass : 'VVJShufflerResult',
	#instVars : [
		'offending'
	],
	#category : 'VVJValidator',
	#package : 'VVJValidator'
}

{ #category : 'accessing' }
VVJShufflerOffendingResult >> fail: anObject [

	offending := anObject
]

{ #category : 'testing' }
VVJShufflerOffendingResult >> isError [

	^ true
]

{ #category : 'accessing' }
VVJShufflerOffendingResult >> offending [

	^ offending
]
