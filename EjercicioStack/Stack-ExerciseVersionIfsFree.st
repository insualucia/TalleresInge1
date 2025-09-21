!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'ActualPosition stackSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'Ale 9/21/2025 19:45:42'!
initialize
ActualPosition := StackBase new initializeWithStack: self.
stackSize := 0.! !


!OOStack methodsFor: 'status' stamp: 'Ale 9/21/2025 18:54:12'!
isEmpty
^ActualPosition isMemberOf: StackBase.! !

!OOStack methodsFor: 'status' stamp: 'Ale 9/21/2025 18:59:35'!
size

^stackSize.! !

!OOStack methodsFor: 'status' stamp: 'Ale 9/21/2025 19:02:11'!
top
^ActualPosition element.! !


!OOStack methodsFor: 'edit' stamp: 'Ale 9/21/2025 19:53:24'!
pop
	|topElement|
	topElement := self top.
	ActualPosition:= ActualPosition getPrevious.
	stackSize := stackSize - 1.
	^topElement. ! !

!OOStack methodsFor: 'edit' stamp: 'Ale 9/21/2025 19:39:28'!
push: anElement
	ActualPosition := StackElementPosition new initializeWithElement:anElement andPrevious: ActualPosition.
	stackSize := stackSize + 1.! !

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
