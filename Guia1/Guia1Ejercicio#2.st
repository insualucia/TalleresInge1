!classDefinition: #Bill category: #'Ejercicio 2'!
DenotativeObject subclass: #Bill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bill class' category: #'Ejercicio 2'!
Bill class
	instanceVariableNames: 'energia'!

!Bill class methodsFor: 'acciones' stamp: 'Lu 8/19/2025 21:10:23'!
caminar: unaCantidadDeKilometros
	
	energia := energia - 3 - unaCantidadDeKilometros ! !

!Bill class methodsFor: 'acciones' stamp: 'Lu 8/19/2025 21:14:59'!
comer: cantKilosCerebro

	energia := cantKilosCerebro * 4 + energia! !

!Bill class methodsFor: 'acciones' stamp: 'Lu 8/19/2025 21:18:07'!
energia
	^ energia! !

!Bill class methodsFor: 'acciones' stamp: 'Lu 8/19/2025 20:30:18'!
initialize
	energia := 28! !

Bill initialize!