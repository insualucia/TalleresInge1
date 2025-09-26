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

!Prefix methodsFor: 'initialization' stamp: 'AC 9/26/2025 11:07:00'!
initializeWithValue: aString forSentence: aSentence

	self subclassResponsibility! !


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

!Prefix class methodsFor: 'errors' stamp: 'AC 9/26/2025 12:32:31'!
emptyPrefixErrorDescription

	^ 'Prefix must not be empty.'! !

!Prefix class methodsFor: 'errors' stamp: 'AC 9/26/2025 12:32:41'!
errorBlankSpacesInPrefixDescription

	^'Prefix must not contain blank spaces.'! !


!Prefix class methodsFor: 'instance creation' stamp: 'AC 9/26/2025 13:25:58'!
createPrefix: aStringPrefix 
	^ (self subclasses detect:[:aSubclass | aSubclass canHandlePrefix:aStringPrefix ] ifNone: [^NotSentencePrefix]) new initializeWithValue: aStringPrefix.! !

!Prefix class methodsFor: 'instance creation' stamp: 'AC 9/26/2025 13:25:12'!
createPrefix: aStringPrefix forSentence: aSentence.
	
	^ (self subclasses detect:[:aSubclass | aSubclass canHandlePrefix:aStringPrefix  forSentence:aSentence ] )new initializeWithValue: aStringPrefix forSentence: aSentence ! !


!Prefix class methodsFor: 'as yet unclassified' stamp: 'AC 9/26/2025 12:18:21'!
canHandlePrefix: aStringPrefix

	self subclassResponsibility! !

!Prefix class methodsFor: 'as yet unclassified' stamp: 'AC 9/26/2025 11:00:30'!
canHandlePrefix: aStringPrefix forSentence: aSentence

	self subclassResponsibility! !


!classDefinition: #EmptyPrefix category: #'Stack-Exercise'!
Prefix subclass: #EmptyPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyPrefix methodsFor: 'initialization' stamp: 'AC 9/26/2025 12:24:58'!
initializeWithValue: aString
	self error: self class emptyPrefixErrorDescription.! !

!EmptyPrefix methodsFor: 'initialization' stamp: 'AC 9/26/2025 12:24:37'!
initializeWithValue: aString forSentence: aSentence
	self initializeWithValue: aString .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyPrefix class' category: #'Stack-Exercise'!
EmptyPrefix class
	instanceVariableNames: ''!

!EmptyPrefix class methodsFor: 'as yet unclassified' stamp: 'AC 9/26/2025 12:18:53'!
canHandlePrefix: aStringPrefix
	^aStringPrefix isEmpty! !

!EmptyPrefix class methodsFor: 'as yet unclassified' stamp: 'AC 9/26/2025 12:18:46'!
canHandlePrefix: aStringPrefix forSentence:aSentence
	^self canHandlePrefix: aStringPrefix .! !


!classDefinition: #NotSentencePrefix category: #'Stack-Exercise'!
Prefix subclass: #NotSentencePrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotSentencePrefix methodsFor: 'as yet unclassified' stamp: 'AC 9/26/2025 11:45:17'!
addSentenceWithPrefixTo: aCollection! !


!NotSentencePrefix methodsFor: 'initialization' stamp: 'AC 9/26/2025 12:57:48'!
initializeWithValue: aString
	value := aString .! !

!NotSentencePrefix methodsFor: 'initialization' stamp: 'AC 9/26/2025 11:44:51'!
initializeWithValue: aString forSentence: aSentence
	value := aString .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotSentencePrefix class' category: #'Stack-Exercise'!
NotSentencePrefix class
	instanceVariableNames: ''!

!NotSentencePrefix class methodsFor: 'as yet unclassified' stamp: 'AC 9/26/2025 13:11:11'!
canHandlePrefix: aStringPrefix
	^false! !

!NotSentencePrefix class methodsFor: 'as yet unclassified' stamp: 'AC 9/26/2025 11:33:01'!
canHandlePrefix: aStringPrefix forSentence: aSentence
	^(aSentence is:aStringPrefix substringAt:1) not and:
	[
		(PrefixWithBlankSpaces canHandlePrefix: aStringPrefix forSentence: aSentence )not
	]! !


!classDefinition: #PrefixWithBlankSpaces category: #'Stack-Exercise'!
Prefix subclass: #PrefixWithBlankSpaces
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PrefixWithBlankSpaces methodsFor: 'initialization' stamp: 'AC 9/26/2025 12:25:46'!
initializeWithValue: aString 
	self error: self class errorBlankSpacesInPrefixDescription.! !

!PrefixWithBlankSpaces methodsFor: 'initialization' stamp: 'AC 9/26/2025 12:25:35'!
initializeWithValue: aString forSentence: aSentence
	self initializeWithValue: aString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefixWithBlankSpaces class' category: #'Stack-Exercise'!
PrefixWithBlankSpaces class
	instanceVariableNames: ''!

!PrefixWithBlankSpaces class methodsFor: 'as yet unclassified' stamp: 'AC 9/26/2025 12:19:51'!
canHandlePrefix: aStringPrefix
	^(aStringPrefix findString: ' ' startingAt: 1) !!= 0! !

!PrefixWithBlankSpaces class methodsFor: 'as yet unclassified' stamp: 'AC 9/26/2025 12:19:46'!
canHandlePrefix: aStringPrefix forSentence: aSentence
	^self canHandlePrefix: aStringPrefix .
	! !


!classDefinition: #SentencePrefix category: #'Stack-Exercise'!
Prefix subclass: #SentencePrefix
	instanceVariableNames: 'sentence'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentencePrefix methodsFor: 'initialization' stamp: 'AC 9/26/2025 11:15:11'!
initializeWithValue: aString forSentence: aSentence

	value := aString.
	sentence := aSentence.! !


!SentencePrefix methodsFor: 'as yet unclassified' stamp: 'AC 9/26/2025 11:42:38'!
addSentenceWithPrefixTo: aCollection
	aCollection add: sentence.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentencePrefix class' category: #'Stack-Exercise'!
SentencePrefix class
	instanceVariableNames: ''!

!SentencePrefix class methodsFor: 'as yet unclassified' stamp: 'AC 9/26/2025 13:10:03'!
canHandlePrefix: aStringPrefix
	^false! !

!SentencePrefix class methodsFor: 'as yet unclassified' stamp: 'AC 9/26/2025 11:27:31'!
canHandlePrefix: aStringPrefix forSentence: aSentence
	^ (aSentence is: aStringPrefix substringAt:  1) and:
	[
		(EmptyPrefix canHandlePrefix: aStringPrefix forSentence: aSentence )not and:
		[
			(PrefixWithBlankSpaces canHandlePrefix:aStringPrefix  forSentence: aSentence )not
		]
	].! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'Lu 9/25/2025 21:56:58'!
initializeForStack: aStack

	stack := aStack .! !


!SentenceFinderByPrefix methodsFor: 'evaluating' stamp: 'AC 9/26/2025 13:26:29'!
findSentencesOnEmptyStackWithPrefix: aStringPrefix.

	Prefix createPrefix: aStringPrefix.
	^Bag new.! !

!SentenceFinderByPrefix methodsFor: 'evaluating' stamp: 'AC 9/26/2025 11:48:00'!
findSentencesOnNotEmptyStackWithPrefix: aPrefix
	| sentence sentencesWithPrefix |
	
	sentence := stack pop.
	
	sentencesWithPrefix := self findSentencesWithPrefix: aPrefix. 
	
	(Prefix createPrefix: aPrefix forSentence: sentence) addSentenceWithPrefixTo:sentencesWithPrefix.
	
	stack push: sentence.
	
	^sentencesWithPrefix.! !

!SentenceFinderByPrefix methodsFor: 'evaluating' stamp: 'AC 9/26/2025 11:34:17'!
findSentencesWithPrefix: aStringPrefix
		
	^ stack getState findSentencesWithPrefix: aStringPrefix for: self.	! !

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

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AC 9/26/2025 12:29:45'!
test01SearchEmptyPrefixInEmptyStackShouldReturnErrorEmptyPrefix

	| stack prefix sentenceFinder|
	
	stack := OOStack new.
	prefix := ''.
	
	sentenceFinder := SentenceFinderByPrefix createFor: stack.
	
	self
		should: [ sentenceFinder findSentencesWithPrefix: prefix ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Prefix emptyPrefixErrorDescription ]
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AC 9/26/2025 12:32:20'!
test02SearchSpacePrefixInEmptyStackShouldReturnErrorContainBlanckSpaces

	| stack prefix sentenceFinder|
	
	stack := OOStack new.
	prefix := ' '.
	
	sentenceFinder := SentenceFinderByPrefix createFor: stack.
	
	self
		should: [ sentenceFinder findSentencesWithPrefix: prefix ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Prefix errorBlankSpacesInPrefixDescription ]
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AC 9/26/2025 12:34:14'!
test03SearchEmptyPrefixShouldReturnErrorEmptyPrefix

	| stack prefix sentenceFinder|
	
	stack := OOStack new.
	stack push: 'Must be the water'.
	prefix := ''.
	
	sentenceFinder := SentenceFinderByPrefix createFor: stack.
	
	self
		should: [ sentenceFinder findSentencesWithPrefix: prefix ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Prefix emptyPrefixErrorDescription ]
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AC 9/26/2025 12:35:00'!
test04SearchPrefixWithSpacesInEmptyStackShouldReturnErrorContainBlanckSpaces

	| stack prefix sentenceFinder|
	
	stack := OOStack new.
	prefix := 'Must be'.
	
	sentenceFinder := SentenceFinderByPrefix createFor: stack.
	
	self
		should: [ sentenceFinder findSentencesWithPrefix: prefix ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Prefix errorBlankSpacesInPrefixDescription ]
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AC 9/26/2025 12:35:42'!
test05SearchPrefixWithSpacesShouldReturnErrorContainBlanckSpaces

	| stack prefix sentenceFinder|
	
	stack := OOStack new.
	stack push: 'Must be the water'.
	prefix := 'Must be'.
	
	sentenceFinder := SentenceFinderByPrefix createFor: stack.
	
	self
		should: [ sentenceFinder findSentencesWithPrefix: prefix ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Prefix errorBlankSpacesInPrefixDescription ]
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AC 9/26/2025 13:03:41'!
test06SearchPrefixDoesNotAppearInStackShouldReturnEmptyCollection

	| stack prefix sentenceFinder expectedResult sentence |
	
	stack := OOStack new.
	sentence := 'Just an Inchident'.
	stack push: sentence.
	prefix := 'Must'.
	
	sentenceFinder := SentenceFinderByPrefix createFor: stack.
	
	expectedResult := Bag new.
	
	self assert: [sentenceFinder findSentencesWithPrefix: prefix] value equals: expectedResult.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AC 9/26/2025 13:27:34'!
test07SearchPrefixAppearInStackShouldReturnCollectionWithSentence

	| stack prefix sentenceFinder expectedResult sentence |
	
	stack := OOStack new.
	sentence := 'Just an Inchident'.
	stack push: sentence.
	prefix := 'Just'.
	
	sentenceFinder := SentenceFinderByPrefix createFor: stack.
	
	expectedResult := Bag new.
	expectedResult add: sentence.
	
	self assert: [sentenceFinder findSentencesWithPrefix: prefix] value equals: expectedResult.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AC 9/26/2025 13:28:54'!
test08SearchPrefixShouldBeCaseSensitive
	| stack prefix sentenceFinder sentence1 sentence2 sentence3 expectedResult |
	
	stack := OOStack new.
	sentence1 := 'Just an Inchident'.
	sentence2 := 'Must be the Water'.
	sentence3 := 'justice league'.
	stack push: sentence1.
	stack push: sentence2.
	stack push: sentence3.
	prefix := 'Jus'.
	
	sentenceFinder := SentenceFinderByPrefix createFor: stack.
	
	expectedResult := Bag new.
	expectedResult add: sentence1.
	
	self assert: [sentenceFinder findSentencesWithPrefix: prefix] value equals: expectedResult .! !
