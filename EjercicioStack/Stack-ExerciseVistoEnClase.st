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


!classDefinition: #OOStackStatus category: #'Stack-Exercise'!
Object subclass: #OOStackStatus
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

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


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


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
