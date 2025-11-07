!classDefinition: #Account category: 'Portfolio2'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

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


!Account methodsFor: 'reports' stamp: 'AC 11/6/2025 17:59:36'!
report: reportType 
	self subclassResponsibility.! !

!Account methodsFor: 'reports' stamp: 'AC 11/6/2025 18:00:28'!
reportForPortfolio: aReportType
	self subclassResponsibility .! !


!Account methodsFor: 'initialization' stamp: 'AC 11/6/2025 18:50:07'!
initializeNamed: aName
	name := aName .! !


!Account methodsFor: 'name' stamp: 'AC 11/6/2025 20:00:20'!
name
	^name! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'Portfolio2'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'instance creation' stamp: 'AC 11/6/2025 18:49:37'!
named: aName
	^ self new initializeNamed: aName .! !


!classDefinition: #Portfolio category: 'Portfolio2'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

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


!Portfolio methodsFor: 'reports' stamp: 'AC 11/6/2025 18:01:35'!
accountsReport: aReportType
	accounts do: [:anAccount | 
						anAccount reportForPortfolio: aReportType.
					].! !

!Portfolio methodsFor: 'reports' stamp: 'AC 11/6/2025 17:59:36'!
report: reportType 
	^reportType reportForPortfolio: self.! !

!Portfolio methodsFor: 'reports' stamp: 'AC 11/6/2025 21:19:41'!
reportForPortfolio: aReportType
	aReportType reportPortfolioForPortfolio: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio2'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'AC 11/6/2025 18:54:13'!
named: aName with: anAccount

	| portfolio |
	portfolio := self named: aName.
	portfolio add: anAccount .
	^ portfolio .! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'AC 11/6/2025 18:54:05'!
named: aName with: anAccount with: anotherAccount

	| portfolio |
	portfolio := self named: aName.
	portfolio add: anAccount.
	portfolio add: anotherAccount.
	^ portfolio ! !

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


!classDefinition: #ReceptiveAccount category: 'Portfolio2'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

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


!ReceptiveAccount methodsFor: 'reports' stamp: 'AC 11/6/2025 17:59:36'!
report: reportType 
	^reportType reportForReceptiveAccount: self.! !

!ReceptiveAccount methodsFor: 'reports' stamp: 'AC 11/6/2025 20:52:39'!
reportForPortfolio: aReportType
	aReportType reportReceptiveAccountForPortfolio: self.! !

!ReceptiveAccount methodsFor: 'reports' stamp: 'AC 11/6/2025 18:04:26'!
reportTransactions: aReportType
	transactions do: [:aTransaction | 
						aTransaction report: aReportType.
					].
	! !


!classDefinition: #AccountReport category: 'Portfolio2'!
Object subclass: #AccountReport
	instanceVariableNames: 'account report'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountReport methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 17:56:10'!
reportForDeposit: aDeposit 
	self subclassResponsibility .! !

!AccountReport methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 17:51:48'!
reportForIncomingTransfer: anIncomingTransfer

	self subclassResponsibility! !

!AccountReport methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 17:51:53'!
reportForOutgoingTransfer: anOutgoingTransfer

	self subclassResponsibility! !

!AccountReport methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 17:51:59'!
reportForPortfolio: aPortfolio

	self subclassResponsibility! !

!AccountReport methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 18:32:19'!
reportForReceptiveAccount: aReceptiveAccount

	self subclassResponsibility ! !

!AccountReport methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 17:52:06'!
reportForWithdraw: aWithdraw

	self subclassResponsibility! !

!AccountReport methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 21:20:04'!
reportPortfolioForPortfolio: aPortfolio
	self subclassResponsibility ! !

!AccountReport methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 20:52:39'!
reportReceptiveAccountForPortfolio: aReceptiveAccount
	self subclassResponsibility ! !


!AccountReport methodsFor: 'initialization' stamp: 'AC 11/7/2025 12:59:19'!
initializeFor: anAccount
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReport class' category: 'Portfolio2'!
AccountReport class
	instanceVariableNames: ''!

!AccountReport class methodsFor: 'as yet unclassified' stamp: 'AC 11/6/2025 20:32:12'!
on: anAccount

	^self new initializeFor: anAccount .! !


!classDefinition: #AccountSummary category: 'Portfolio2'!
AccountReport subclass: #AccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountSummary methodsFor: 'initialization' stamp: 'AC 11/7/2025 12:50:36'!
initializeFor: anAccount
	account := anAccount .
	report := WriteStream on: (String new).! !


!AccountSummary methodsFor: 'getReport' stamp: 'AC 11/6/2025 18:15:05'!
lines
	account report: self.
	^report contents 
	! !


!AccountSummary methodsFor: 'reportsForClasses' stamp: 'AC 11/7/2025 12:50:51'!
reportForDeposit: aDeposit
	
	report nextPutAll: 'Depósito por ', aDeposit value asString.
	report newLine.! !

!AccountSummary methodsFor: 'reportsForClasses' stamp: 'AC 11/7/2025 12:50:58'!
reportForIncomingTransfer: anIncomingTransfer
	
	report nextPutAll: 'Entrada por transferencia de ', anIncomingTransfer value asString .
	report newLine.! !

!AccountSummary methodsFor: 'reportsForClasses' stamp: 'AC 11/7/2025 12:51:25'!
reportForOutgoingTransfer: anOutgoingTransfer
	
	report nextPutAll: 'Salida por transferencia de ', anOutgoingTransfer value asString .
	report newLine.! !

!AccountSummary methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 18:11:34'!
reportForPortfolio: aPortfolio 
	aPortfolio accountsReport: self.
	report nextPutAll: 'Balance = ', aPortfolio balance asString.! !

!AccountSummary methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 18:12:08'!
reportForReceptiveAccount: aReceptiveAccount 
	aReceptiveAccount reportTransactions: self .
	report nextPutAll: 'Balance = ', aReceptiveAccount balance asString.
	 ! !

!AccountSummary methodsFor: 'reportsForClasses' stamp: 'AC 11/7/2025 12:51:47'!
reportForWithdraw: aWithdraw
	report nextPutAll: 'Extracción por ', aWithdraw value asString .
	report newLine .! !

!AccountSummary methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 21:20:42'!
reportPortfolioForPortfolio: aPortfolio
	^aPortfolio accountsReport: self! !

!AccountSummary methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 20:54:16'!
reportReceptiveAccountForPortfolio: aReceptiveAccount
	aReceptiveAccount reportTransactions: self.! !


!classDefinition: #AccountTransferNet category: 'Portfolio2'!
AccountReport subclass: #AccountTransferNet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountTransferNet methodsFor: 'initialization' stamp: 'AC 11/6/2025 18:24:32'!
initializeFor: anAccount 
	account := anAccount.
	report := 0.! !


!AccountTransferNet methodsFor: 'getReport' stamp: 'AC 11/6/2025 18:28:42'!
value
	account report: self.
	^report ! !


!AccountTransferNet methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 18:35:15'!
reportForDeposit: aDeposit ! !

!AccountTransferNet methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 18:33:28'!
reportForIncomingTransfer: anIncomingTransfer 
	report := report + anIncomingTransfer value! !

!AccountTransferNet methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 18:31:53'!
reportForOutgoingTransfer: anOutgoingTransfer 
	report := report - anOutgoingTransfer value! !

!AccountTransferNet methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 18:38:19'!
reportForPortfolio: aPortfolio 
	aPortfolio accountsReport: self.! !

!AccountTransferNet methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 18:32:59'!
reportForReceptiveAccount: aReceptiveAccount 
	aReceptiveAccount reportTransactions: self.! !

!AccountTransferNet methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 18:35:25'!
reportForWithdraw: aWithdraw ! !

!AccountTransferNet methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 21:20:51'!
reportPortfolioForPortfolio: aPortfolio
	^aPortfolio accountsReport: self! !

!AccountTransferNet methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 20:54:52'!
reportReceptiveAccountForPortfolio: aReceptiveAccount
	aReceptiveAccount reportTransactions: self.! !


!classDefinition: #PortfolioReport category: 'Portfolio2'!
AccountReport subclass: #PortfolioReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!PortfolioReport methodsFor: 'initialization' stamp: 'AC 11/6/2025 20:17:42'!
initializeFor: anAccount 
	self subclassResponsibility .! !


!PortfolioReport methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 20:20:36'!
reportForPortfolio: aPortfolio 
	self subclassResponsibility .! !

!PortfolioReport methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 21:21:33'!
reportPortfolioForPortfolio: aPortfolio 
	self subclassResponsibility .! !

!PortfolioReport methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 20:55:36'!
reportReceptiveAccountForPortfolio: aReceptiveAccount 
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioReport class' category: 'Portfolio2'!
PortfolioReport class
	instanceVariableNames: ''!

!PortfolioReport class methodsFor: 'instance creation' stamp: 'AC 11/6/2025 20:32:52'!
on: anAccount
	(anAccount isKindOf: ReceptiveAccount) ifTrue:[ self error: self errorMessageCannotBeUsedOnReceptiveAccount].
	^self new initializeFor: anAccount .! !


!PortfolioReport class methodsFor: 'errorMessages' stamp: 'AC 11/6/2025 20:34:13'!
errorMessageCannotBeUsedOnReceptiveAccount
	^'Report is only available for Portfolios accounts'! !


!classDefinition: #PortfolioTreePrinter category: 'Portfolio2'!
PortfolioReport subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolioTreeLevel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'AC 11/6/2025 21:31:06'!
initializeFor: aPortfolio
	account := aPortfolio.
	report := ReadWriteStream on: (String new).
	portfolioTreeLevel := 0.! !


!PortfolioTreePrinter methodsFor: 'getReport' stamp: 'AC 11/6/2025 20:20:13'!
lines
	account report: self.
	^report contents .! !


!PortfolioTreePrinter methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 21:35:13'!
reportForPortfolio: aPortfolio 
	report nextPutAll: aPortfolio name.
	portfolioTreeLevel := portfolioTreeLevel +1.
	aPortfolio accountsReport: self.! !

!PortfolioTreePrinter methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 21:32:31'!
reportPortfolioForPortfolio: aPortfolio
	self  nextLineWithTab .
	report nextPutAll: aPortfolio name.
	portfolioTreeLevel := portfolioTreeLevel +1.
	aPortfolio accountsReport: self.! !

!PortfolioTreePrinter methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 20:58:09'!
reportReceptiveAccountForPortfolio: aReceptiveAccount 
	self nextLineWithTab.
	report nextPutAll: aReceptiveAccount name.! !


!PortfolioTreePrinter methodsFor: 'modifiers' stamp: 'AC 11/6/2025 22:20:30'!
addTab

	^ 3* portfolioTreeLevel timesRepeat: [report nextPutAll:' ']! !

!PortfolioTreePrinter methodsFor: 'modifiers' stamp: 'AC 11/6/2025 22:20:30'!
nextLineWithTab
	report newLine.
	self addTab.! !


!classDefinition: #PortfolioSummary category: 'Portfolio2'!
PortfolioTreePrinter subclass: #PortfolioSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!PortfolioSummary methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 21:54:41'!
reportForPortfolio: aPortfolio 
	super reportForPortfolio: aPortfolio.
	self nextLineWithTab.
	report nextPutAll: 'Balance = ',aPortfolio balance asString.
	! !

!PortfolioSummary methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 22:49:14'!
reportPortfolioForPortfolio: aPortfolio 
	super reportPortfolioForPortfolio: aPortfolio .
	self nextLineWithTab .
	report nextPutAll: 'Balance = ', aPortfolio balance asString .
	portfolioTreeLevel := portfolioTreeLevel -1.! !

!PortfolioSummary methodsFor: 'reportsForClasses' stamp: 'AC 11/6/2025 22:22:20'!
reportReceptiveAccountForPortfolio: aReceptiveAccount 
	| accountSummaryReport |
	super reportReceptiveAccountForPortfolio: aReceptiveAccount .
	portfolioTreeLevel := portfolioTreeLevel +1.
	accountSummaryReport := AccountSummary on: aReceptiveAccount .
	accountSummaryReport lines linesDo:[:aLine | 
											self nextLineWithTab .
											report nextPutAll: aLine
										].
	portfolioTreeLevel := portfolioTreeLevel - 1.! !


!classDefinition: #AccountTransaction category: 'Portfolio2'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'report' stamp: 'AC 11/6/2025 18:04:56'!
report: aReportType
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio2'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio2'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'report' stamp: 'AC 11/6/2025 18:05:45'!
report: aReportType
	aReportType reportForDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio2'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferTransactions category: 'Portfolio2'!
AccountTransaction subclass: #TransferTransactions
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!TransferTransactions methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 01:57:59'!
affectBalance: aBalance

	self subclassResponsibility! !

!TransferTransactions methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 01:57:41'!
initializeFor: aTransfer

	transfer := aTransfer .! !

!TransferTransactions methodsFor: 'as yet unclassified' stamp: 'AC 11/6/2025 15:47:11'!
transfer
	^transfer ! !

!TransferTransactions methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 01:57:28'!
value

	^transfer value.! !


!TransferTransactions methodsFor: 'report' stamp: 'AC 11/6/2025 18:06:04'!
report: aReportType
	self subclassResponsibility .! !


!classDefinition: #IncomingTransfer category: 'Portfolio2'!
TransferTransactions subclass: #IncomingTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!IncomingTransfer methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 02:05:16'!
affectBalance: aBalance

	^transfer affectBalanceOfReceiver: aBalance. ! !

!IncomingTransfer methodsFor: 'as yet unclassified' stamp: 'AC 11/7/2025 12:45:32'!
depositLeg

	^self! !

!IncomingTransfer methodsFor: 'as yet unclassified' stamp: 'AC 11/7/2025 12:44:22'!
withdrawLeg

	^transfer withdrawLeg.! !


!IncomingTransfer methodsFor: 'report' stamp: 'AC 11/6/2025 18:06:25'!
report: aReportType
	aReportType reportForIncomingTransfer: self.! !


!classDefinition: #OutgoingTransfer category: 'Portfolio2'!
TransferTransactions subclass: #OutgoingTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!OutgoingTransfer methodsFor: 'as yet unclassified' stamp: 'LU 11/4/2025 02:05:34'!
affectBalance: aBalance

	^transfer affectBalanceOfSender: aBalance. ! !

!OutgoingTransfer methodsFor: 'as yet unclassified' stamp: 'AC 11/7/2025 12:46:33'!
depositLeg
	^transfer depositLeg .! !

!OutgoingTransfer methodsFor: 'as yet unclassified' stamp: 'AC 11/7/2025 12:46:21'!
withdrawLeg
	^self! !


!OutgoingTransfer methodsFor: 'report' stamp: 'AC 11/6/2025 18:06:45'!
report: aReportType
	aReportType reportForOutgoingTransfer: self.! !


!classDefinition: #Withdraw category: 'Portfolio2'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'report' stamp: 'AC 11/6/2025 18:07:00'!
report: aReportType
	aReportType reportForWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio2'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'Portfolio2'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Transfer methodsFor: 'testing' stamp: 'AC 11/6/2025 15:41:49'!
depositLeg

	^ depositLeg .! !

!Transfer methodsFor: 'testing' stamp: 'LU 11/4/2025 03:52:30'!
value

	^ value.! !

!Transfer methodsFor: 'testing' stamp: 'AC 11/6/2025 15:42:01'!
withdrawLeg

	^ withdrawLeg.! !


!Transfer methodsFor: 'balance' stamp: 'LU 11/4/2025 02:06:04'!
affectBalanceOfReceiver: aBalance

	^aBalance + value.! !

!Transfer methodsFor: 'balance' stamp: 'LU 11/4/2025 02:06:12'!
affectBalanceOfSender: aBalance

	^aBalance - value.! !


!Transfer methodsFor: 'initialization' stamp: 'AC 11/6/2025 15:41:10'!
initializeWithValue: aValue from: sendersAccount to: receiversAccount 
	withdrawLeg := (OutgoingTransfer new initializeFor: self).
	depositLeg := (IncomingTransfer new initializeFor: self).
	value := aValue .
	sendersAccount register: withdrawLeg.
	receiversAccount register: depositLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'Portfolio2'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'AC 11/7/2025 12:41:56'!
register: aValue from: sendersAccount to: receiversAccount
	
	^Transfer new initializeWithValue: aValue from: sendersAccount to: receiversAccount .! !


!classDefinition: #AccountReportTest category: 'Portfolio2'!
TestCase subclass: #AccountReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/6/2025 18:23:01'!
test01AccountSummaryOfEmptyAccountShowsBalanceInZero

	| account portfolio accountReport portfolioReport |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	accountReport := AccountSummary on: account.
	portfolioReport := AccountSummary on: portfolio.
	
	self assert: 'Balance = 0' equals: accountReport lines.
	self assert: 'Balance = 0' equals: portfolioReport lines.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/7/2025 12:55:36'!
test02AccountSummaryOfAccountWithOneTransactionShowsTransactionInformationAndAccountBalance

	| account result report |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	report := AccountSummary on: account.
	
	result := WriteStream on: (String new).
	result nextPutAll: 'Depósito por 100'.
	result newLine.
	result nextPutAll: 'Balance = 100'.
	
	self assert: result contents equals: report lines.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/7/2025 12:56:08'!
test03AccountSummaryOfAccountWithManyTransactionsShowsTransactionsInformationAndAccountBalance

	| account account2 result report |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account .
	Transfer register: 20 from:account  to:account2. 
	Transfer register: 30 from:account2  to:account. 
	
	report := AccountSummary on: account.
	
	result := WriteStream on: (String new).
	result nextPutAll: 'Depósito por 100'.
	result newLine .
	result nextPutAll: 'Extracción por 50'.
	result newLine.
	result nextPutAll: 'Salida por transferencia de 20'.
	result newLine.
	result nextPutAll: 'Entrada por transferencia de 30'.
	result newLine.
	result nextPutAll: 'Balance = 60'.
	
	self assert: result contents equals: report lines.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/7/2025 12:56:54'!
test04AccountSummaryOfPortfolioWithManyTransactionsShowsTransactionsInformationAndAccountBalance

	| account account2 result portfolio1 portfolio2 report |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Deposit register: 30 on: account2.
	Withdraw register: 50 on: account .
	Transfer register: 20 from:account  to:account2. 
	Transfer register: 30 from:account2  to:account. 
	
	portfolio1 := Portfolio with: account.
	portfolio2:= Portfolio with: account2.
	portfolio1 add: portfolio2 .
	
	report := AccountSummary on: portfolio1.
	
	result := WriteStream on: (String new).
	result nextPutAll: 'Depósito por 100'.
	result newLine.
	result nextPutAll: 'Extracción por 50'.
	result newLine.
	result nextPutAll: 'Salida por transferencia de 20'.
	result newLine.
	result nextPutAll: 'Entrada por transferencia de 30'.
	result newLine.
	result nextPutAll: 'Depósito por 30'.
	result newLine.
	result nextPutAll: 'Entrada por transferencia de 20'.
	result newLine.
	result nextPutAll: 'Salida por transferencia de 30'.
	result newLine.
	result nextPutAll: 'Balance = 80'.
	
	self assert: result contents equals: report lines.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/6/2025 20:13:22'!
test05TransferNetOfEmptyAccountIsZero

	| report1 report2 account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	report1 := AccountTransferNet on: account .
	report2 := AccountTransferNet on: portfolio .
	
	self assert: 0 equals: report1 value .
	self assert: 0 equals: report2 value .! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/7/2025 12:41:56'!
test06TransferNetOfAccountWithOneTransferHasItsValue

	| account1 account2 report1 report2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	report1 := AccountTransferNet on: account1 .
	report2 := AccountTransferNet on: account2.
	Transfer register: 20 from:account1  to: account2. 
	
	self assert: -20  equals: report1 value.
	self assert: 20 equals: report2 value.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/7/2025 12:41:56'!
test07TransferNetOfAccountWithManyTransactionsIsOnlyTransfersBalance

	| account account2 report1 report2 |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account .
	Transfer register: 20 from:account  to:account2. 
	Transfer register: 30 from:account2  to:account. 
	
	report1 := AccountTransferNet on: account .
	report2 := AccountTransferNet on: account2.
	
	self assert: 10 equals: report1 value .
	self assert: -10 equals: report2 value .! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/7/2025 12:41:56'!
test08TransferNetOfPortfolioWithManyTransactionsIsOnlyTransfersBalance

	| report account account2 portfolio1 portfolio2 account3 report2 |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Deposit register: 30 on: account2.
	Withdraw register: 50 on: account .
	Transfer register: 20 from:account  to:account2. 
	Transfer register: 30 from:account2  to:account. 
	Transfer register: 100 from: account3 to: account2.
	Transfer register: 20 from: account to: account3.
	
	
	portfolio1 := Portfolio with: account.
	portfolio2:= Portfolio with: account2.
	portfolio1 add: portfolio2 .
	
	report := AccountTransferNet on: portfolio1.
	report2 := AccountTransferNet on: portfolio2 .
	
	self assert: 80 equals: report value.
	self assert: 90 equals: report2 value.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/6/2025 20:25:53'!
test09PortfolioTreePrinterEmptyPortfolioPrintsItsName
	| portfolio report |
	portfolio := Portfolio named: 'Portfolio F1'.
	
	report := PortfolioTreePrinter on: portfolio.
	
	self assert: 'Portfolio F1' equals: report lines.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/6/2025 20:38:27'!
test10PortfolioTreePrinterCannotBeUsedForReceptiveAccount
	| report account |
	account := ReceptiveAccount named: 'Cuenta de Franco Colapinto'.
	
	self should:[report := PortfolioTreePrinter on: account]
	raise: Error
	withExceptionDo: [:error |
						self assert: PortfolioTreePrinter errorMessageCannotBeUsedOnReceptiveAccount equals: error messageText.	
					]! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/6/2025 21:03:47'!
test11PortfolioTreePrinterWithOneAccountShowsPortfolioAndAccountNames
	| report account portfolio result |
	
	account := ReceptiveAccount named: 'Cuenta de Franco Colapinto'.
	
	portfolio := Portfolio named: 'Portfolio F1'  with: account.
	
	report := PortfolioTreePrinter on: portfolio.
	result := WriteStream on: (String new).
	result nextPutAll: 'Portfolio F1'.
	result newLine.
	result nextPutAll: '   '.
	result nextPutAll: 'Cuenta de Franco Colapinto'.
	
	self assert: result contents equals: report lines.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/6/2025 21:09:00'!
test12PortfolioTreePrinterWithManyAccountsShowsPortfolioAndAccountsNames
	| report account portfolio result account2 |
	
	account := ReceptiveAccount named: 'Cuenta de Franco Colapinto'.
	account2 := ReceptiveAccount named: 'Cuenta de Charles Leclerc'.
	
	portfolio := Portfolio named: 'Portfolio F1'  with: account with: account2.
	
	report := PortfolioTreePrinter on: portfolio.
	result := WriteStream on: (String new).
	result nextPutAll: 'Portfolio F1'.
	result newLine.
	result nextPutAll: '   '.
	result nextPutAll: 'Cuenta de Franco Colapinto'.
	result newLine.
	result nextPutAll: '   '.
	result nextPutAll: 'Cuenta de Charles Leclerc'.
	
	self assert: result contents equals: report lines.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/6/2025 21:14:45'!
test13PortfolioTreePrinterWithManyAccountsAndPortfolioShowsPortfoliosAndAccountsNames
	| report account result account2 account3 portfolio1 portfolio2 |
	
	account := ReceptiveAccount named: 'Cuenta de Franco Colapinto'.
	account2 := ReceptiveAccount named: 'Cuenta de Charles Leclerc'.
	account3 := ReceptiveAccount  named: 'Cuenta de Lewis Hamilton'.
	
	portfolio1 := Portfolio named: 'Portfolio Ferrari'  with: account2 with: account3.
	portfolio2 := Portfolio named: 'Portfolio F1' with: account with:portfolio1.
	
	report := PortfolioTreePrinter on: portfolio2.
	
	result := WriteStream on: (String new).
	result nextPutAll: 'Portfolio F1'.
	result newLine.
	result nextPutAll: '   '.
	result nextPutAll: 'Cuenta de Franco Colapinto'.
	result newLine.
	result nextPutAll: '   '.
	result nextPutAll: 'Portfolio Ferrari'.
	result newLine.
	result nextPutAll: '      '.
	result nextPutAll: 'Cuenta de Charles Leclerc'.
	result newLine.
	result nextPutAll: '      '.
	result nextPutAll: 'Cuenta de Lewis Hamilton'.
	
	self assert: result contents equals: report lines.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/6/2025 21:37:31'!
test14PortfolioSummaryEmptyPortfolioPrintsItsName
	| portfolio report |
	portfolio := Portfolio named: 'Portfolio F1'.
	
	report := PortfolioTreePrinter on: portfolio.
	
	self assert: 'Portfolio F1' equals: report lines.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/6/2025 21:49:22'!
test15PortfolioSummaryEmptyPortfolioPrintsItsNameAndBalance
	| portfolio report result |
	portfolio := Portfolio named: 'Portfolio F1'.
	
	report := PortfolioSummary on: portfolio.
	
	result := ReadWriteStream on: (String new).
	result nextPutAll: 'Portfolio F1'.
	result newLine.
	result nextPutAll: '   Balance = 0'.
	
	self assert: result contents equals: report lines.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/6/2025 22:01:57'!
test16PortfolioSummaryWithOneAccountPrintsItsNameAndBalanceAndAccountNameWithTransactions
	| portfolio report result account |

	account := ReceptiveAccount named: 'Cuenta de Franco Colapinto'.
	
	portfolio := Portfolio named: 'Portfolio F1'  with: account.
	
	Deposit register: 434343 on: account. 
	
	report := PortfolioSummary on: portfolio.
	result := WriteStream on: (String new).
	result nextPutAll: 'Portfolio F1'.
	result newLine.
	result nextPutAll: '   '.
	result nextPutAll: 'Cuenta de Franco Colapinto'.
	result newLine.
	result nextPutAll: '      Depósito por 434343'.
	result newLine .
	result nextPutAll: '      Balance = 434343'.
	result newLine.
	result nextPutAll: '   Balance = 434343'.
	
	self assert: result contents equals: report lines.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/6/2025 22:43:56'!
test17PortfolioSummaryWithManyAccountsShowsPortfolioAndAccountsNamesAndSummaries
	| report account result account2 account3 portfolio1 portfolio2 |
	
	account := ReceptiveAccount named: 'Cuenta de Franco Colapinto'.
	account2 := ReceptiveAccount named: 'Cuenta de Charles Leclerc'.
	account3 := ReceptiveAccount  named: 'Cuenta de Lewis Hamilton'.
	
	portfolio1 := Portfolio named: 'Portfolio Ferrari'  with: account2 with: account3.
	portfolio2 := Portfolio named: 'Portfolio F1' with: account with:portfolio1.
	
	report := PortfolioTreePrinter on: portfolio2.
	
	result := WriteStream on: (String new).
	result nextPutAll: 'Portfolio F1'.
	result newLine.
	result nextPutAll: '   '.
	result nextPutAll: 'Cuenta de Franco Colapinto'.
	result newLine.
	result nextPutAll: '   '.
	result nextPutAll: 'Portfolio Ferrari'.
	result newLine.
	result nextPutAll: '      '.
	result nextPutAll: 'Cuenta de Charles Leclerc'.
	result newLine.
	result nextPutAll: '      '.
	result nextPutAll: 'Cuenta de Lewis Hamilton'.
	
	self assert: result contents equals: report lines.! !

!AccountReportTest methodsFor: 'tests' stamp: 'AC 11/7/2025 12:41:56'!
test18PortfolioSummaryWithManyAccountsAndPortfolioShowsPortfoliosAndAccountsNamesAndSummaries
| report account portfolio result account2 account3 portfolio2 |
	
	account := ReceptiveAccount named: 'Cuenta de Franco Colapinto'.
	account2 := ReceptiveAccount named: 'Cuenta de Charles Leclerc'.
	account3 := ReceptiveAccount named: 'Cuenta de Max Verstappen'.
	
	portfolio2 := Portfolio named: 'Pilotos Experimentados'  with: account3 with: account2.
	portfolio := Portfolio named: 'Pilotos F1' with: account with: portfolio2.
	
	Transfer register: 16161616 from: account2  to: account. 
	Withdraw register: 16 on: account.
	Deposit register: 331 on: account3. 
	
	report := PortfolioSummary on: portfolio.
	result := WriteStream on: (String new).
	result nextPutAll: 'Pilotos F1'.
	result newLine.
	result nextPutAll: '   Cuenta de Franco Colapinto'.
	result newLine.
	result nextPutAll: '      Entrada por transferencia de 16161616'.
	result newLine .
	result nextPutAll: '      Extracción por 16'.
	result newLine .
	result nextPutAll: '      Balance = 16161600'.
	result newLine.
	result nextPutAll: '   Pilotos Experimentados'.
	result newLine.
	result nextPutAll: '      Cuenta de Max Verstappen'.
	result newLine.
	result nextPutAll: '         Depósito por 331'.
	result newLine.
	result nextPutAll: '         Balance = 331'.
	result newLine.
	result nextPutAll: '      Cuenta de Charles Leclerc'.
	result newLine .
	result nextPutAll: '         Salida por transferencia de 16161616'.
	result newLine .
	result nextPutAll: '         Balance = -16161616'.
	result newLine.
	result nextPutAll: '      Balance = -16161285'.
	result newLine .
	result nextPutAll: '   Balance = 315'.
	
	
	self assert: result contents equals: report lines.! !


!classDefinition: #PortfolioTest category: 'Portfolio2'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

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


!classDefinition: #ReceptiveAccountTest category: 'Portfolio2'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AC 11/7/2025 12:41:56'!
test08TransferValueAddsToReceiverAndSubstractsFromSendersBalance

	| account1 account2 transfer1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer1 := Transfer register: 100 from: account1 to: account2.
		
	self assert: 100 equals: account2 balance.
	self assert: 100 equals: account2 balance.
	
! !


!classDefinition: #TransfersTest category: 'Portfolio2'!
TestCase subclass: #TransfersTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!TransfersTest methodsFor: 'tests' stamp: 'AC 11/7/2025 12:41:56'!
test01TransferValueAddsToReceiverAndSubstractsFromSendersBalance

	| account1 account2 transfer1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer1 := Transfer register: 100 from: account1 to: account2.
		
	self assert: 100 equals: account2 balance.
	self assert: 100 equals: account2 balance.
	
! !

!TransfersTest methodsFor: 'tests' stamp: 'AC 11/7/2025 12:41:56'!
test02TransferLegAreRegisteredInAccounts

	| account1 account2 transfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer := Transfer register: 100 from: account1 to: account2.
		
	self assert: (account1 hasRegistered: transfer withdrawLeg).
	self assert: (account2 hasRegistered: transfer depositLeg ).
	
! !

!TransfersTest methodsFor: 'tests' stamp: 'AC 11/7/2025 12:41:56'!
test03LegsHaveSameTransfer

	| account1 account2 transfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer := Transfer register: 100 from: account1 to: account2.
		
	self assert:  transfer withdrawLeg transfer equals: transfer depositLeg transfer.
	
! !

!TransfersTest methodsFor: 'tests' stamp: 'AC 11/7/2025 12:41:56'!
test04CanGoFromDepositLegToWithdrawLeg

	| account1 account2 transfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer := Transfer register: 100 from: account1 to: account2.
		
	self assert: transfer withdrawLeg equals: transfer depositLeg transfer withdrawLeg .
	
! !

!TransfersTest methodsFor: 'tests' stamp: 'AC 11/7/2025 12:41:56'!
test05CanGoFromWithdrawLegToDepositLeg

	| account1 account2 transfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer := Transfer register: 100 from: account1 to: account2.
		
	self assert: transfer depositLeg equals: transfer withdrawLeg transfer depositLeg .
	
! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 126 112 117 107 118 126 122 61 59 17 74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 126 112 117 107 118 126 122 61 59 99 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 53 112 116 104 110 108 17 94 112 117 58 57 17 61 53 57 17 95 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 100 17 94 112 117 107 118 126 122 17 94 112 117 58 57 39 105 124 112 115 123 39 118 117 39 84 104 121 39 39 56 39 57 55 57 60 39 55 56 65 55 59 65 57 57 39 78 84 91 39 74 118 116 119 112 115 108 121 65 39 59 53 57 53 56 39 74 118 116 119 104 123 112 105 115 108 39 74 115 104 117 110 39 63 53 55 53 56 39 47 123 104 110 122 54 89 76 83 76 72 90 76 102 63 55 56 54 109 112 117 104 115 48 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 84 104 121 39 39 56 39 57 55 57 60 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 84 104 121 39 39 56 39 57 55 57 60 17 93 84 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 84 118 117 39 86 106 123 39 61 39 56 57 65 58 59 65 57 56 39 57 55 57 60 39 74 118 116 116 112 123 79 104 122 111 65 39 108 107 58 60 59 63 61 39 87 115 124 110 112 117 122 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 199 175 217 199 17 56 64 57 53 56 61 63 53 57 56 55 53 56 64 57 17 83 72 87 91 86 87 52 57 73 79 64 59 80 61 75 53 115 104 117 17 83 72 87 91 86 87 52 57 73 79 64 59 80 61 75 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 55 62 91 56 57 65 59 55 65 59 59 53 58 57 60 58 56 61 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 91 104 115 115 108 121 108 122 80 117 110 108 56 99 76 113 108 121 106 112 106 112 118 87 118 121 123 109 118 115 112 118 99 87 118 121 123 109 118 115 112 118 52 84 108 123 111 118 107 86 105 113 108 106 123 53 122 123 17 60 62 63 63 57 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 55 62 91 56 58 65 55 60 65 58 61 53 56 59 64 58 56 61 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 118 121 123 109 118 115 112 118 57 53 122 123 17 60 57 55 60 59 17 52 52 52 52 52 52 52 52 52 52 17 17))!