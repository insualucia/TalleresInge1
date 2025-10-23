!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion direccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'checking' stamp: 'AC 10/21/2025 14:53:37'!
esInstruccionValida: unaPotencialInstruccion
	^unaPotencialInstruccion  = $f or:[unaPotencialInstruccion = $b or:[unaPotencialInstruccion = $r or:[unaPotencialInstruccion = $l]]]! !

!MarsRover methodsFor: 'checking' stamp: 'AC 10/23/2025 10:16:30'!
heading: unPuntoCardinal
	^ self direccion = unPuntoCardinal! !

!MarsRover methodsFor: 'checking' stamp: 'AC 10/23/2025 10:09:51'!
isAt: unaPosicion
	^ self posicion = unaPosicion! !

!MarsRover methodsFor: 'checking' stamp: 'AC 10/23/2025 10:08:28'!
isAt: unaPosicion heading: unPuntoCardinal
	^ (self isAt: unaPosicion) and:[self heading: unPuntoCardinal].! !


!MarsRover methodsFor: 'acceder' stamp: 'AC 10/23/2025 10:16:45'!
direccion
	^direccion class! !

!MarsRover methodsFor: 'acceder' stamp: 'lu 10/17/2025 18:26:31'!
posicion
	^posicion .! !


!MarsRover methodsFor: 'inicializacion' stamp: 'AC 10/23/2025 10:00:24'!
initializeAt: unaPosicion heading: unPuntoCardinal
	posicion := unaPosicion.
	direccion := unPuntoCardinal.! !


!MarsRover methodsFor: 'movimiento' stamp: 'AC 10/21/2025 11:11:20'!
avanzarHaciaAdelante
	direccion moverHaciaAdelante: self.! !

!MarsRover methodsFor: 'movimiento' stamp: 'AC 10/21/2025 11:18:11'!
avanzarHaciaAtras
	direccion moverHaciaAtras: self.! !

!MarsRover methodsFor: 'movimiento' stamp: 'AC 10/21/2025 11:16:26'!
moverHaciaEste
	posicion :=(posicion x + 1) @ (posicion y).! !

!MarsRover methodsFor: 'movimiento' stamp: 'AC 10/21/2025 11:16:50'!
moverHaciaNorte
	posicion :=(posicion x) @ (posicion y + 1)! !

!MarsRover methodsFor: 'movimiento' stamp: 'AC 10/21/2025 11:17:16'!
moverHaciaOeste
	posicion :=(posicion x - 1) @ (posicion y)! !

!MarsRover methodsFor: 'movimiento' stamp: 'AC 10/21/2025 11:17:34'!
moverHaciaSur
	posicion :=(posicion x) @ (posicion y - 1)! !


!MarsRover methodsFor: 'procesamiento' stamp: 'lu 10/20/2025 20:53:43'!
procesarInstruccion: unaInstruccion

	unaInstruccion = $f  ifTrue: [^self avanzarHaciaAdelante].
	unaInstruccion = $b ifTrue: [^self avanzarHaciaAtras].
	unaInstruccion = $l ifTrue:[^direccion := direccion rotarAIzquierda].
	direccion := direccion rotarADerecha .! !

!MarsRover methodsFor: 'procesamiento' stamp: 'AC 10/23/2025 09:50:41'!
process: stringDeInstrucciones 
	stringDeInstrucciones do:
		[:unaInstruccion | 
			(self esInstruccionValida: unaInstruccion) ifFalse: [^self].
			self procesarInstruccion: unaInstruccion.
		].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'AC 10/23/2025 10:00:01'!
at: unaPosicion heading: unPuntoCardinal
	(unaPosicion isKindOf: Point) ifFalse: [self error: self errorMessagePosicionNoEsUnPoint].
	(unPuntoCardinal isKindOf: PuntoCardinal) ifFalse: [self error: self errorMessageDireccionNoEsUnPuntoCardinal].
	self initialize.
	^self new initializeAt: unaPosicion heading: unPuntoCardinal .! !


!MarsRover class methodsFor: 'errores' stamp: 'AC 10/21/2025 13:08:17'!
errorMessageDireccionNoEsUnPuntoCardinal
	^'La direccion debe ser un Punto Cardinal'! !

!MarsRover class methodsFor: 'errores' stamp: 'AC 10/21/2025 13:05:44'!
errorMessagePosicionNoEsUnPoint
	^'La posicion debe ser un Point'! !


!classDefinition: #PuntoCardinal category: 'MarsRover'!
Object subclass: #PuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!PuntoCardinal methodsFor: 'rotar' stamp: 'lu 10/17/2025 18:55:49'!
rotarADerecha

	self subclassResponsibility! !

!PuntoCardinal methodsFor: 'rotar' stamp: 'lu 10/17/2025 18:55:55'!
rotarAIzquierda

	self subclassResponsibility! !


!PuntoCardinal methodsFor: 'mover' stamp: 'AC 10/21/2025 11:13:38'!
moverHaciaAdelante: unRover

	self subclassResponsibility! !

!PuntoCardinal methodsFor: 'mover' stamp: 'AC 10/21/2025 11:18:29'!
moverHaciaAtras: unRover

	self subclassResponsibility! !


!classDefinition: #Este category: 'MarsRover'!
PuntoCardinal subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'rotar' stamp: 'lu 10/17/2025 19:01:13'!
rotarADerecha

	^Sur new.! !

!Este methodsFor: 'rotar' stamp: 'lu 10/20/2025 20:37:14'!
rotarAIzquierda

	^Norte new.! !


!Este methodsFor: 'mover' stamp: 'AC 10/21/2025 11:14:05'!
moverHaciaAdelante: unRover

	unRover moverHaciaEste.! !

!Este methodsFor: 'mover' stamp: 'AC 10/21/2025 11:18:42'!
moverHaciaAtras: unRover

	unRover moverHaciaOeste .! !


!classDefinition: #Norte category: 'MarsRover'!
PuntoCardinal subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Norte methodsFor: 'rotar' stamp: 'lu 10/17/2025 19:00:43'!
rotarADerecha

	^Este new.! !

!Norte methodsFor: 'rotar' stamp: 'lu 10/17/2025 18:58:37'!
rotarAIzquierda

	^ Oeste new.! !


!Norte methodsFor: 'mover' stamp: 'AC 10/21/2025 11:14:24'!
moverHaciaAdelante: unRover

	unRover moverHaciaNorte.! !

!Norte methodsFor: 'mover' stamp: 'AC 10/21/2025 11:18:53'!
moverHaciaAtras: unRover

	unRover moverHaciaSur .! !


!classDefinition: #Oeste category: 'MarsRover'!
PuntoCardinal subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Oeste methodsFor: 'rotar' stamp: 'lu 10/20/2025 20:37:36'!
rotarADerecha

	^Norte new.! !

!Oeste methodsFor: 'rotar' stamp: 'lu 10/20/2025 20:37:47'!
rotarAIzquierda

	^Sur new.! !


!Oeste methodsFor: 'mover' stamp: 'AC 10/21/2025 11:15:04'!
moverHaciaAdelante: unRover

	unRover moverHaciaOeste.! !

!Oeste methodsFor: 'mover' stamp: 'AC 10/21/2025 11:19:07'!
moverHaciaAtras: unRover

	unRover moverHaciaEste .! !


!classDefinition: #Sur category: 'MarsRover'!
PuntoCardinal subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Sur methodsFor: 'rotar' stamp: 'lu 10/20/2025 20:38:05'!
rotarADerecha

	^Oeste new.! !

!Sur methodsFor: 'rotar' stamp: 'lu 10/20/2025 20:38:14'!
rotarAIzquierda

	^Este new.! !


!Sur methodsFor: 'mover' stamp: 'AC 10/21/2025 11:15:28'!
moverHaciaAdelante: unRover

	unRover moverHaciaSur.! !

!Sur methodsFor: 'mover' stamp: 'AC 10/21/2025 11:19:17'!
moverHaciaAtras: unRover

	unRover moverHaciaNorte .! !


!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:11:28'!
test01StringVacioNoCambiaPosicion
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover isAt: 0@0).
	
	rover process: ''.
	
	self assert:  (rover isAt: 0@0).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:12:08'!
test02StringUnafMueveHaciaAdelante
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover isAt: 0@0).
	
	rover process: 'f'.
	
	self assert:  (rover isAt: 0@1).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:12:27'!
test03StringUnabMueveHaciaAtras
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover isAt: 0@0).
	
	rover process: 'b'.
	
	self assert:  (rover isAt: 0@-1).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:12:48'!
test04StringFFMueveDosHaciaAdelante
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover isAt: 0@0).
	
	rover process: 'ff'.
	
	self assert:  (rover isAt: 0@2).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:13:09'!
test05StringBBMueveDosHaciaAtras
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover isAt: 0@0).
	
	rover process: 'bb'.
	
	self assert:  (rover isAt: 0@-2).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:13:28'!
test06StringTamaño2CombinadoVuelveALaMismaPosicion
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover isAt: 0@0).
	
	rover process: 'bf'.
	
	self assert:  (rover isAt: 0@0).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:13:59'!
test07StringTamañoMayorADosCombinadoLlegaALaPosicionCorrecta
	| rover |
	
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover isAt: 0@0).
	
	rover process: 'bfffbbf'.
	
	self assert:  (rover isAt: 0@1).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:14:47'!
test08StringVacioNoCambiaDireccion
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover heading: Norte).
	
	rover process: ''.
	
	self assert:  (rover heading: Norte).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:18:24'!
test09StringUnaInstruccionDeMovimientoNoCambiaDireccion
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover heading: Norte).
	
	rover process: 'f'.
	
	self assert:  (rover heading: Norte).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:18:45'!
test10StringUnaLGiraHaciaOeste
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover heading: Norte).
	
	rover process: 'l'.
	
	self assert:  (rover heading: Oeste).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:19:06'!
test11StringUnaRGiraHaciaEste
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover heading: Norte).
	
	rover process: 'r'.
	
	self assert:  (rover heading: Este).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:19:49'!
test12StringLLGiraApuntandoASur
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover heading: Norte).
	
	rover process: 'll'.
	
	self assert:  (rover heading: Sur).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:21:04'!
test13StringRRGiraApuntandoASur
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover heading: Norte).
	
	rover process: 'rr'.
	
	self assert:  (rover heading: Sur).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:21:46'!
test14StringCombinadoDeRotacionesLlegaAPuntoCardinalCorrecto
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover heading: Norte).
	
	rover process: 'llrrlllrlrll'.
	
	self assert:  (rover heading: Norte).
	
	rover process: 'lrrllrr'.
	
	self assert:  (rover heading: Este).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:23:11'!
test15GirarALaDerechaYAvanzarLlegaAPosicionCorrecta
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover isAt: 0@0 heading: Norte).
	
	rover process: 'rf'.
	
	self assert:  (rover isAt: 1@0 heading: Este).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:24:17'!
test16GirarALaIzquieraYAvanzarLlegaAPosicionCorrecta
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover isAt: 0@0 heading: Norte).
	
	rover process: 'lf'.
	
	self assert:  (rover isAt: -1@0 heading: Oeste).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:25:07'!
test17GirarALaDerechaEIrHaciaAtrasLlegaAPosicionCorrecta
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover isAt: 0@0 heading: Norte).
	
	rover process: 'rb'.
	
	self assert:  (rover isAt: -1@0 heading: Este).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:26:00'!
test18GirarALaIzquierdaEIrHaciaAtrasLlegaAPosicionCorrecta
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover isAt: 0@0 heading: Norte).
	
	rover process: 'lb'.
	
	self assert:  (rover isAt: 1@0 heading: Oeste).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:26:57'!
test19StringCombinadoDeMovimientosYRotacionesLlegaAPosicionYPuntoCardinalCorrecto
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover isAt: 0@0 heading: Norte).
	
	rover process: 'frrbbrfrllb'.
	
	self assert:  (rover isAt: -1@4 heading: Sur).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:27:53'!
test20StringUnComandoErroneoNoModificaPosicionNiDireccion
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover isAt: 0@0 heading: Norte).
	
	rover process: 'm'.
	
	self assert:  (rover isAt: 0@0 heading: Norte).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:28:33'!
test21StringCombinadoCamandosValidosEInvalidosDejaDeProcesarAlPrimerComandoInvalido
	| rover |
	rover := MarsRover at: 0@0 heading: Norte new.
	
	self assert:  (rover isAt: 0@0 heading: Norte).
	
	rover process: 'ffrrrblfFllbcbr'.
	
	self assert:  (rover isAt: 1@1 heading: Sur).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:29:00'!
test22RoverInicializaEnPosicionPasada
	| rover |
	rover := MarsRover at: 16@33 heading: Norte new.
	
	self assert:  (rover isAt: 16@33).
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:29:25'!
test23RoverInicializaEnPosicionYDireccionPasada
	| rover |
	rover := MarsRover at: -55@16 heading: Oeste new.
	
	self assert:  (rover isAt: -55@16 heading: Oeste).
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 09:59:11'!
test24ErrorRoverNoInicializaEnUnPoint
	| rover |
	
	self 
		should: [ rover := MarsRover at: -55 heading: Oeste new] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: MarsRover errorMessagePosicionNoEsUnPoint equals: error messageText.]
	
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AC 10/23/2025 10:30:15'!
test25ErrorRoverNoInicializaConUnPuntoCardinal
	| rover |
	
	self 
		should: [ rover := MarsRover at: 55@-33 heading: Norte] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: MarsRover errorMessageDireccionNoEsUnPuntoCardinal equals: error messageText.]
	
	
	
	! !
