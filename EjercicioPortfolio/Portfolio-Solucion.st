!classDefinition: #Account category: #'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'LU 11/4/2025 01:04:06'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!classDefinition: #AccountReport category: #'Portfolio-Solucion'!
Object subclass: #AccountReport
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountReport methodsFor: 'transfer net' stamp: 'AC 11/4/2025 15:58:39'!
transferNet
	| transferBalance |
	transferBalance := 0.
	account transactions do: [:aTransaction | 
		(aTransaction isKindOf: TransferTransactions)  ifTrue:[transferBalance := aTransaction affectBalance: transferBalance].
		].
	^transferBalance asString ! !


!AccountReport methodsFor: 'account summary' stamp: 'AC 11/4/2025 15:26:17'!
accountSummary

	|report|
	
	report := ReadWriteStream on: (String new).
	
	account transactions do: [:aTransaction | 
		|adapter|
		adapter := AccountTransactionToAccountSummaryAdapter adaptTransaction: aTransaction .
		report nextPutAll: adapter.
		report cr.
		].
	
	report nextPutAll: ('Balance = ', account balance asString).
	
	^report contents.! !


!AccountReport methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 02:55:49'!
initializeWith: anAccount

account := anAccount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReport class' category: #'Portfolio-Solucion'!
AccountReport class
	instanceVariableNames: ''!

!AccountReport class methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 02:56:40'!
for: anAccount

	^self new initializeWith: anAccount .! !


!classDefinition: #AccountTransaction category: #'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferTransactions category: #'Portfolio-Solucion'!
AccountTransaction subclass: #TransferTransactions
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferTransactions methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 01:57:59'!
affectBalance: aBalance

	self subclassResponsibility! !

!TransferTransactions methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 01:57:41'!
initializeFor: aTransfer

	transfer := aTransfer .! !

!TransferTransactions methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 02:16:59'!
receiver 

	^ transfer receiver.! !

!TransferTransactions methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 02:16:46'!
sender 

	^ transfer sender.! !

!TransferTransactions methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 01:57:28'!
value

	^transfer value.! !


!classDefinition: #IncomingTransfer category: #'Portfolio-Solucion'!
TransferTransactions subclass: #IncomingTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!IncomingTransfer methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 02:05:16'!
affectBalance: aBalance

	^transfer affectBalanceOfReceiver: aBalance. ! !


!classDefinition: #OutgoingTransfer category: #'Portfolio-Solucion'!
TransferTransactions subclass: #OutgoingTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!OutgoingTransfer methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 02:05:34'!
affectBalance: aBalance

	^transfer affectBalanceOfSender: aBalance. ! !


!classDefinition: #Withdraw category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #AccountTransactionToAccountSummaryAdapter category: #'Portfolio-Solucion'!
Object subclass: #AccountTransactionToAccountSummaryAdapter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransactionToAccountSummaryAdapter methodsFor: 'adapt' stamp: 'AC 11/4/2025 15:27:49'!
adapt: aTransaction
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransactionToAccountSummaryAdapter class' category: #'Portfolio-Solucion'!
AccountTransactionToAccountSummaryAdapter class
	instanceVariableNames: ''!

!AccountTransactionToAccountSummaryAdapter class methodsFor: 'instance creation' stamp: 'AC 11/4/2025 15:17:21'!
adaptTransaction: aTransaction
	| transactionAdapter |
	transactionAdapter := self subclasses detect: [:aSubclass | aSubclass canAdapt: aTransaction].
	^ transactionAdapter new adapt: aTransaction ! !


!classDefinition: #DepositForAccountSummaryAdapter category: #'Portfolio-Solucion'!
AccountTransactionToAccountSummaryAdapter subclass: #DepositForAccountSummaryAdapter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!DepositForAccountSummaryAdapter methodsFor: 'adapt' stamp: 'AC 11/4/2025 15:19:55'!
adapt: aTransaction
	^'Depósito por ', aTransaction value asString, '.'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositForAccountSummaryAdapter class' category: #'Portfolio-Solucion'!
DepositForAccountSummaryAdapter class
	instanceVariableNames: ''!

!DepositForAccountSummaryAdapter class methodsFor: 'as yet unclassified' stamp: 'AC 11/4/2025 15:13:58'!
canAdapt: aTransaction
	^aTransaction  isKindOf: Deposit .! !


!classDefinition: #IncomingTransferForAccountSummaryAdapter category: #'Portfolio-Solucion'!
AccountTransactionToAccountSummaryAdapter subclass: #IncomingTransferForAccountSummaryAdapter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!IncomingTransferForAccountSummaryAdapter methodsFor: 'adapt' stamp: 'AC 11/4/2025 15:24:30'!
adapt: aTransaction
	^'Entrada por transferencia de ', aTransaction value asString , '.'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IncomingTransferForAccountSummaryAdapter class' category: #'Portfolio-Solucion'!
IncomingTransferForAccountSummaryAdapter class
	instanceVariableNames: ''!

!IncomingTransferForAccountSummaryAdapter class methodsFor: 'as yet unclassified' stamp: 'AC 11/4/2025 15:14:29'!
canAdapt: aTransaction
	^aTransaction  isKindOf: IncomingTransfer .! !


!classDefinition: #OutgoingTransferForAccountSummaryAdapter category: #'Portfolio-Solucion'!
AccountTransactionToAccountSummaryAdapter subclass: #OutgoingTransferForAccountSummaryAdapter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!OutgoingTransferForAccountSummaryAdapter methodsFor: 'adapt' stamp: 'AC 11/4/2025 15:23:43'!
adapt: aTransaction
	^'Salida por transferencia de ', aTransaction value asString , '.'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OutgoingTransferForAccountSummaryAdapter class' category: #'Portfolio-Solucion'!
OutgoingTransferForAccountSummaryAdapter class
	instanceVariableNames: ''!

!OutgoingTransferForAccountSummaryAdapter class methodsFor: 'as yet unclassified' stamp: 'AC 11/4/2025 15:15:11'!
canAdapt: aTransaction
	^aTransaction  isKindOf: OutgoingTransfer .! !


!classDefinition: #WithdrawForAccountSummaryAdapter category: #'Portfolio-Solucion'!
AccountTransactionToAccountSummaryAdapter subclass: #WithdrawForAccountSummaryAdapter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!WithdrawForAccountSummaryAdapter methodsFor: 'adapt' stamp: 'AC 11/4/2025 15:22:53'!
adapt: aTransaction
	^'Extracción por ', aTransaction value asString , '.'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawForAccountSummaryAdapter class' category: #'Portfolio-Solucion'!
WithdrawForAccountSummaryAdapter class
	instanceVariableNames: ''!

!WithdrawForAccountSummaryAdapter class methodsFor: 'as yet unclassified' stamp: 'AC 11/4/2025 15:15:22'!
canAdapt: aTransaction
	^aTransaction  isKindOf: Withdraw .! !


!classDefinition: #AccountTransfer category: #'Portfolio-Solucion'!
Object subclass: #AccountTransfer
	instanceVariableNames: 'value sender receiver'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransfer methodsFor: 'testing' stamp: 'LU 11/4/2025 02:15:43'!
receiver

	^ receiver.! !

!AccountTransfer methodsFor: 'testing' stamp: 'LU 11/4/2025 02:15:49'!
sender

	^ sender.! !

!AccountTransfer methodsFor: 'testing' stamp: 'LU 11/4/2025 03:52:30'!
value

	^ value.! !


!AccountTransfer methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 02:03:01'!
initializeWithValue: aValue from: sendersAccount to: receiversAccount 

value := aValue .
sender := sendersAccount .
receiver := receiversAccount .! !


!AccountTransfer methodsFor: 'balance' stamp: 'LU 11/4/2025 02:06:04'!
affectBalanceOfReceiver: aBalance

	^aBalance + value.! !

!AccountTransfer methodsFor: 'balance' stamp: 'LU 11/4/2025 02:06:12'!
affectBalanceOfSender: aBalance

	^aBalance - value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransfer class' category: #'Portfolio-Solucion'!
AccountTransfer class
	instanceVariableNames: ''!

!AccountTransfer class methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 02:09:35'!
register: aValue from: sendersAccount to: receiversAccount
	| transfer |
	transfer := AccountTransfer new initializeWithValue: aValue from: sendersAccount to: receiversAccount .
	sendersAccount register: (OutgoingTransfer new initializeFor: transfer).
	receiversAccount register: (IncomingTransfer new initializeFor: transfer).
	^transfer! !


!classDefinition: #AccountReportTest category: #'Portfolio-Solucion'!
TestCase subclass: #AccountReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountReportTest methodsFor: 'tests' stamp: 'LU 11/4/2025 12:17:41'!
test01AccountSummaryOfEmptyAccountShowsBalanceInZero

	| report1 report2 account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	report1 := AccountReport  for: account .
	report2 := AccountReport  for: portfolio .
	
	self assert: 'Balance = 0' equals: report1 accountSummary.
	self assert: 'Balance = 0' equals: report2 accountSummary.! !

!AccountReportTest methodsFor: 'tests' stamp: 'LU 11/4/2025 03:50:00'!
test02AccountSummaryOfAccountWithOneTransactionShowsTransactionInformationAndAccountBalance

	| report account result|
	
	account := ReceptiveAccount new.
	report := AccountReport  for: account .
	Deposit register: 100 on: account.
	
	result := ReadWriteStream on: (String new).
	result nextPutAll: 'Depósito por 100.'.
	result cr.
	result nextPutAll: 'Balance = 100'.
	
	self assert: result contents equals: report accountSummary.! !

!AccountReportTest methodsFor: 'tests' stamp: 'LU 11/4/2025 03:56:48'!
test03AccountSummaryOfAccountWithManyTransactionsShowsTransactionsInformationAndAccountBalance

	| report account account2 result|
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account .
	AccountTransfer register: 20 from:account  to:account2. 
	AccountTransfer register: 30 from:account2  to:account. 
	
	report := AccountReport  for: account .
	
	result := ReadWriteStream on: (String new).
	result nextPutAll: 'Depósito por 100.'.
	result cr.
	result nextPutAll: 'Extracción por 50.'.
	result cr.
	result nextPutAll: 'Salida por transferencia de 20.'.
	result cr.
	result nextPutAll: 'Entrada por transferencia de 30.'.
	result cr.
	result nextPutAll: 'Balance = 60'.
	
	self assert: result contents equals: report accountSummary.! !

!AccountReportTest methodsFor: 'tests' stamp: 'LU 11/4/2025 12:14:37'!
test04AccountSummaryOfPortfolioWithManyTransactionsShowsTransactionsInformationAndAccountBalance

	| report account account2 result portfolio1 portfolio2|
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Deposit register: 30 on: account2.
	Withdraw register: 50 on: account .
	AccountTransfer register: 20 from:account  to:account2. 
	AccountTransfer register: 30 from:account2  to:account. 
	
	portfolio1 := Portfolio with: account.
	portfolio2:= Portfolio with: account2.
	portfolio1 add: portfolio2 .
	
	report := AccountReport  for: portfolio1.
	
	result := ReadWriteStream on: (String new).
	result nextPutAll: 'Depósito por 100.'.
	result cr.
	result nextPutAll: 'Extracción por 50.'.
	result cr.
	result nextPutAll: 'Salida por transferencia de 20.'.
	result cr.
	result nextPutAll: 'Entrada por transferencia de 30.'.
	result cr.
	result nextPutAll: 'Depósito por 30.'.
	result cr.
	result nextPutAll: 'Entrada por transferencia de 20.'.
	result cr.
	result nextPutAll: 'Salida por transferencia de 30.'.
	result cr.
	result nextPutAll: 'Balance = 80'.
	
	self assert: result contents equals: report accountSummary.! !

!AccountReportTest methodsFor: 'tests' stamp: 'LU 11/4/2025 12:47:24'!
test05TransferNetOfEmptyAccountIsZero

	| report1 report2 account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	report1 := AccountReport  for: account .
	report2 := AccountReport  for: portfolio .
	
	self assert: '0' equals: report1 transferNet .
	self assert: '0' equals: report2 transferNet .! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/4/2025 15:55:55'!
test06TransferNetOfAccountWithOneTransferHasItsValue

	| account1 account2 report1 report2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	report1 := AccountReport  for: account1 .
	report2 := AccountReport for: account2.
	AccountTransfer register: 20 from:account1  to: account2. 
	
	self assert: '-20' contents equals: report1 transferNet.
	self assert: '20' contents equals: report2 transferNet.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/4/2025 15:59:45'!
test07TransferNetOfAccountWithManyTransactionsIsAccountBalance

	| account account2 report1 report2 |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account .
	AccountTransfer register: 20 from:account  to:account2. 
	AccountTransfer register: 30 from:account2  to:account. 
	
	report1 := AccountReport  for: account .
	report2 := AccountReport for: account2.
	
	self assert: '10' equals: report1 transferNet .
	self assert: '-10' equals: report2 transferNet .! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/4/2025 16:04:51'!
test08TransferNetOfPortfolioWithManyTransactionsIsPortfolioBalance

	| report account account2 portfolio1 portfolio2 account3 report2 |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Deposit register: 30 on: account2.
	Withdraw register: 50 on: account .
	AccountTransfer register: 20 from:account  to:account2. 
	AccountTransfer register: 30 from:account2  to:account. 
	AccountTransfer register: 100 from: account3 to: account2.
	AccountTransfer register: 20 from: account to: account3.
	
	
	portfolio1 := Portfolio with: account.
	portfolio2:= Portfolio with: account2.
	portfolio1 add: portfolio2 .
	
	report := AccountReport  for: portfolio1.
	report2 := AccountReport for: portfolio2 .
	
	self assert: '80' equals: report transferNet.
	self assert: '90' equals: report2 transferNet.! !


!classDefinition: #PortfolioTest category: #'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 5/27/2021 17:36:04'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LU 11/4/2025 00:33:56'!
test08TransferValueAddsToReceiverAndSubstractsFromSendersBalance

	| account1 account2 transfer1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer1 := AccountTransfer register: 100 from: account1 to: account2.
		
	self assert: 100 equals: account2 balance.
	self assert: 100 equals: account2 balance.
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LU 11/4/2025 02:22:50'!
test09NavigateFromReceiverToSenderThroughTransfer

	| account1 account2 transfer1|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer1 := AccountTransfer register: 100 from: account1 to: account2.
	
	self assert: account1 equals: account2 transactions last sender .	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LU 11/4/2025 02:22:16'!
test10NavigateFromSenderToReceiverThroughTransfer

	| account1 account2 transfer1|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer1 := AccountTransfer register: 100 from: account1 to: account2.
	
	self assert: account2 equals: account1 transactions last receiver .	
! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(54 111 118 116 108 54 104 115 108 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 57 54 115 112 117 124 127 61 59 54 115 112 117 124 127 61 59 17 54 111 118 116 108 54 104 115 108 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 57 54 115 112 117 124 127 61 59 54 115 112 117 124 127 61 59 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 53 112 116 104 110 108 17 124 117 112 127 17 83 112 117 124 127 39 61 53 63 53 55 52 63 60 52 110 108 117 108 121 112 106 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 86 106 123 39 39 62 39 57 55 57 60 39 56 59 65 55 63 65 57 62 39 74 118 116 119 112 115 108 121 65 39 60 53 59 53 55 39 57 55 56 61 55 61 55 64 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 86 106 123 39 39 62 39 57 55 57 60 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 86 106 123 39 39 62 39 57 55 57 60 17 93 84 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 84 118 117 39 86 106 123 39 61 39 56 57 65 58 59 65 57 56 39 57 55 57 60 39 74 118 116 116 112 123 79 104 122 111 65 39 108 107 58 60 59 63 61 39 87 115 124 110 112 117 122 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 17 7 9 22 17 56 55 53 55 53 57 53 56 60 17 104 115 108 52 125 116 17 104 115 108 52 125 116 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 55 59 91 56 60 65 55 60 65 57 56 53 55 62 58 63 60 59 52 55 58 65 55 55 17 54 111 118 116 108 54 104 115 108 54 75 108 122 114 123 118 119 54 77 104 106 124 115 123 104 107 54 91 104 115 115 108 121 108 122 80 117 110 108 56 54 76 113 108 121 106 112 106 112 118 87 118 121 123 109 118 115 112 118 54 87 118 121 123 109 118 115 112 118 52 90 118 115 124 106 112 118 117 53 122 123 17 58 64 56 57 64 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 55 59 91 56 60 65 58 64 65 58 60 53 60 56 55 60 64 52 55 58 65 55 55 17 54 111 118 116 108 54 104 115 108 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 57 54 115 112 117 124 127 61 59 54 115 112 117 124 127 61 59 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 118 121 123 109 118 115 112 118 52 90 118 115 124 106 112 118 117 53 122 123 17 58 60 56 58 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 55 59 91 56 61 65 55 60 65 60 57 53 56 62 59 55 64 59 52 55 58 65 55 55 17 54 111 118 116 108 54 104 115 108 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 57 54 115 112 117 124 127 61 59 54 115 112 117 124 127 61 59 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 118 121 123 109 118 115 112 118 52 90 118 115 124 106 112 118 117 53 122 123 17 58 60 63 63 63 17 52 52 52 52 52 52 52 52 52 52 17 17))!