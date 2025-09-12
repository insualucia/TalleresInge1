!classDefinition: #Falso category: #'Ejercicio 3'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: #'Ejercicio 3'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'protocolo' stamp: 'Lu 8/19/2025 21:24:42'!
no
	^Verdadero! !

!Falso class methodsFor: 'protocolo' stamp: 'Lu 8/19/2025 21:28:25'!
o: unBooleano

	^ unBooleano! !

!Falso class methodsFor: 'protocolo' stamp: 'lu 8/19/2025 21:43:20'!
siFalso: unaAccionARealizarUIgnorar

	^ unaAccionARealizarUIgnorar value! !

!Falso class methodsFor: 'protocolo' stamp: 'lu 8/19/2025 21:42:58'!
siVerdadero: unaAccionARealizarUIgnorar! !

!Falso class methodsFor: 'protocolo' stamp: 'Lu 8/19/2025 21:26:13'!
y: unBooleano! !


!classDefinition: #TestBooleanos category: #'Ejercicio 3'!
DenotativeObject subclass: #TestBooleanos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestBooleanos class' category: #'Ejercicio 3'!
TestBooleanos class
	instanceVariableNames: ''!

!TestBooleanos class methodsFor: 'tests' stamp: 'Lu 8/19/2025 21:25:29'!
test01VerdaderoNegadoEsFalso

	Assert that: Verdadero no isEqualTo: Falso! !

!TestBooleanos class methodsFor: 'tests' stamp: 'Lu 8/19/2025 21:30:56'!
test02FalsoNegadoEsVerdadero

	Assert that: Falso no isEqualTo: Verdadero! !

!TestBooleanos class methodsFor: 'tests' stamp: 'lu 8/19/2025 21:39:54'!
test03VyVesV

	Assert that: (Verdadero y: Verdadero ) isEqualTo: Verdadero! !

!TestBooleanos class methodsFor: 'tests' stamp: 'Ale 8/21/2025 17:34:50'!
test04VyFesF

	Assert that: (Verdadero y: Falso ) isEqualTo: Falso! !

!TestBooleanos class methodsFor: 'tests' stamp: 'Ale 8/21/2025 17:35:03'!
test05FyFesF

	Assert that: (Falso y: Falso ) isEqualTo: Falso! !

!TestBooleanos class methodsFor: 'tests' stamp: 'Ale 8/21/2025 17:35:17'!
test06FyVesF

	Assert that: (Falso y: Verdadero ) isEqualTo: Falso! !

!TestBooleanos class methodsFor: 'tests' stamp: 'Ale 8/21/2025 17:35:42'!
test07VoFesV

	Assert that: (Verdadero o: Falso) isEqualTo: Verdadero! !

!TestBooleanos class methodsFor: 'tests' stamp: 'Ale 8/21/2025 17:36:12'!
test08VoVesV

	Assert that: (Verdadero o: Verdadero) isEqualTo: Verdadero! !

!TestBooleanos class methodsFor: 'tests' stamp: 'Ale 8/21/2025 17:36:25'!
test09FoVesV

	Assert that: (Falso o: Verdadero) isEqualTo: Verdadero! !

!TestBooleanos class methodsFor: 'tests' stamp: 'Ale 8/21/2025 17:36:39'!
test10FoFesF

	Assert that: (Falso o: Falso) isEqualTo: Falso! !

!TestBooleanos class methodsFor: 'tests' stamp: 'Ale 8/21/2025 17:37:23'!
test11FalsosiFalso

	Assert that: (Falso siFalso: [1 + 2] ) isEqualTo: 3! !

!TestBooleanos class methodsFor: 'tests' stamp: 'Ale 8/21/2025 17:44:20'!
test12VerdaderosiFalso
	|res|
	res :=0.
	Verdadero siFalso:[res := res + 1].
	Assert that: res isEqualTo: 0.! !

!TestBooleanos class methodsFor: 'tests' stamp: 'Ale 8/21/2025 17:43:02'!
test13VerdaderosiVerdadero
	|res|
	res :=0.
	Verdadero siVerdadero:[res := res + 1].
	Assert that: res isEqualTo: 1.! !

!TestBooleanos class methodsFor: 'tests' stamp: 'Ale 8/21/2025 17:45:00'!
test14FalsosiVerdadero
	|res|
	res :=0.
	Falso siVerdadero:[res := res + 1].
	Assert that: res isEqualTo: 0.! !


!classDefinition: #Verdadero category: #'Ejercicio 3'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: #'Ejercicio 3'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'protocolo' stamp: 'Lu 8/19/2025 21:24:07'!
no
	^ Falso! !

!Verdadero class methodsFor: 'protocolo' stamp: 'Lu 8/19/2025 21:27:59'!
o: unBooleano! !

!Verdadero class methodsFor: 'protocolo' stamp: 'lu 8/19/2025 21:42:40'!
siFalso: unaAccionARealizarUIgnorar! !

!Verdadero class methodsFor: 'protocolo' stamp: 'lu 8/19/2025 21:41:29'!
siVerdadero: unaAccionARealizarUIgnorar

	^ unaAccionARealizarUIgnorar value! !

!Verdadero class methodsFor: 'protocolo' stamp: 'Lu 8/19/2025 21:27:16'!
y: unBooleano 
	
	^unBooleano! !
