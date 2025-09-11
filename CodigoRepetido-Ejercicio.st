!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'Ale 9/11/2025 19:48:01'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Ale 9/11/2025 19:54:13'!
removeCustomerNamed: aName 
	|mismoNombre|
	mismoNombre := [:nombreCliente| aName = nombreCliente].
	active removeAllSuchThat: mismoNombre.
	suspended removeAllSuchThat: mismoNombre.! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:52'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:56'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !


!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'assertsTiempos' stamp: 'Ale 9/11/2025 16:27:46'!
accionATestear: accionARealizar maxMilisegundosATardar: milliseconds
	|millisecondsBeforeRunning millisecondsAfterRunning|
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	accionARealizar value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < milliseconds	! !


!CustomerBookTest methodsFor: 'testing' stamp: 'Ale 9/11/2025 16:28:16'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook|
	
	customerBook := CustomerBook new.
	
	self accionATestear:[customerBook addCustomerNamed: 'John Lennon'] maxMilisegundosATardar:(50 * millisecond)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Ale 9/11/2025 16:28:23'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self accionATestear: [customerBook removeCustomerNamed: paulMcCartney] maxMilisegundosATardar: (100 * millisecond)	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Ale 9/11/2025 18:13:55'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self accionAVerificarFalla: [ customerBook addCustomerNamed: ''] tipoDeFallaEsperada:Error  condicionAVerificar1: [ :anError | anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage] condicionAVerificar2: [:anError | customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Ale 9/11/2025 18:14:01'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self accionAVerificarFalla: [ customerBook removeCustomerNamed: 'Paul McCartney'.] tipoDeFallaEsperada: NotFound condicionAVerificar1: [:anError |customerBook numberOfCustomers = 1] condicionAVerificar2: [:anError | customerBook includesCustomerNamed: johnLennon]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Ale 9/11/2025 18:46:38'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self customerBookAVerificar: customerBook cantClientesActivosEsperados: 0 cantClientesSuspendidosEsperados: 1 cantClientesEsperados: 1 paulMcCartneyEsCliente: True.	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Ale 9/11/2025 18:46:52'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self customerBookAVerificar: customerBook cantClientesActivosEsperados:0 cantClientesSuspendidosEsperados:0 cantClientesEsperados:0 paulMcCartneyEsCliente:False.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Ale 9/11/2025 18:07:55'!
test07CanNotSuspendAnInvalidCustomer
	
	self verificarFallaSuspendiendoA: 'George Harrison'! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Ale 9/11/2025 18:07:17'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	self verificarFallaSuspendiendoA: 'John Lennon'.! !


!CustomerBookTest methodsFor: 'assertsCasosErrores' stamp: 'Ale 9/11/2025 18:13:43'!
accionAVerificarFalla: accionAFallar tipoDeFallaEsperada: tipoFalla condicionAVerificar1: condicionAVerificar1 condicionAVerificar2:condicionAVerificar2
	[ accionAFallar value.
	self fail ]
			on: tipoFalla 
			do: [ :anError | 
				self assert: (condicionAVerificar1 value:anError).
				self assert: (condicionAVerificar2 value: anError) ]! !

!CustomerBookTest methodsFor: 'assertsCasosErrores' stamp: 'Ale 9/11/2025 18:14:21'!
verificarFallaSuspendiendoA: clienteASuspender
	|customerBook johnLennon|
		
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self accionAVerificarFalla: [customerBook suspendCustomerNamed: clienteASuspender] tipoDeFallaEsperada: CantSuspend condicionAVerificar1: [:anError | customerBook numberOfCustomers = 1] condicionAVerificar2: [:anError | customerBook includesCustomerNamed: johnLennon]
	! !


!CustomerBookTest methodsFor: 'assertsValores' stamp: 'Ale 9/11/2025 18:45:42'!
customerBookAVerificar: customerBook cantClientesActivosEsperados:cantClientesActivos cantClientesSuspendidosEsperados:cantClientesSuspendidos cantClientesEsperados:cantClientes paulMcCartneyEsCliente:estaPaulMcCartney
self assert: cantClientesActivos equals: customerBook  numberOfActiveCustomers.
self assert: cantClientesSuspendidos equals: customerBook numberOfSuspendedCustomers.
self assert: cantClientes equals: customerBook numberOfCustomers.
self assert: estaPaulMcCartney equals: (customerBook includesCustomerNamed: 'Paul McCartney').! !
