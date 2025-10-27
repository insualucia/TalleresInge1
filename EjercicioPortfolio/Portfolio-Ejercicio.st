!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'LU 10/24/2025 21:54:16'!
modifyBalance: aBalance
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'LU 10/24/2025 21:54:16'!
modifyBalance: aBalance
	^ aBalance + value .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'LU 10/24/2025 21:54:16'!
modifyBalance: aBalance
	^ aBalance - value .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts portfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'LU 10/27/2025 15:05:58'!
initialize

	accounts := OrderedCollection new.
	portfolios := OrderedCollection new.! !


!Portfolio methodsFor: 'associating' stamp: 'LU 10/26/2025 20:36:53'!
addAccount: anAccount

	accounts add: anAccount .! !

!Portfolio methodsFor: 'associating' stamp: 'LU 10/27/2025 15:03:30'!
addPortfolio: aPortfolio

	portfolios add: aPortfolio .! !


!Portfolio methodsFor: 'balance' stamp: 'LU 10/27/2025 15:04:32'!
balance
	|sum|
	sum := 0.
	accounts do: [ :anAccount | sum:= sum + anAccount balance ].
	portfolios do: [ :aPortfolio| sum:= sum + aPortfolio balance ].
	^sum.! !


!Portfolio methodsFor: 'testing' stamp: 'AC 10/27/2025 17:43:12'!
anyAccountHasRegistered: aTransaction

	^ accounts anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction]! !

!Portfolio methodsFor: 'testing' stamp: 'AC 10/27/2025 17:43:44'!
anyPortfolioHasRegistered: aTransaction

	^ portfolios anySatisfy: [:aPortfolio | aPortfolio hasRegistered: aTransaction]! !

!Portfolio methodsFor: 'testing' stamp: 'AC 10/27/2025 17:43:44'!
hasRegistered: aTransaction 
	^(self anyAccountHasRegistered: aTransaction) or: [self anyPortfolioHasRegistered: aTransaction].! !


!Portfolio methodsFor: 'transactions' stamp: 'AC 10/27/2025 18:13:11'!
transactions
	| allTransactions |
	allTransactions := Bag new.
	accounts do: [:anAccount | allTransactions addAll: anAccount transactions].
	portfolios size > 0 ifTrue: [allTransactions addAll: portfolios first transactions].
	^allTransactions! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'LU 10/24/2025 21:54:16'!
balance
|balance|
balance := 0.
	transactions do: [ :aTransaction | balance := aTransaction modifyBalance: balance.].
	
	^ balance.! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'LU 10/26/2025 20:24:04'!
test01PortfolioWithZeroAccountsHasBalanceOfZero

	| portfolio |
	
	portfolio := Portfolio new.

	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AC 10/27/2025 17:20:56'!
test02PortfolioWithOneAccountHasABalanceOfAccountBalance

	| portfolio account1 |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	
	account1 register: (Deposit for: 30).
	account1 register: (Withdraw for: 25).
	
	portfolio addAccount: account1 .

	self assert: 5 equals: portfolio balance.
	self assert: account1 balance equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AC 10/27/2025 16:43:44'!
test03PortfolioWithManyAccountsHasABalanceOfSumOfAccountsBalance

	| portfolio account1 account2 account3|
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	
	account1 register: (Deposit for: 10).
	account2 register: (Deposit for: 30).
	account3 register: (Withdraw for: 25).
	
	portfolio addAccount: account1 .
	portfolio addAccount: account2 .
	portfolio addAccount: account3 .

	self assert: 15 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AC 10/27/2025 16:54:06'!
test04PortfolioWithOnePortfolioAndAccountsHasABalanceOfPortfolioAndSumOfAccountsBalance

	| portfolio portfolio1 account1 account2 account3 account4 account5 totalBalance |
	
	portfolio := Portfolio new.
	portfolio1:= Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	account4 := ReceptiveAccount new.
	account5 := ReceptiveAccount new.
	
	account1 register: (Deposit for: 10).
	account2 register: (Deposit for: 30).
	account3 register: (Deposit for: 25).
	account4 register: (Deposit for: 25).
	account5 register: (Withdraw for: 35).
	
	portfolio addAccount: account1 .
	portfolio addAccount: account2 .
	portfolio addAccount: account3 .
	
	portfolio1 addAccount: account4.
	portfolio1 addAccount: account5.
	
	portfolio addPortfolio: portfolio1.
	
	totalBalance := account1 balance + account2 balance  + account3 balance + portfolio1 balance.
	self assert: 55 equals: portfolio balance.
	self assert: totalBalance equals: portfolio balance .! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AC 10/27/2025 16:52:12'!
test05PortfolioWithManyPortfoliosAndAccountsHasABalanceOfSumOfPortfoliosAndAccountsBalance

	| portfolio portfolio1 portfolio2 account1 account2 account3 account4 account5 account6 account7|
	
	portfolio := Portfolio new.
	portfolio1:= Portfolio new.
	portfolio2:= Portfolio new.	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	account4 := ReceptiveAccount new.
	account5 := ReceptiveAccount new.
	account6 := ReceptiveAccount new.
	account7 := ReceptiveAccount new.
	
	account1 register: (Deposit for: 10).
	account2 register: (Deposit for: 30).
	account3 register: (Deposit for: 25).
	account4 register: (Deposit for: 25).
	account5 register: (Withdraw for: 35).
	account6 register: (Withdraw for: 5).
	account7 register: (Withdraw for: 15).
	
	portfolio addAccount: account1 .
	portfolio addAccount: account2 .
	portfolio addAccount: account3 .
	
	portfolio1 addAccount: account4.
	portfolio1 addAccount: account5.
	
	portfolio2 addAccount: account6.
	portfolio2 addAccount: account7.

	portfolio addPortfolio: portfolio1.
	portfolio addPortfolio: portfolio2.
	
	self assert: 35 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AC 10/27/2025 17:03:55'!
test06PortfolioWithNothingHasNoTransactionRegistered

	| portfolio withdraw deposit |
	
	portfolio := Portfolio new.
	deposit := Withdraw for: 500.
	withdraw := Withdraw for: 50.

	self deny: (portfolio hasRegistered: withdraw).
	self deny: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AC 10/27/2025 17:21:14'!
test07PortfolioWithOneAccountHasRegisteredTheAccountTransactions

	| portfolio account1 deposit withdraw |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	
	deposit := Deposit register: 100 on:  account1 .
	withdraw := Withdraw for: 25.
	
	
	portfolio addAccount: account1 .
	self deny: (portfolio hasRegistered: withdraw).
	self assert: (account1 hasRegistered: withdraw) equals: (portfolio hasRegistered: withdraw).
	self assert: (portfolio hasRegistered: deposit).
	self assert: (account1 hasRegistered: deposit) equals: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AC 10/27/2025 17:18:26'!
test08PortfolioWithManyAccountsHasRegisteredTheAccountsTransactions

	| portfolio account1 deposit withdraw account2 deposit2 withdraw2 |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	deposit := Deposit register: 100 on:  account1 .
	withdraw := Withdraw for: 25.
	deposit2 := Deposit register: 75 on: account2.
	withdraw2 := Withdraw register: 50 on: account1.
	
	
	portfolio addAccount: account1 .
	portfolio addAccount: account2 .
	
	self deny: (portfolio hasRegistered: withdraw).
	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: deposit2).
	self assert: (portfolio hasRegistered: withdraw2).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AC 10/27/2025 18:07:34'!
test09PortfolioWithOnePortfolioAndAccountsHasRegisteredThePortfolioAndAccountsTransactions

	| portfolio portfolio1 account1 account2 account3 account4 account5 deposit1 deposit2 deposit3 deposit4 deposit5 withdraw1 withdraw2 withdraw3 |
	
	portfolio := Portfolio new.
	portfolio1:= Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	account4 := ReceptiveAccount new.
	account5 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 10 on: account1 .
	deposit2 := Deposit register: 30 on: account2 .
	deposit3 := Deposit register: 25 on: account3 .
	deposit4 := Deposit register: 25 on: account4 .
	deposit5 := Deposit register: 1000 on: account5 .
	withdraw1 := Withdraw register: 25 on: account2.
	withdraw2 := Withdraw for: 35.
	withdraw3 := Withdraw register: 150 on: account5.
	
	portfolio addAccount: account1 .
	portfolio addAccount: account2 .
	portfolio addAccount: account3 .
	
	portfolio1 addAccount: account4.
	portfolio1 addAccount: account5.
	
	portfolio addPortfolio: portfolio1.
	
	self assert: (portfolio hasRegistered: deposit1).
	self assert: (portfolio hasRegistered: deposit2).
	self assert: (portfolio hasRegistered: deposit3).
	self assert: (portfolio hasRegistered: deposit4).
	self assert: (portfolio hasRegistered: deposit5).
	self assert: (portfolio hasRegistered: withdraw1).
	self deny: (portfolio hasRegistered: withdraw2).
	self assert: (portfolio hasRegistered: withdraw3).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AC 10/27/2025 18:07:46'!
test10PortfolioWithManyPortfoliosAndAccountsHasRegisteredThePortfoliosAndAccountsTransaction

	| portfolio portfolio1 portfolio2 account1 account2 account3 account4 account5 account6 account7 deposit1 deposit2 deposit3 deposit4 withdraw1 withdraw2 withdraw3 withdraw4 |
	
	portfolio := Portfolio new.
	portfolio1:= Portfolio new.
	portfolio2:= Portfolio new.	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	account4 := ReceptiveAccount new.
	account5 := ReceptiveAccount new.
	account6 := ReceptiveAccount new.
	account7 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 10 on: account1 .
	deposit2 := Deposit register: 30 on: account2 .
	deposit3 := Deposit register: 25 on: account3 .
	deposit4 := Deposit register: 25 on: account4 .
	withdraw1 := Withdraw register: 35 on: account5 .
	withdraw2 := Withdraw register: 5 on: account6 .
	withdraw3 := Withdraw register: 15 on: account7 .
	withdraw4 := Withdraw for: 33.
	
	portfolio addAccount: account1 .
	portfolio addAccount: account2 .
	portfolio addAccount: account3 .
	
	portfolio1 addAccount: account4.
	portfolio1 addAccount: account5.
	
	portfolio2 addAccount: account6.
	portfolio2 addAccount: account7.

	portfolio addPortfolio: portfolio1.
	portfolio addPortfolio: portfolio2.
	
	self assert: (portfolio hasRegistered: deposit1).
	self assert: (portfolio hasRegistered: deposit2).
	self assert: (portfolio hasRegistered: deposit3).
	self assert: (portfolio hasRegistered: deposit4).
	self assert: (portfolio hasRegistered: withdraw1).
	self assert: (portfolio hasRegistered: withdraw2).
	self assert: (portfolio hasRegistered: withdraw3).
	self deny: (portfolio hasRegistered: withdraw4).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AC 10/27/2025 18:03:00'!
test11PortfolioWithNothingHasNoTransactions

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: Bag new equals: portfolio transactions.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AC 10/27/2025 18:03:10'!
test12PortfolioWithOneAccountHasTheAccountTransactions

	| portfolio account1 deposit withdraw |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	
	deposit := Deposit register: 100 on:  account1 .
	withdraw := Withdraw for: 25.
	
	
	portfolio addAccount: account1 .
	
	self assert: (Bag with: deposit) equals: portfolio transactions.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AC 10/27/2025 18:03:20'!
test13PortfolioWithManyAccountsHasTheAccountsTransactions

	| portfolio account1 deposit withdraw account2 deposit2 withdraw2 |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	deposit := Deposit register: 100 on:  account1 .
	withdraw := Withdraw for: 25.
	deposit2 := Deposit register: 75 on: account2.
	withdraw2 := Withdraw register: 50 on: account1.
	
	
	portfolio addAccount: account1 .
	portfolio addAccount: account2 .
	
	self assert: (Bag with: deposit with: deposit2  with: withdraw2) equals: portfolio transactions.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AC 10/27/2025 18:17:01'!
test14PortfolioWithOnePortfolioAndAccountsHasThePortfolioAndAccountsTransactions

	| portfolio portfolio1 account1 account2 account3 account4 account5 deposit1 deposit2 deposit3 deposit4 deposit5 withdraw1 withdraw2 withdraw3 portfolioTransactions |
	
	portfolio := Portfolio new.
	portfolio1:= Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	account4 := ReceptiveAccount new.
	account5 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 10 on: account1 .
	deposit2 := Deposit register: 30 on: account2 .
	deposit3 := Deposit register: 25 on: account3 .
	deposit4 := Deposit register: 25 on: account4 .
	deposit5 := Deposit register: 1000 on: account5 .
	withdraw1 := Withdraw register: 25 on: account2.
	withdraw2 := Withdraw for: 35.
	withdraw3 := Withdraw register: 150 on: account5.
	
	portfolio addAccount: account1 .
	portfolio addAccount: account2 .
	portfolio addAccount: account3 .
	
	portfolio1 addAccount: account4.
	portfolio1 addAccount: account5.
	
	portfolio addPortfolio: portfolio1.
	portfolioTransactions := ((Bag with: deposit1 with: deposit2  with: deposit3 with: deposit4 with: deposit5  with: withdraw1) add: withdraw3) .
	self assert: portfolioTransactions equals: portfolio transactions.
	! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(54 111 118 116 108 54 104 115 108 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 57 54 115 112 117 124 127 61 59 54 115 112 117 124 127 61 59 17 54 111 118 116 108 54 104 115 108 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 57 54 115 112 117 124 127 61 59 54 115 112 117 124 127 61 59 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 53 112 116 104 110 108 17 124 117 112 127 17 83 112 117 124 127 39 61 53 63 53 55 52 63 60 52 110 108 117 108 121 112 106 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 86 106 123 39 39 62 39 57 55 57 60 39 56 59 65 55 63 65 57 62 39 74 118 116 119 112 115 108 121 65 39 60 53 59 53 55 39 57 55 56 61 55 61 55 64 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 86 106 123 39 39 62 39 57 55 57 60 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 86 106 123 39 39 62 39 57 55 57 60 17 93 84 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 84 118 117 39 86 106 123 39 61 39 56 57 65 58 59 65 57 56 39 57 55 57 60 39 74 118 116 116 112 123 79 104 122 111 65 39 108 107 58 60 59 63 61 39 87 115 124 110 112 117 122 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 17 7 9 22 17 56 55 53 55 53 57 53 56 60 17 104 115 108 52 125 116 17 104 115 108 52 125 116 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 62 91 56 61 65 58 64 65 58 61 53 63 55 57 61 63 63 52 55 58 65 55 55 17 54 111 118 116 108 54 104 115 108 54 75 108 122 114 123 118 119 54 77 104 106 124 115 123 104 107 54 91 104 115 115 108 121 108 122 80 117 110 108 56 54 76 113 108 121 106 112 106 112 118 87 118 121 123 109 118 115 112 118 54 87 118 121 123 109 118 115 112 118 52 76 113 108 121 106 112 106 112 118 53 122 123 17 56 57 62 60 56 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 62 91 56 62 65 59 59 65 56 57 53 60 59 60 61 64 59 52 55 58 65 55 55 17 54 111 118 116 108 54 104 115 108 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 57 54 115 112 117 124 127 61 59 54 115 112 117 124 127 61 59 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 118 121 123 109 118 115 112 118 52 76 113 108 121 106 112 106 112 118 53 122 123 17 56 61 59 63 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 62 91 56 63 65 56 63 65 56 64 53 57 58 61 58 62 59 52 55 58 65 55 55 17 54 111 118 116 108 54 104 115 108 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 57 54 115 112 117 124 127 61 59 54 115 112 117 124 127 61 59 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 118 121 123 109 118 115 112 118 52 76 113 108 121 106 112 106 112 118 53 122 123 17 56 64 60 59 60 17 52 52 52 52 52 52 52 52 52 52 17 17))!