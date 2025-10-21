!classDefinition: #MarsRover category: #'Mars-Rover'!
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


!MarsRover methodsFor: 'inicializacion' stamp: 'AC 10/21/2025 12:10:28'!
inicializarRoverEnPosicion: unaPosicion yDireccion: unPuntoCardinal
	posicion := unaPosicion.
	direccion := unPuntoCardinal.! !


!MarsRover methodsFor: 'procesamiento' stamp: 'AC 10/21/2025 11:11:20'!
avanzarHaciaAdelante
	direccion moverHaciaAdelante: self.! !

!MarsRover methodsFor: 'procesamiento' stamp: 'AC 10/21/2025 11:18:11'!
avanzarHaciaAtras
	direccion moverHaciaAtras: self.! !

!MarsRover methodsFor: 'procesamiento' stamp: 'AC 10/21/2025 14:53:37'!
esInstruccionValida: unaPotencialInstruccion
	^unaPotencialInstruccion  = $f or:[unaPotencialInstruccion = $b or:[unaPotencialInstruccion = $r or:[unaPotencialInstruccion = $l]]]! !

!MarsRover methodsFor: 'procesamiento' stamp: 'AC 10/21/2025 11:16:26'!
moverHaciaEste
	posicion :=(posicion x + 1) @ (posicion y).! !

!MarsRover methodsFor: 'procesamiento' stamp: 'AC 10/21/2025 11:16:50'!
moverHaciaNorte
	posicion :=(posicion x) @ (posicion y + 1)! !

!MarsRover methodsFor: 'procesamiento' stamp: 'AC 10/21/2025 11:17:16'!
moverHaciaOeste
	posicion :=(posicion x - 1) @ (posicion y)! !

!MarsRover methodsFor: 'procesamiento' stamp: 'AC 10/21/2025 11:17:34'!
moverHaciaSur
	posicion :=(posicion x) @ (posicion y - 1)! !

!MarsRover methodsFor: 'procesamiento' stamp: 'AC 10/21/2025 14:53:09'!
procesar: stringDeInstrucciones 
	stringDeInstrucciones do:
		[:unaInstruccion | 
			(self esInstruccionValida: unaInstruccion) ifFalse: [^self].
			self procesarInstruccion: unaInstruccion.
		].
! !

!MarsRover methodsFor: 'procesamiento' stamp: 'lu 10/20/2025 20:53:43'!
procesarInstruccion: unaInstruccion

	unaInstruccion = $f  ifTrue: [^self avanzarHaciaAdelante].
	unaInstruccion = $b ifTrue: [^self avanzarHaciaAtras].
	unaInstruccion = $l ifTrue:[^direccion := direccion rotarAIzquierda].
	direccion := direccion rotarADerecha .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Mars-Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'AC 10/21/2025 14:41:24'!
inicializarRoverEnPosicion: unaPosicion yDireccion: unPuntoCardinal
	(unaPosicion isKindOf: Point) ifFalse: [self error: self errorMessagePosicionNoEsUnPoint].
	(unPuntoCardinal isKindOf: PuntoCardinal) ifFalse: [self error: self errorMessageDireccionNoEsUnPuntoCardinal].
	self initialize.
	^self new inicializarRoverEnPosicion: unaPosicion yDireccion: unPuntoCardinal .! !



!MarsRover class methodsFor: 'errores' stamp: 'AC 10/21/2025 13:08:17'!
errorMessageDireccionNoEsUnPuntoCardinal
	^'La direccion debe ser un Punto Cardinal'! !

!MarsRover class methodsFor: 'errores' stamp: 'AC 10/21/2025 13:05:44'!
errorMessagePosicionNoEsUnPoint
	^'La posicion debe ser un Point'! !


!classDefinition: #PuntoCardinal category: #'Mars-Rover'!
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


!PuntoCardinal methodsFor: 'mover' stamp: 'AC 10/21/2025 11:13:38'!
moverHaciaAdelante: unRover

	self subclassResponsibility! !

!PuntoCardinal methodsFor: 'mover' stamp: 'AC 10/21/2025 11:18:29'!
moverHaciaAtras: unRover

	self subclassResponsibility! !


!classDefinition: #Este category: #'Mars-Rover'!
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


!Este methodsFor: 'mover' stamp: 'AC 10/21/2025 11:14:05'!
moverHaciaAdelante: unRover

	unRover moverHaciaEste.! !

!Este methodsFor: 'mover' stamp: 'AC 10/21/2025 11:18:42'!
moverHaciaAtras: unRover

	unRover moverHaciaOeste .! !


!classDefinition: #Norte category: #'Mars-Rover'!
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


!Norte methodsFor: 'mover' stamp: 'AC 10/21/2025 11:14:24'!
moverHaciaAdelante: unRover

	unRover moverHaciaNorte.! !

!Norte methodsFor: 'mover' stamp: 'AC 10/21/2025 11:18:53'!
moverHaciaAtras: unRover

	unRover moverHaciaSur .! !


!classDefinition: #Oeste category: #'Mars-Rover'!
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


!Oeste methodsFor: 'mover' stamp: 'AC 10/21/2025 11:15:04'!
moverHaciaAdelante: unRover

	unRover moverHaciaOeste.! !

!Oeste methodsFor: 'mover' stamp: 'AC 10/21/2025 11:19:07'!
moverHaciaAtras: unRover

	unRover moverHaciaEste .! !


!classDefinition: #Sur category: #'Mars-Rover'!
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


!Sur methodsFor: 'mover' stamp: 'AC 10/21/2025 11:15:28'!
moverHaciaAdelante: unRover

	unRover moverHaciaSur.! !

!Sur methodsFor: 'mover' stamp: 'AC 10/21/2025 11:19:17'!
moverHaciaAtras: unRover

	unRover moverHaciaNorte .! !


!classDefinition: #MarsRoverTest category: #'Mars-Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:08:45'!
test01StringVacioNoCambiaPosicion
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 0@0.
	
	rover procesar: ''.
	
	self assert:  rover posicion equals: 0@0.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:08:50'!
test02StringUnafMueveHaciaAdelante
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 0@0.
	
	rover procesar: 'f'.
	
	self assert:  rover posicion equals: 0@1.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:08:55'!
test03StringUnabMueveHaciaAtras
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 0@0.
	
	rover procesar: 'b'.
	
	self assert:  rover posicion equals: 0@-1.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:09:00'!
test04StringFFMueveDosHaciaAdelante
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 0@0.
	
	rover procesar: 'ff'.
	
	self assert:  rover posicion equals: 0@2.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:09:05'!
test05StringBBMueveDosHaciaAtras
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 0@0.
	
	rover procesar: 'bb'.
	
	self assert:  rover posicion equals: 0@-2.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:09:10'!
test06StringTamaño2CombinadoVuelveALaMismaPosicion
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 0@0.
	
	rover procesar: 'bf'.
	
	self assert:  rover posicion equals: 0@0.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:09:15'!
test07StringTamañoMayorADosCombinadoLlegaALaPosicionCorrecta
	| rover |
	
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 0@0.
	
	rover procesar: 'bfffbbf'.
	
	self assert:  rover posicion equals: 0@1.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:12:42'!
test08StringVacioNoCambiaDireccion
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: ''.
	
	self assert:  (rover direccion isKindOf: Norte).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:12:47'!
test09StringUnaInstruccionDeMovimientoNoCambiaDireccion
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'f'.
	
	self assert:  (rover direccion isKindOf: Norte).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:12:52'!
test10StringUnaLGiraHaciaOeste
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'l'.
	
	self assert:  (rover direccion isKindOf: Oeste).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:12:56'!
test11StringUnaRGiraHaciaEste
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'r'.
	
	self assert:  (rover direccion isKindOf: Este).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:13:02'!
test12StringLLGiraApuntandoASur
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'll'.
	
	self assert:  (rover direccion isKindOf: Sur).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:13:07'!
test13StringRRGiraApuntandoASur
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'rr'.
	
	self assert:  (rover direccion isKindOf: Sur).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:13:11'!
test14StringCombinadoDeRotacionesLlegaAPuntoCardinalCorrecto
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'llrrlllrlrll'.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'lrrllrr'.
	
	self assert:  (rover direccion isKindOf: Este).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:13:16'!
test15GirarALaDerechaYAvanzarLlegaAPosicionCorrecta
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 0@0.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'rf'.
	
	self assert:  rover posicion equals: 1@0.
	
	self assert:  (rover direccion isKindOf: Este).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:13:22'!
test16GirarALaIzquieraYAvanzarLlegaAPosicionCorrecta
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 0@0.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'lf'.
	
	self assert:  rover posicion equals: -1@0.
	
	self assert:  (rover direccion isKindOf: Oeste).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:13:26'!
test17GirarALaDerechaEIrHaciaAtrasLlegaAPosicionCorrecta
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 0@0.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'rb'.
	
	self assert:  rover posicion equals: -1@0.
	
	self assert:  (rover direccion isKindOf: Este).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:09:20'!
test18GirarALaIzquierdaEIrHaciaAtrasLlegaAPosicionCorrecta
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 0@0.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'lb'.
	
	self assert:  rover posicion equals: 1@0.
	
	self assert:  (rover direccion isKindOf: Oeste).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:55:10'!
test19StringCombinadoDeMovimientosYRotacionesLlegaAPosicionYPuntoCardinalCorrecto
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 0@0.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'frrbbrfrllb'.
	
	self assert:  rover posicion equals: -1@4.
	
	self assert:  (rover direccion isKindOf: Sur).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:33:02'!
test20StringUnComandoErroneoNoModificaPosicionNiDireccion
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 0@0.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'm'.
	
	self assert:  rover posicion equals: 0@0.
	
	self assert:  (rover direccion isKindOf: Norte).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 14:46:39'!
test21StringCombinadoCamandosValidosEInvalidosDejaDeProcesarAlPrimerComandoInvalido
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 0@0 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 0@0.
	
	self assert:  (rover direccion isKindOf: Norte).
	
	rover procesar: 'ffrrrblfFllbcbr'.
	
	self assert:  rover posicion equals: 1@1.
	
	self assert:  (rover direccion isKindOf: Sur).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:30:35'!
test22RoverInicializaEnPosicionPasada
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: 16@33 yDireccion: Norte new.
	
	self assert:  rover posicion equals: 16@33.
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 12:30:42'!
test23RoverInicializaEnPosicionYDireccionPasada
	| rover |
	rover := MarsRover inicializarRoverEnPosicion: -55@16 yDireccion: Oeste new.
	
	self assert:  rover posicion equals: -55@16. 
	self assert: (rover direccion isKindOf: Oeste).
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 14:37:37'!
test24ErrorRoverNoInicializaEnUnPoint
	| rover |
	
	self 
		should: [ rover := MarsRover inicializarRoverEnPosicion: -55 yDireccion: Oeste new] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: MarsRover errorMessagePosicionNoEsUnPoint equals: error messageText.]
	
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/21/2025 14:42:11'!
test25ErrorRoverNoInicializaConUnPuntoCardinal
	| rover |
	
	self 
		should: [ rover := MarsRover inicializarRoverEnPosicion: 55@-33 yDireccion: #Norte] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: MarsRover errorMessageDireccionNoEsUnPuntoCardinal equals: error messageText.]
	
	
	
	! !
