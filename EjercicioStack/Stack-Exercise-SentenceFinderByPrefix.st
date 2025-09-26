!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'Pila'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'AC 9/25/2025 15:58:42'!
initialize
Pila := OrderedCollection new.
! !


!OOStack methodsFor: 'status' stamp: 'AC 9/25/2025 18:16:11'!
getState
	^OOStackStatus getStatefor: self.! !

!OOStack methodsFor: 'status' stamp: 'Ale 9/19/2025 21:24:20'!
isEmpty
^Pila isEmpty.! !

!OOStack methodsFor: 'status' stamp: 'Ale 9/19/2025 21:49:17'!
size

^Pila size .! !

!OOStack methodsFor: 'status' stamp: 'AC 9/25/2025 16:18:42'!
top
	^self getState top.! !

!OOStack methodsFor: 'status' stamp: 'AC 9/25/2025 16:15:13'!
topWhenEmpty
	self error: self class stackEmptyErrorDescription.
! !

!OOStack methodsFor: 'status' stamp: 'AC 9/25/2025 16:15:21'!
topWhenNotEmpty
	^Pila first.! !


!OOStack methodsFor: 'edit' stamp: 'Ale 9/19/2025 21:39:35'!
pop

	self top.
	^Pila removeFirst. ! !

!OOStack methodsFor: 'edit' stamp: 'Ale 9/19/2025 21:27:06'!
push: anElement

	Pila addFirst: anElement .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #OOStackPositions category: #'Stack-Exercise'!
Object subclass: #OOStackPositions
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackPositions methodsFor: 'accesing' stamp: 'Ale 9/21/2025 19:24:46'!
element
	self subclassResponsibility.! !

!OOStackPositions methodsFor: 'accesing' stamp: 'Ale 9/21/2025 19:42:55'!
getStack
	^stack .! !


!OOStackPositions methodsFor: 'initialization' stamp: 'Ale 9/21/2025 19:28:27'!
initializeWithStack:anStack
	stack := anStack.! !


!classDefinition: #StackBase category: #'Stack-Exercise'!
OOStackPositions subclass: #StackBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBase methodsFor: 'accesing' stamp: 'Ale 9/21/2025 19:31:47'!
element
	
	stack error: stack class stackEmptyErrorDescription.! !


!classDefinition: #StackElementPosition category: #'Stack-Exercise'!
OOStackPositions subclass: #StackElementPosition
	instanceVariableNames: 'PreviousPosition element'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElementPosition methodsFor: 'accesing' stamp: 'Ale 9/21/2025 19:32:50'!
element
	^element .! !

!StackElementPosition methodsFor: 'accesing' stamp: 'Ale 9/21/2025 19:52:41'!
getPrevious
	^PreviousPosition .! !


!StackElementPosition methodsFor: 'initialization' stamp: 'Ale 9/21/2025 19:44:28'!
initializeWithElement:anElement andPrevious: anStackPosition
	self initializeWithStack: anStackPosition getStack. 
	element := anElement.
	PreviousPosition := anStackPosition .! !


!classDefinition: #OOStackStatus category: #'Stack-Exercise'!
Object subclass: #OOStackStatus
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'Lu 9/25/2025 21:47:27'!
findSentencesWithPrefix: aPrefix for: aSentenceFinderByPrefix

	self subclassResponsibility! !

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'AC 9/25/2025 16:00:35'!
initializeForStack: aStack

stack := aStack .! !

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'AC 9/25/2025 16:13:42'!
top

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStatus class' category: #'Stack-Exercise'!
OOStackStatus class
	instanceVariableNames: ''!

!OOStackStatus class methodsFor: 'as yet unclassified' stamp: 'AC 9/25/2025 16:10:28'!
canHandle: anStack

	self subclassResponsibility! !

!OOStackStatus class methodsFor: 'as yet unclassified' stamp: 'AC 9/25/2025 16:09:06'!
for: aStack
	^self new initializeForStack: aStack .! !

!OOStackStatus class methodsFor: 'as yet unclassified' stamp: 'AC 9/25/2025 18:16:11'!
getStatefor: aStack
	^(OOStackStatus subclasses detect:[:aSubclass | aSubclass canHandle: aStack]) for: aStack.! !


!classDefinition: #EmptyStackState category: #'Stack-Exercise'!
OOStackStatus subclass: #EmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackState methodsFor: 'as yet unclassified' stamp: 'Lu 9/25/2025 21:48:04'!
findSentencesWithPrefix: aPrefix for: aSentenceFinderByPrefix

	^aSentenceFinderByPrefix findSentencesOnEmptyStackWithPrefix: aPrefix.! !

!EmptyStackState methodsFor: 'as yet unclassified' stamp: 'AC 9/25/2025 18:14:06'!
top
	^stack topWhenEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStackState class' category: #'Stack-Exercise'!
EmptyStackState class
	instanceVariableNames: ''!

!EmptyStackState class methodsFor: 'as yet unclassified' stamp: 'AC 9/25/2025 16:10:20'!
canHandle: anStack
	^anStack isEmpty.! !


!classDefinition: #NotEmptyStackState category: #'Stack-Exercise'!
OOStackStatus subclass: #NotEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStackState methodsFor: 'as yet unclassified' stamp: 'Lu 9/25/2025 21:47:01'!
findSentencesWithPrefix: aPrefix for: aSentenceFinderByPrefix

	^aSentenceFinderByPrefix findSentencesOnNotEmptyStackWithPrefix: aPrefix.! !

!NotEmptyStackState methodsFor: 'as yet unclassified' stamp: 'AC 9/25/2025 18:14:12'!
top
	^stack topWhenNotEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyStackState class' category: #'Stack-Exercise'!
NotEmptyStackState class
	instanceVariableNames: ''!

!NotEmptyStackState class methodsFor: 'as yet unclassified' stamp: 'AC 9/25/2025 16:10:57'!
canHandle: anStack
	^anStack isEmpty not.! !


!classDefinition: #Prefix category: #'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Prefix methodsFor: 'initialization' stamp: 'Lu 9/25/2025 20:32:12'!
initializeWithString: aString

	value := aString.! !


!Prefix methodsFor: 'evaluating' stamp: 'Lu 9/25/2025 21:52:58'!
isPrefixOf: aString
	
	^ aString is: value substringAt:  1.

! !


!Prefix methodsFor: 'accessing' stamp: 'Lu 9/25/2025 20:52:55'!
prefixValue

	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prefix class' category: #'Stack-Exercise'!
Prefix class
	instanceVariableNames: ''!

!Prefix class methodsFor: 'errors' stamp: 'Lu 9/25/2025 20:47:12'!
errorBlankSpacesInPrefix

	^'Prefix must not contain blank spaces.'! !

!Prefix class methodsFor: 'errors' stamp: 'Lu 9/25/2025 20:47:18'!
errorEmptyPrefix

	^ 'Prefix must not be empty.'! !


!Prefix class methodsFor: 'instance creation' stamp: 'Lu 9/25/2025 20:48:21'!
createFor: aString.
	
	aString isEmpty ifTrue: self errorEmptyPrefix.
	(aString findString: ' ' startingAt: 1) !!= 0 ifTrue: self errorBlankSpacesInPrefix.
	
	^self new initializeWithString: aString.! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'Lu 9/25/2025 21:56:58'!
initializeForStack: aStack

	stack := aStack .! !


!SentenceFinderByPrefix methodsFor: 'evaluating' stamp: 'Lu 9/25/2025 21:48:33'!
findSentencesOnEmptyStackWithPrefix: aPrefix.

	^OrderedCollection new.! !

!SentenceFinderByPrefix methodsFor: 'evaluating' stamp: 'Lu 9/25/2025 21:56:28'!
findSentencesOnNotEmptyStackWithPrefix: aPrefix
	| sentence result |
	
	sentence := stack pop.
	
	result := self findSentencesWithPrefix: aPrefix. 
	
	(aPrefix isPrefixOf: sentence) ifTrue: [result add: sentence].
	
	stack push: sentence.
	
	^result.! !

!SentenceFinderByPrefix methodsFor: 'evaluating' stamp: 'Lu 9/25/2025 21:58:02'!
findSentencesWithPrefix: aPrefix
		
	^ stack getState findSentencesWithPrefix: aPrefix for: self.	! !

!SentenceFinderByPrefix methodsFor: 'evaluating' stamp: 'Lu 9/25/2025 21:57:27'!
findSentencesWithStringPrefix: aString
	
	|prefix|
	
	prefix := Prefix createFor: aString.	
	
	^ self findSentencesWithPrefix: prefix.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'Lu 9/25/2025 20:29:47'!
createFor: aStack
	^self new initializeForStack: aStack .! !


!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
