!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion direccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'acceder' stamp: 'lu 10/17/2025 18:49:33'!
direccion
	^direccion ! !

!MarsRover methodsFor: 'acceder' stamp: 'lu 10/17/2025 18:26:31'!
posicion
	^posicion .! !


!MarsRover methodsFor: 'inicializacion' stamp: 'lu 10/17/2025 18:53:47'!
initialize
	posicion := 0@0.
	direccion := Norte new.! !


!MarsRover methodsFor: 'procesamiento' stamp: 'lu 10/20/2025 20:53:01'!
avanzarHaciaAdelante

	(direccion isMemberOf: Norte) ifTrue:[ ^ posicion :=(posicion x) @ (posicion y + 1)].
	(direccion isMemberOf: Sur) ifTrue:[ ^ posicion :=(posicion x) @ (posicion y - 1)].
	(direccion isMemberOf: Este) ifTrue:[ ^ posicion :=(posicion x + 1) @ (posicion y)].
	(direccion isMemberOf: Oeste) ifTrue:[ ^ posicion :=(posicion x - 1) @ (posicion y)].! !

!MarsRover methodsFor: 'procesamiento' stamp: 'lu 10/20/2025 20:52:53'!
avanzarHaciaAtras

	(direccion isMemberOf: Norte) ifTrue:[ ^ posicion :=(posicion x) @ (posicion y - 1)].
	(direccion isMemberOf: Sur) ifTrue:[ ^ posicion :=(posicion x) @ (posicion y + 1)].
	(direccion isMemberOf: Este) ifTrue:[ ^ posicion :=(posicion x - 1) @ (posicion y)].
	(direccion isMemberOf: Oeste) ifTrue:[ ^ posicion :=(posicion x + 1) @ (posicion y)].! !

!MarsRover methodsFor: 'procesamiento' stamp: 'lu 10/17/2025 18:47:12'!
procesar: stringDeInstrucciones 
	stringDeInstrucciones do:
		[:unaInstruccion | 
			self procesarInstruccion: unaInstruccion.
		].
! !

!MarsRover methodsFor: 'procesamiento' stamp: 'lu 10/20/2025 20:53:43'!
procesarInstruccion: unaInstruccion

	unaInstruccion = $f  ifTrue: [^self avanzarHaciaAdelante].
	unaInstruccion = $b ifTrue: [^self avanzarHaciaAtras].
	unaInstruccion = $l ifTrue:[^direccion := direccion rotarAIzquierda].
	direccion := direccion rotarADerecha .! !


!classDefinition: #PuntoCardinal category: 'Mars-Rover'!
Object subclass: #PuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!PuntoCardinal methodsFor: 'Rotar' stamp: 'lu 10/17/2025 18:55:49'!
rotarADerecha

	self subclassResponsibility! !

!PuntoCardinal methodsFor: 'Rotar' stamp: 'lu 10/17/2025 18:55:55'!
rotarAIzquierda

	self subclassResponsibility! !


!classDefinition: #Este category: 'Mars-Rover'!
PuntoCardinal subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Este methodsFor: 'Rotar' stamp: 'lu 10/17/2025 19:01:13'!
rotarADerecha

	^Sur new.! !

!Este methodsFor: 'Rotar' stamp: 'lu 10/20/2025 20:37:14'!
rotarAIzquierda

	^Norte new.! !


!classDefinition: #Norte category: 'Mars-Rover'!
PuntoCardinal subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Norte methodsFor: 'Rotar' stamp: 'lu 10/17/2025 19:00:43'!
rotarADerecha

	^Este new.! !

!Norte methodsFor: 'Rotar' stamp: 'lu 10/17/2025 18:58:37'!
rotarAIzquierda

	^ Oeste new.! !


!classDefinition: #Oeste category: 'Mars-Rover'!
PuntoCardinal subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Oeste methodsFor: 'Rotar' stamp: 'lu 10/20/2025 20:37:36'!
rotarADerecha

	^Norte new.! !

!Oeste methodsFor: 'Rotar' stamp: 'lu 10/20/2025 20:37:47'!
rotarAIzquierda

	^Sur new.! !


!classDefinition: #Sur category: 'Mars-Rover'!
PuntoCardinal subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Sur methodsFor: 'Rotar' stamp: 'lu 10/20/2025 20:38:05'!
rotarADerecha

	^Oeste new.! !

!Sur methodsFor: 'Rotar' stamp: 'lu 10/20/2025 20:38:14'!
rotarAIzquierda

	^Este new.! !


!classDefinition: #MarsRoverTest category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/17/2025 18:21:09'!
test01StringVacioNoCambiaPosicion
	| rover |
	rover := MarsRover new.
	
	self assert:  rover posicion equals: 0@0.
	
	rover procesar: ''.
	
	self assert:  rover posicion equals: 0@0.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/17/2025 18:22:12'!
test02StringUnafMueveHaciaAdelante
	| rover |
	rover := MarsRover new.
	
	self assert:  rover posicion equals: 0@0.
	
	rover procesar: 'f'.
	
	self assert:  rover posicion equals: 0@1.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/17/2025 18:27:23'!
test03StringUnabMueveHaciaAtras
	| rover |
	rover := MarsRover new.
	
	self assert:  rover posicion equals: 0@0.
	
	rover procesar: 'b'.
	
	self assert:  rover posicion equals: 0@-1.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/17/2025 18:30:05'!
test04StringFFMueveDosHaciaAdelante
	| rover |
	rover := MarsRover new.
	
	self assert:  rover posicion equals: 0@0.
	
	rover procesar: 'ff'.
	
	self assert:  rover posicion equals: 0@2.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/17/2025 18:31:16'!
test05StringBBMueveDosHaciaAtras
	| rover |
	rover := MarsRover new.
	
	self assert:  rover posicion equals: 0@0.
	
	rover procesar: 'bb'.
	
	self assert:  rover posicion equals: 0@-2.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/17/2025 18:33:16'!
test06StringTamano2CombinadoVuelveALaMismaPosicion
	| rover |
	rover := MarsRover new.
	
	self assert:  rover posicion equals: 0@0.
	
	rover procesar: 'bf'.
	
	self assert:  rover posicion equals: 0@0.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/17/2025 18:39:20'!
test06StringTamanoMayorADosCombinadoLlegaALaPosicionCorrecta
	| rover |
	
	rover := MarsRover new.
	
	self assert:  rover posicion equals: 0@0.
	
	rover procesar: 'bfffbbf'.
	
	self assert:  rover posicion equals: 0@1.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/17/2025 18:57:08'!
test07StringVacioNoCambiaDireccion
	| rover |
	rover := MarsRover new.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: ''.
	
	self assert:  (rover direccion isKindOf: Norte).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/17/2025 18:57:29'!
test08StringUnaInstruccionDeMovimientoNoCambiaDireccion
	| rover |
	rover := MarsRover new.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'f'.
	
	self assert:  (rover direccion isKindOf: Norte).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/17/2025 18:57:46'!
test09StringUnaLGiraHaciaOeste
	| rover |
	rover := MarsRover new.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'l'.
	
	self assert:  (rover direccion isKindOf: Oeste).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/17/2025 18:59:41'!
test10StringUnaRGiraHaciaEste
	| rover |
	rover := MarsRover new.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'r'.
	
	self assert:  (rover direccion isKindOf: Este).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/17/2025 19:01:00'!
test11StringRRGiraApuntandoASur
	| rover |
	rover := MarsRover new.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'rr'.
	
	self assert:  (rover direccion isKindOf: Sur).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/20/2025 19:28:39'!
test12StringLLGiraApuntandoASur
	| rover |
	rover := MarsRover new.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'll'.
	
	self assert:  (rover direccion isKindOf: Sur).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/20/2025 19:35:28'!
test13StringCombinadoDeRotacionesLlegaAPuntoCardinalCorrecto
	| rover |
	rover := MarsRover new.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'llrrlllrlrll'.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'lrrllrr'.
	
	self assert:  (rover direccion isKindOf: Este).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/20/2025 20:44:36'!
test14DoblarALaDerechaYAvanzarLlegaAPosicionCorrecta
	| rover |
	rover := MarsRover new.
	
	self assert:  rover posicion equals: 0@0.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'rf'.
	
	self assert:  rover posicion equals: 1@0.
	
	self assert:  (rover direccion isKindOf: Este).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/20/2025 20:45:14'!
test15DoblarALaIzquieraYAvanzarLlegaAPosicionCorrecta
	| rover |
	rover := MarsRover new.
	
	self assert:  rover posicion equals: 0@0.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'lf'.
	
	self assert:  rover posicion equals: -1@0.
	
	self assert:  (rover direccion isKindOf: Oeste).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/20/2025 20:46:11'!
test16DoblarALaDerechaEIrHaciaAtrasLlegaAPosicionCorrecta
	| rover |
	rover := MarsRover new.
	
	self assert:  rover posicion equals: 0@0.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'rb'.
	
	self assert:  rover posicion equals: -1@0.
	
	self assert:  (rover direccion isKindOf: Este).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/20/2025 20:46:40'!
test17DoblarALaIzquierdaEIrHaciaAtrasLlegaAPosicionCorrecta
	| rover |
	rover := MarsRover new.
	
	self assert:  rover posicion equals: 0@0.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'lb'.
	
	self assert:  rover posicion equals: 1@0.
	
	self assert:  (rover direccion isKindOf: Oeste).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lu 10/20/2025 20:56:51'!
test18StringCombinadoDeMovimientosYRotacionesLlegaAPosicionYPuntoCardinalCorrecto
	| rover |
	rover := MarsRover new.
	
	self assert:  rover posicion equals: 0@0.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'frrrfr'.
	
	self assert:  rover posicion equals: -1@1.
	
	self assert:  (rover direccion isKindOf: Norte).
	! !
