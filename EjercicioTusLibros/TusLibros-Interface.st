!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HAW 11/8/2024 13:46:36'!
test05WithMock_CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard merchantProcessor mpReceivedMessages debitFromMessage |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
	merchantProcessor := Mock onlyCollecting.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: merchantProcessor
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
	mpReceivedMessages := merchantProcessor receivedMessages.
					
	self assert: 1 equals: mpReceivedMessages size.
	debitFromMessage := mpReceivedMessages first.
	self assert: debitFromMessage selector equals: #debit:from:.
	self assert: debitFromMessage arguments first equals: total.
	self assert: debitFromMessage arguments second equals: creditCard 
	! !

!CashierTest methodsFor: 'tests' stamp: 'ARM 6/17/2025 15:04:52'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: MerchantProcessor creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = MerchantProcessor creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'ARM 6/17/2025 15:05:04'!
test06WithMock_CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard merchantProcessor |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	merchantProcessor := Mock whenReceives: #debit:from: do: [ :amount :aCreditCard | self error: MerchantProcessor creditCardHasNoCreditErrorMessage ].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: merchantProcessor
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = MerchantProcessor creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!classDefinition: #InterfaceTest category: #TusLibros!
TestCase subclass: #InterfaceTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfaceTest methodsFor: 'setUp' stamp: 'AC 11/17/2025 16:19:33'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!InterfaceTest methodsFor: 'merchant processor protocol' stamp: 'AC 11/17/2025 16:20:23'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!InterfaceTest methodsFor: 'tests' stamp: 'AC 11/17/2025 16:27:25'!
test01CreateCartReturnsErrorWhenCredentialsAreIncorrect

|interface|

interface := testObjectsFactory createEmptyInterfaceWithMerchantProcessor: self.

self 
		should: [interface createCart: '00001' authenticateWith: 'wrong password'.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Interface invalidCredentialsErrorMessage.]! !

!InterfaceTest methodsFor: 'tests' stamp: 'AC 11/17/2025 16:47:58'!
test02CreateCartReturnsCartIDWhenCredentialsAreCorrect

|interface cartID|

interface := testObjectsFactory createInterfaceWithDefaultUserAndMerchantProcessor: self .

cartID := interface createCart: testObjectsFactory defaultUser authenticateWith: testObjectsFactory defaultPassword.
		
self assert: (interface listCart: cartID ) isEmpty.! !

!InterfaceTest methodsFor: 'tests' stamp: 'AC 11/17/2025 16:48:05'!
test03CreatingMoreThanOneCartReturnsDifferentIDs

|interface cartID cartID2 |

interface := testObjectsFactory createInterfaceWithDefaultUserAndMerchantProcessor: self.

cartID := interface createCart: testObjectsFactory defaultUser authenticateWith: testObjectsFactory defaultPassword.

cartID2 := interface createCart: testObjectsFactory defaultUser authenticateWith: testObjectsFactory defaultPassword.
		
self deny: cartID  = cartID2.! !

!InterfaceTest methodsFor: 'tests' stamp: 'AC 11/17/2025 16:48:15'!
test04ListCartWithRepeatedItemsShowsCorrectAmountOfItems

|interface cartID expectedCartList|

interface := testObjectsFactory createInterfaceWithDefaultUserAndMerchantProcessor: self.

cartID := interface createCart: testObjectsFactory defaultUser authenticateWith: testObjectsFactory defaultPassword.

interface add: 33 of: testObjectsFactory itemSellByTheStore to: cartID. 

expectedCartList :=Dictionary new.
expectedCartList at: testObjectsFactory itemSellByTheStore put: 33.
		
self assert: (interface listCart: cartID) equals: expectedCartList. ! !

!InterfaceTest methodsFor: 'tests' stamp: 'AC 11/17/2025 16:48:20'!
test05AddingOneItemToCartModifiesCartItems

|interface cartID|

interface := testObjectsFactory createInterfaceWithDefaultUserAndMerchantProcessor: self.

cartID := interface createCart: testObjectsFactory defaultUser authenticateWith: testObjectsFactory defaultPassword.

interface add: 1 of: testObjectsFactory itemSellByTheStore to: cartID .
		
self assert: ((interface listCart: cartID) at: testObjectsFactory itemSellByTheStore) = 1. ! !

!InterfaceTest methodsFor: 'tests' stamp: 'AC 11/17/2025 16:48:24'!
test06AddingItemsToInvalidCartReturnsError

|interface cartID|

interface := testObjectsFactory createInterfaceWithDefaultUserAndMerchantProcessor: self.

cartID := interface createCart: testObjectsFactory defaultUser authenticateWith: testObjectsFactory defaultPassword.
		
self 
		should: [interface add: 33 of: testObjectsFactory itemSellByTheStore to: 33 .]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Interface invalidCartIDErrorMessage.]! !

!InterfaceTest methodsFor: 'tests' stamp: 'AC 11/17/2025 16:48:31'!
test07AddingMultipleItemsToCartModifiesCartItems

|interface cartID|

interface := testObjectsFactory createInterfaceWithDefaultUserAndMerchantProcessor: self.

cartID := interface createCart: testObjectsFactory defaultUser authenticateWith: testObjectsFactory defaultPassword.

interface add: 33 of: testObjectsFactory itemSellByTheStore to: cartID .
		
self assert: ((interface listCart: cartID) at: testObjectsFactory itemSellByTheStore) = 33. ! !

!InterfaceTest methodsFor: 'tests' stamp: 'AC 11/17/2025 16:48:35'!
test08CannotAddItemWithCartAfter30MinutesInactive

|interface cartID|

interface := testObjectsFactory createInterfaceWithDefaultUserAndMerchantProcessor: self.

cartID := interface createCart: testObjectsFactory defaultUser authenticateWith: testObjectsFactory defaultPassword.

interface addMinutes: 31.

self 
		should: [interface add: 33 of: testObjectsFactory itemSellByTheStore to: cartID .]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Interface cartTimeoutErrorMessage.]! !

!InterfaceTest methodsFor: 'tests' stamp: 'AC 11/17/2025 16:48:38'!
test09CannotCheckOutCartWithExpiredCard

|interface cartID|

interface := testObjectsFactory createInterfaceWithDefaultUserAndMerchantProcessor: self.

cartID := interface createCart: testObjectsFactory defaultUser authenticateWith: testObjectsFactory defaultPassword.

interface add: 33 of: testObjectsFactory itemSellByTheStore to: cartID.

self 
		should: [interface checkOut: cartID with: testObjectsFactory defaultCardNumber ownBy: testObjectsFactory defaultCardOwner expired: testObjectsFactory passedExpirationDate.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.]! !

!InterfaceTest methodsFor: 'tests' stamp: 'AC 11/17/2025 16:22:11'!
test10CannotCheckOutExpiredCart

|interface cartID|

interface := testObjectsFactory createInterfaceWithDefaultUserAndMerchantProcessor:self.

cartID := interface createCart: testObjectsFactory defaultUser authenticateWith: testObjectsFactory defaultPassword.
interface add: 33 of: testObjectsFactory itemSellByTheStore to: cartID.

interface addMinutes: 31.

self 
		should: [interface checkOut: cartID with: testObjectsFactory defaultCardNumber ownBy: testObjectsFactory defaultCardOwner expired: testObjectsFactory validExpirationDate]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Interface cartTimeoutErrorMessage.]! !

!InterfaceTest methodsFor: 'tests' stamp: 'AC 11/17/2025 16:48:41'!
test11CheckoutRegistersASale
	
| cartID interface salesBook |
interface := testObjectsFactory createInterfaceWithDefaultUserAndMerchantProcessor: self.

cartID := interface createCart: testObjectsFactory defaultUser authenticateWith: testObjectsFactory defaultPassword.

interface add: 33 of: testObjectsFactory itemSellByTheStore to: cartID.

interface checkOut: cartID with: testObjectsFactory defaultCardNumber ownBy: testObjectsFactory defaultCardOwner expired: testObjectsFactory validExpirationDate .

salesBook := interface salesBook.
	self assert: salesBook size equals: 1.
	self assert: salesBook first total equals: 330.! !

!InterfaceTest methodsFor: 'tests' stamp: 'AC 11/17/2025 19:42:44'!
test12CannotListPurchasesWithInvalidCredetials
	
| cartID interface purchases |
interface := testObjectsFactory createInterfaceWithDefaultUserAndMerchantProcessor: self.

cartID := interface createCart: testObjectsFactory defaultUser authenticateWith: testObjectsFactory defaultPassword.

interface add: 33 of: testObjectsFactory itemSellByTheStore to: cartID.

interface checkOut: cartID with: testObjectsFactory defaultCardNumber ownBy: testObjectsFactory defaultCardOwner expired: testObjectsFactory validExpirationDate .

purchases := 'not yet instanced'.
self 
		should: [purchases := interface listPurchases: testObjectsFactory defaultUser athentication: '1234'.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Interface invalidCredentialsErrorMessage .
			self assert: purchases equals: 'not yet instanced']! !

!InterfaceTest methodsFor: 'tests' stamp: 'AC 11/17/2025 19:15:59'!
test13ListPurchasesWithCorrectCredentials
	
| cartID interface purchases |
interface := testObjectsFactory createInterfaceWithDefaultUserAndMerchantProcessor: self.

cartID := interface createCart: testObjectsFactory defaultUser authenticateWith: testObjectsFactory defaultPassword.

interface add: 33 of: testObjectsFactory itemSellByTheStore to: cartID.

interface checkOut: cartID with: testObjectsFactory defaultCardNumber ownBy: testObjectsFactory defaultCardOwner expired: testObjectsFactory validExpirationDate .

purchases := interface listPurchases: testObjectsFactory defaultUser athentication: testObjectsFactory defaultPassword .

self assert: purchases equals: (OrderedCollection with: (interface listCart: cartID)).! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #CartSession category: #TusLibros!
Object subclass: #CartSession
	instanceVariableNames: 'lastOperationTime interface catalog cart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartSession methodsFor: 'initialization' stamp: 'LU 11/16/2025 22:22:06'!
initializeAcceptingItemsOf: aCatalog for: anInterface at: currentTime

interface := anInterface .

lastOperationTime := currentTime .

catalog := aCatalog .

cart := Cart acceptingItemsOf: aCatalog .! !


!CartSession methodsFor: 'adding' stamp: 'AC 11/17/2025 16:42:20'!
add: anAmount of: anItem

	self renewLastOperationTime .
	
	cart add: anAmount of: anItem .! !


!CartSession methodsFor: 'processing' stamp: 'AC 11/17/2025 16:42:40'!
listCart
	
	|cartList|
	
	cartList := Dictionary new.
	
	self renewLastOperationTime .
	
	catalog keys do: [:anItem | 
					((cart occurrencesOf: anItem ) > 0) ifTrue: [
						cartList at: anItem put: (cart occurrencesOf: anItem)]
					].
							
	
							
	^cartList.! !


!CartSession methodsFor: 'testing' stamp: 'AC 11/17/2025 16:08:04'!
isEmpty
	^cart isEmpty .! !

!CartSession methodsFor: 'testing' stamp: 'LU 11/16/2025 22:15:02'!
occurrencesOf: anItem 
	^cart occurrencesOf: anItem .! !


!CartSession methodsFor: 'as yet unclassified' stamp: 'AC 11/17/2025 16:42:00'!
renewLastOperationTime
	lastOperationTime := interface renewCartOperationTime: lastOperationTime .! !

!CartSession methodsFor: 'as yet unclassified' stamp: 'AC 11/17/2025 16:18:32'!
total
	^cart total ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartSession class' category: #TusLibros!
CartSession class
	instanceVariableNames: ''!

!CartSession class methodsFor: 'instance creation' stamp: 'LU 11/16/2025 21:55:57'!
acceptingItemsOf: aCatalog for: anInterface at: currentTime

	^self new initializeAcceptingItemsOf: aCatalog for: anInterface at: currentTime .! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'LU 11/16/2025 17:17:18'!
registerSale

	salesBook add: cart! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expirationDate owner cardNumber'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'AC 11/17/2025 16:10:20'!
isExpiredOn: aDate 
	
	^expirationDate start < (Month month: aDate monthIndex year: aDate yearNumber) start! !


!CreditCard methodsFor: 'initialization' stamp: 'AC 11/17/2025 16:06:19'!
initializeExpiringOn: anExpirationDate ownedBy: anOwner withNumber: aCardNumber 
	expirationDate := anExpirationDate.
	owner := anOwner.
	cardNumber := aCardNumber.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'AC 11/17/2025 16:05:53'!
expiringOn: anExpirationDate ownedBy: anOwner withNumber: aCardNumber 
	^self new initializeExpiringOn: anExpirationDate ownedBy: anOwner withNumber: aCardNumber ! !


!classDefinition: #Interface category: #TusLibros!
Object subclass: #Interface
	instanceVariableNames: 'users cartsSessions catalog dateAndTime merchantProcessor salesBook usersCartSessions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Interface methodsFor: 'cart operations' stamp: 'AC 11/17/2025 12:03:12'!
add: anAmount of: anItem to: aCartID 
	
	(cartsSessions at: aCartID ifAbsent: [self error: self class invalidCartIDErrorMessage]) add: anAmount of: anItem .! !

!Interface methodsFor: 'cart operations' stamp: 'AC 11/17/2025 16:37:12'!
assertCart: aCart isExpiredAt: aDateAndTime 
	aCart isExpiredAt: aDateAndTime ! !

!Interface methodsFor: 'cart operations' stamp: 'AC 11/17/2025 16:41:05'!
checkOut: cartID with: aCardNumber ownBy: anOwner expired: anExpirationDate 
	| cashier creditCard cart |
	creditCard := self createCreditCard: aCardNumber ownBy: anOwner expired: anExpirationDate.
	cart := cartsSessions at: cartID .
	cart renewLastOperationTime.
	cashier := Cashier toCheckout: cart charging: creditCard throught: merchantProcessor  on: dateAndTime registeringOn: salesBook.
	cashier checkOut.! !

!Interface methodsFor: 'cart operations' stamp: 'AC 11/17/2025 19:41:51'!
createCart: aUserID authenticateWith: aPotentialPassword 

	self authenticateUser: aUserID trying: aPotentialPassword.
	
	^(usersCartSessions at: aUserID ifAbsent:[usersCartSessions at:aUserID put: OrderedCollection new]) add:self getNewCartID.
	! !

!Interface methodsFor: 'cart operations' stamp: 'AC 11/17/2025 12:03:12'!
getNewCartID

cartsSessions at: cartsSessions size + 1 put: (CartSession acceptingItemsOf: catalog for: self at: dateAndTime ).

	^ cartsSessions size.! !

!Interface methodsFor: 'cart operations' stamp: 'AC 11/17/2025 19:47:16'!
listAllCarts: userCartsIDs 
	| purchases |
	purchases := OrderedCollection new.
	userCartsIDs do:[:aCartSessionID |
						(salesBook includes: (cartsSessions at: aCartSessionID)) ifTrue:[purchases add: (self listCart:  aCartSessionID)].
					].
				
	^purchases.! !

!Interface methodsFor: 'cart operations' stamp: 'AC 11/17/2025 12:03:12'!
listCart: cartID 
	|cart|
	 
	cart := cartsSessions at: cartID ifAbsent: [self error: self class invalidCartIDErrorMessage].
							
	^cart listCart.! !


!Interface methodsFor: 'users' stamp: 'LU 11/16/2025 18:36:44'!
authenticateUser: aUserID trying: aPotentialPassword 

(users at: aUserID ifAbsent: [self error: self class invalidCredentialsErrorMessage]) = aPotentialPassword ifFalse: [self error: self class invalidCredentialsErrorMessage.]! !

!Interface methodsFor: 'users' stamp: 'LU 11/16/2025 18:20:10'!
createUser: aUserID withPassword: aPassword 
	
	(users keys includes: aUserID) ifTrue: [^self error: 'invalid user'].
	
	users at: aUserID put: aPassword .
	! !


!Interface methodsFor: 'time' stamp: 'LU 11/16/2025 22:09:41'!
addMinutes: aMinuteAmount 


dateAndTime :=	dateAndTime + (Duration minutes: aMinuteAmount ).! !

!Interface methodsFor: 'time' stamp: 'LU 11/16/2025 22:11:44'!
renewCartOperationTime: lastOperationTime

	lastOperationTime + (Duration minutes: 30) < dateAndTime ifTrue: [self error: self class cartTimeoutErrorMessage.].
	
	^ dateAndTime .! !


!Interface methodsFor: 'initialization' stamp: 'AC 11/17/2025 19:24:40'!
initializeWithCatalog: aCatalog usingMerchantProcessor: aMerchantProcessor .

	catalog := aCatalog.
	merchantProcessor := aMerchantProcessor .
	usersCartSessions := Dictionary new.
	salesBook := OrderedCollection new.
	users := Dictionary new.
	cartsSessions := Dictionary new.
	dateAndTime := DateAndTime now.! !


!Interface methodsFor: 'creditCard' stamp: 'AC 11/17/2025 16:04:37'!
createCreditCard: aCardNumber ownBy: anOwner expired: anExpirationDate
	| monthNumber yearNumber |
	monthNumber := anExpirationDate asNumber // 10000.
	yearNumber := anExpirationDate asNumber \\ 10000.
	^CreditCard expiringOn: (Month month: monthNumber year: yearNumber) ownedBy: anOwner withNumber: aCardNumber .! !


!Interface methodsFor: 'testing' stamp: 'AC 11/17/2025 16:49:04'!
salesBook
	^salesBook! !


!Interface methodsFor: 'user operations' stamp: 'AC 11/17/2025 19:23:58'!
listPurchases: aUserID athentication: aPotentialPassword 
	
	| userCartsIDs |
	self  authenticateUser: aUserID trying: aPotentialPassword .
	
	userCartsIDs := usersCartSessions at: aUserID ifAbsent:[OrderedCollection new].
	
	^self listAllCarts: userCartsIDs. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Interface class' category: #TusLibros!
Interface class
	instanceVariableNames: ''!

!Interface class methodsFor: 'instance creation' stamp: 'AC 11/17/2025 16:24:48'!
withCatalog: aCatalog usingMerchantProcessor: aMerchantProcessor

	^ self new initializeWithCatalog: aCatalog usingMerchantProcessor: aMerchantProcessor .! !


!Interface class methodsFor: 'error messages' stamp: 'LU 11/16/2025 21:37:44'!
cartTimeoutErrorMessage
	^'cart is expired'.! !

!Interface class methodsFor: 'error messages' stamp: 'LU 11/16/2025 18:51:46'!
invalidCartIDErrorMessage

	^ 'cart does not exist.'! !

!Interface class methodsFor: 'error messages' stamp: 'LU 11/16/2025 18:03:06'!
invalidCredentialsErrorMessage
	^'invalid credentials.'! !


!classDefinition: #MerchantProcessor category: #TusLibros!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessor methodsFor: 'debit' stamp: 'HernanWilkinson 6/22/2013 14:31'!
README

	"Aunque nadie subclasifica esta clase, esta para definir el protocolo que se espera que todo MerchantProcessor sepa responder - Hernan"! !

!MerchantProcessor methodsFor: 'debit' stamp: 'HernanWilkinson 6/22/2013 14:30'!
debit: anAmount from: aCreditCard

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessor class' category: #TusLibros!
MerchantProcessor class
	instanceVariableNames: ''!

!MerchantProcessor class methodsFor: 'as yet unclassified' stamp: 'ARM 6/17/2025 15:03:52'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'AC 11/17/2025 12:33:55'!
defaultCardNumber
	^1234567891234567! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'AC 11/17/2025 12:34:22'!
defaultCardOwner
	^'Max Verstappen'! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'AC 11/17/2025 16:13:04'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1) ownedBy: 'Charles' withNumber: 1478523698521478! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'AC 11/17/2025 16:12:17'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1) ownedBy: 'Charles' withNumber:7894561237894561! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'AC 11/17/2025 16:17:19'!
passedExpirationDate
	^(today monthIndex -1 )asString, today yearNumber asString ! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'AC 11/17/2025 16:17:50'!
validExpirationDate
		^today monthIndex asString, (today yearNumber+1) asString ! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !


!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'interface' stamp: 'AC 11/17/2025 16:28:16'!
createEmptyInterfaceWithMerchantProcessor: aMerchantProcessor
	
	^ Interface withCatalog: self defaultCatalog usingMerchantProcessor: aMerchantProcessor .! !

!StoreTestObjectsFactory methodsFor: 'interface' stamp: 'AC 11/17/2025 16:31:25'!
createInterfaceWithDefaultUserAndMerchantProcessor: aMerchantProcessor 
	^(Interface withCatalog: self defaultCatalog usingMerchantProcessor: aMerchantProcessor) createUser: self defaultUser withPassword: self defaultPassword .! !


!StoreTestObjectsFactory methodsFor: 'user' stamp: 'LU 11/16/2025 18:15:49'!
defaultPassword

	^'SoyElMasCapo123'.! !

!StoreTestObjectsFactory methodsFor: 'user' stamp: 'LU 11/16/2025 18:15:03'!
defaultUser
	^'Max Verstappen'.! !


!classDefinition: #Mock category: #TusLibros!
ProtoObject subclass: #Mock
	instanceVariableNames: 'receivedMessages blockBySelectors'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Mock methodsFor: 'system primitives' stamp: 'HAW 11/8/2024 13:37:50'!
doesNotUnderstand: aMessage

	receivedMessages add: aMessage.
	
	^blockBySelectors 
		at: aMessage selector 
		ifPresent: [ :aBlock | aBlock valueWithArguments: aMessage arguments ]
		ifAbsent: [ self ]! !

!Mock methodsFor: 'system primitives' stamp: 'HAW 11/8/2024 13:32:55'!
inspectorClass
	"Answer the class of the inspector to be used on the receiver.  Called by inspect; 
	use basicInspect to get a normal (less useful) type of inspector."

	^ Inspector! !

!Mock methodsFor: 'system primitives' stamp: 'HAW 11/8/2024 13:33:06'!
instVarAt: index put: anObject
	"Primitive. Store a value into a fixed variable in an object. The numbering of the
	 variables corresponds to the named instance variables, followed by the indexed
	 instance variables. Fail if the index is not an Integer or is not the index of a fixed
	 variable. Essential. See Object documentation whatIsAPrimitive."

	<primitive: 174 error: ec>
	Object primitiveFailed! !


!Mock methodsFor: 'initialization' stamp: 'HAW 11/8/2024 13:36:36'!
initializeDoingAll: aBlocksBySelectors 

	blockBySelectors := aBlocksBySelectors.
	receivedMessages := OrderedCollection new! !


!Mock methodsFor: 'received messages' stamp: 'HAW 11/8/2024 13:46:46'!
receivedMessages

	^receivedMessages copy! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Mock class' category: #TusLibros!
Mock class
	instanceVariableNames: ''!

!Mock class methodsFor: 'instance creation' stamp: 'HAW 11/8/2024 13:36:04'!
doingAll: aBlocksBySelectors

	^self new initializeDoingAll: aBlocksBySelectors ! !

!Mock class methodsFor: 'instance creation' stamp: 'HAW 11/8/2024 13:46:25'!
onlyCollecting

	^self doingAll: Dictionary new! !

!Mock class methodsFor: 'instance creation' stamp: 'HAW 11/8/2024 13:35:40'!
whenReceives: aSelector do: aBlock

	^self doingAll: (Dictionary new
		at: aSelector put: aBlock;
		yourself)! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 126 112 117 107 118 126 122 61 59 17 74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 126 112 117 107 118 126 122 61 59 99 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 91 124 122 83 112 105 121 118 122 80 117 123 108 121 109 104 106 108 53 112 116 104 110 108 17 94 112 117 58 57 17 61 53 57 17 95 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 100 17 94 112 117 107 118 126 122 17 94 112 117 58 57 39 105 124 112 115 123 39 118 117 39 84 104 121 39 39 56 39 57 55 57 60 39 55 56 65 55 59 65 57 57 39 78 84 91 39 74 118 116 119 112 115 108 121 65 39 59 53 57 53 56 39 74 118 116 119 104 123 112 105 115 108 39 74 115 104 117 110 39 63 53 55 53 56 39 47 123 104 110 122 54 89 76 83 76 72 90 76 102 63 55 56 54 109 112 117 104 115 48 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 84 104 121 39 39 56 39 57 55 57 60 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 84 104 121 39 39 56 39 57 55 57 60 17 93 84 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 84 118 117 39 86 106 123 39 61 39 56 57 65 58 59 65 57 56 39 57 55 57 60 39 74 118 116 116 112 123 79 104 122 111 65 39 108 107 58 60 59 63 61 39 87 115 124 110 112 117 122 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 199 175 217 109 17 56 64 57 53 56 61 63 53 57 56 55 53 56 55 57 17 83 72 87 91 86 87 52 57 73 79 64 59 80 61 75 53 115 104 117 17 83 72 87 91 86 87 52 57 73 79 64 59 80 61 75 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 56 91 56 64 65 56 57 65 59 59 53 63 60 55 58 61 61 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 91 104 115 115 108 121 108 122 80 117 110 108 56 99 76 113 108 121 106 112 106 112 118 91 124 122 83 112 105 121 118 122 99 91 124 122 83 112 105 121 118 122 53 122 123 17 56 55 55 61 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 57 65 55 56 65 57 59 53 63 59 63 62 55 57 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 91 104 115 115 108 121 108 122 80 117 110 108 56 99 76 113 108 121 106 112 106 112 118 91 124 122 83 112 105 121 118 122 99 91 124 122 83 112 105 121 118 122 52 80 117 123 108 121 109 104 106 108 53 122 123 17 58 63 55 56 59 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 63 91 55 55 65 57 57 65 58 59 53 62 55 61 63 58 60 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 91 124 122 83 112 105 121 118 122 52 80 117 123 108 121 109 104 106 108 53 122 123 17 58 61 63 62 55 17 52 52 52 52 52 52 52 52 52 52 17 17))!