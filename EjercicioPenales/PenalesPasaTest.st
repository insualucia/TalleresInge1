!classDefinition: #Jugador category: #Penales!
Object subclass: #Jugador
	instanceVariableNames: 'fuerza puntaje'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Jugador methodsFor: 'accessing' stamp: 'Lu 9/27/2025 16:16:27'!
obtenerFuerza
	^ fuerza.! !

!Jugador methodsFor: 'accessing' stamp: 'Lu 9/27/2025 13:33:56'!
obtenerPuntaje

	^puntaje.! !


!Jugador methodsFor: 'evaluating' stamp: 'Lu 9/27/2025 21:34:30'!
aumentarFuerza100

	fuerza := fuerza * 2.! !

!Jugador methodsFor: 'evaluating' stamp: 'Lu 9/27/2025 22:05:06'!
aumentarFuerza20

	fuerza := fuerza * 1.20.! !

!Jugador methodsFor: 'evaluating' stamp: 'Lu 9/27/2025 20:02:31'!
aumentarFuerza50

	fuerza := fuerza * 1.50.! !

!Jugador methodsFor: 'evaluating' stamp: 'Lu 9/27/2025 21:24:53'!
disminuirFuerza20

	fuerza := fuerza * 0.80.! !

!Jugador methodsFor: 'evaluating' stamp: 'Lu 9/27/2025 20:02:45'!
disminuirFuerza50

	fuerza := fuerza * 0.50.! !

!Jugador methodsFor: 'evaluating' stamp: 'Lu 9/27/2025 15:23:59'!
sumarPunto

	puntaje := puntaje + 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Jugador class' category: #Penales!
Jugador class
	instanceVariableNames: ''!

!Jugador class methodsFor: 'instance creation' stamp: 'Lu 9/27/2025 12:13:38'!
decideTirarAColocarSuFuerzaBaseEs: unaCantidadDeFuerza

	self subclassResponsibility! !

!Jugador class methodsFor: 'instance creation' stamp: 'Lu 9/27/2025 12:14:00'!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs: unaCantidadDeFuerza

	self subclassResponsibility! !


!classDefinition: #Arquero category: #Penales!
Jugador subclass: #Arquero
	instanceVariableNames: 'posicion lanzamiento resultado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Arquero methodsFor: 'initialization' stamp: 'AC 9/30/2025 15:01:17'!
inicializarConFuerza: unaCantidadDeFuerza yLanzamiento: unLanzamiento
	puntaje := 0.
	fuerza := unaCantidadDeFuerza.
	lanzamiento := unLanzamiento .
	resultado := #ADeterminar.
	lanzamiento asignarArquero: self.! !


!Arquero methodsFor: 'accessing' stamp: 'Lu 9/27/2025 19:57:57'!
obtenerLanzamiento

	^lanzamiento.! !

!Arquero methodsFor: 'accessing' stamp: 'Lu 9/27/2025 16:05:39'!
obtenerPosicion

	^ posicion.! !

!Arquero methodsFor: 'accessing' stamp: 'AC 9/30/2025 15:08:22'!
obtenerResultado

	^ resultado .! !


!Arquero methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 21:52:51'!
cambiarPosicionA: unaSubclaseDePosicionPenales.

	posicion := unaSubclaseDePosicionPenales crearPosicionPenales: posicion obtenerPoint.! !

!Arquero methodsFor: 'evaluating' stamp: 'AC 9/30/2025 15:04:18'!
ganarPartido
	self sumarPunto.
	resultado := #Gano.! !

!Arquero methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:14:59'!
lanzarseHacia: unaPosicionALanzarse paraAtajarTiro: unTiroAlArco con: unaPelota.
	
	posicion := unaPosicionALanzarse .
	
	unTiroAlArco conPelota: unaPelota paraArquero: self.
	! !

!Arquero methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:25:19'!
lanzarseHaciaPelotaJabulaniAColocar
	
	lanzamiento recibirPelotaJabulaniAColocar: self.! !

!Arquero methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:25:03'!
lanzarseHaciaPelotaJabulaniAMatar
	
	lanzamiento recibirPelotaJabulaniAMatar: self.! !

!Arquero methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:26:55'!
lanzarseHaciaPelotaPlayeraAColocar
	
	lanzamiento recibirPelotaPlayeraAColocar: self.! !

!Arquero methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:26:37'!
lanzarseHaciaPelotaPlayeraAMatar
	
	lanzamiento recibirPelotaPlayeraAMatar: self.! !

!Arquero methodsFor: 'evaluating' stamp: 'AC 9/30/2025 15:03:49'!
perderPartido

	resultado := #Perdio.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arquero class' category: #Penales!
Arquero class
	instanceVariableNames: ''!

!Arquero class methodsFor: 'instance creation' stamp: 'Lu 9/27/2025 19:28:05'!
eligeDireccionAntesDeTiroSuFuerzaBaseEs: unaCantidadDeFuerza 

	^self new inicializarConFuerza: unaCantidadDeFuerza yLanzamiento: ElegirAntes new.! !

!Arquero class methodsFor: 'instance creation' stamp: 'Lu 9/27/2025 19:27:44'!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs: unaCantidadDeFuerza

	^self new inicializarConFuerza: unaCantidadDeFuerza yLanzamiento: EsperarYAdelantarse new.! !


!classDefinition: #Delantero category: #Penales!
Jugador subclass: #Delantero
	instanceVariableNames: 'tiro posicion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Delantero methodsFor: 'initialization' stamp: 'Lu 9/27/2025 21:20:50'!
inicializarConFuerza: unaCantidadDeFuerza yTiro: unTipoTiro
	puntaje := 0.
	fuerza := unaCantidadDeFuerza.
	tiro := unTipoTiro .
	tiro asignarDelantero: self.! !


!Delantero methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 19:18:59'!
patearPelota: unaPelota hacia: unaPosicion
	
	^tiro tiroDeDelantero: self pateaPelota: unaPelota hacia: unaPosicion.! !


!Delantero methodsFor: 'accessing' stamp: 'Lu 9/29/2025 19:07:24'!
obtenerTiro

	^tiro.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Delantero class' category: #Penales!
Delantero class
	instanceVariableNames: ''!

!Delantero class methodsFor: 'instance creation' stamp: 'Lu 9/29/2025 20:42:26'!
decideTirarAColocarSuFuerzaBaseEs: unaCantidadDeFuerza

	^self new inicializarConFuerza: unaCantidadDeFuerza yTiro: TiroAColocar new.! !

!Delantero class methodsFor: 'instance creation' stamp: 'Lu 9/27/2025 19:24:49'!
decideTirarAMatarSuFuerzaBaseEs: unaCantidadDeFuerza

	^self new inicializarConFuerza: unaCantidadDeFuerza yTiro: TiroAMatar new.! !


!classDefinition: #LanzamientoArquero category: #Penales!
Object subclass: #LanzamientoArquero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!LanzamientoArquero methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:31:57'!
asignarArquero: unArquero

	"arquero := unArquero."! !

!LanzamientoArquero methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:31:33'!
recibirPelotaJabulaniAColocar: unArquero

	! !

!LanzamientoArquero methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:30:29'!
recibirPelotaJabulaniAMatar: unArquero! !

!LanzamientoArquero methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:31:38'!
recibirPelotaPlayeraAColocar: unArquero

	! !

!LanzamientoArquero methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:31:02'!
recibirPelotaPlayeraAMatar: unArquero! !


!classDefinition: #ElegirAntes category: #Penales!
LanzamientoArquero subclass: #ElegirAntes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!ElegirAntes methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:28:48'!
recibirPelotaJabulaniAColocar: unArquero

	unArquero aumentarFuerza50.! !

!ElegirAntes methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 21:25:26'!
recibirPelotaJabulaniAMatar: unArquero

	unArquero cambiarPosicionA: SoloAncho.! !

!ElegirAntes methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:29:31'!
recibirPelotaPlayeraAColocar: unArquero

	unArquero aumentarFuerza100.! !

!ElegirAntes methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 21:27:30'!
recibirPelotaPlayeraAMatar: unArquero

	unArquero cambiarPosicionA: SoloAlto.! !


!classDefinition: #EsperarYAdelantarse category: #Penales!
LanzamientoArquero subclass: #EsperarYAdelantarse
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!EsperarYAdelantarse methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 21:29:15'!
recibirPelotaJabulaniAColocar: unArquero

	unArquero cambiarPosicionA: SoloAncho.! !

!EsperarYAdelantarse methodsFor: 'evaluating' stamp: 'AC 9/30/2025 15:02:21'!
recibirPelotaJabulaniAMatar: unArquero

	unArquero perderPartido.! !

!EsperarYAdelantarse methodsFor: 'evaluating' stamp: 'AC 9/30/2025 15:02:52'!
recibirPelotaPlayeraAColocar: unArquero

	unArquero perderPartido.! !

!EsperarYAdelantarse methodsFor: 'evaluating' stamp: 'AC 9/30/2025 15:02:42'!
recibirPelotaPlayeraAMatar: unArquero

	unArquero ganarPartido.! !


!classDefinition: #Pelota category: #Penales!
Object subclass: #Pelota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Pelota methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 19:20:06'!
recibirPatadaAColocarDe: unDelantero hacia: unaPelota

	self subclassResponsibility! !

!Pelota methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:22:02'!
recibirPatadaAColocarPara: unArquero

	self subclassResponsibility! !

!Pelota methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:22:22'!
recibirPatadaAMatarDe: unDelantero hacia: unaPosicion

	self subclassResponsibility! !

!Pelota methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:22:09'!
recibirPatadaAMatarPara: unArquero

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pelota class' category: #Penales!
Pelota class
	instanceVariableNames: ''!

!Pelota class methodsFor: 'instance creation' stamp: 'Lu 9/27/2025 12:02:09'!
jabulaniSudafricanaRapida

	^ Jabulani new.! !

!Pelota class methodsFor: 'instance creation' stamp: 'Lu 9/27/2025 15:34:16'!
playeraLentaCostaAzul

	^ Playera new.! !


!classDefinition: #Jabulani category: #Penales!
Pelota subclass: #Jabulani
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Jabulani methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 19:20:28'!
recibirPatadaAColocarDe: unDelantero hacia: unaPosicion

	^ unaPosicion.! !

!Jabulani methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:20:40'!
recibirPatadaAColocarPara: unArquero

	unArquero lanzarseHaciaPelotaJabulaniAColocar. ! !

!Jabulani methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 19:29:43'!
recibirPatadaAMatarDe: unDelantero hacia: unaPosicion

	unDelantero aumentarFuerza20.
	
	^unaPosicion.! !

!Jabulani methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:20:59'!
recibirPatadaAMatarPara: unArquero

	unArquero lanzarseHaciaPelotaJabulaniAMatar. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Jabulani class' category: #Penales!
Jabulani class
	instanceVariableNames: ''!

!Jabulani class methodsFor: 'instance creation' stamp: 'Lu 9/27/2025 12:03:04'!
jabulaniSudafricanaRapida

	^ self new.! !


!classDefinition: #Playera category: #Penales!
Pelota subclass: #Playera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Playera methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 19:21:03'!
recibirPatadaAColocarDe: unDelantero hacia: unaPosicion

	unDelantero disminuirFuerza20.
	
	^unaPosicion.! !

!Playera methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:21:49'!
recibirPatadaAColocarPara: unArquero

	unArquero lanzarseHaciaPelotaPlayeraAColocar. ! !

!Playera methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 21:18:32'!
recibirPatadaAMatarDe: unDelantero hacia: unaPosicion
	
	^ PosicionPenales crearPosicionPenales: (unaPosicion x @ (unaPosicion y + 2)).
	! !

!Playera methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:21:38'!
recibirPatadaAMatarPara: unArquero

	unArquero lanzarseHaciaPelotaPlayeraAMatar. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Playera class' category: #Penales!
Playera class
	instanceVariableNames: ''!

!Playera class methodsFor: 'instance creation' stamp: 'Lu 9/27/2025 15:30:21'!
playeraLentaCostaAzul

	^ self new.! !


!classDefinition: #Penales category: #Penales!
Object subclass: #Penales
	instanceVariableNames: 'delantero arquero pelota posicionRemate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Penales methodsFor: 'initialization' stamp: 'Lu 9/29/2025 17:55:20'!
inicializarConDelantero: unDelantero yArquero: unArquero

	delantero := unDelantero.
	arquero := unArquero.! !


!Penales methodsFor: 'evaluating' stamp: 'AC 9/30/2025 14:52:07'!
arbitroPitaConPelota: unaPelota delanteroRemataAlArcoConDireccion: unaPosicionARematar arqueroSeLanzaEnDirección: unaPosicionALanzarse

|posicionRematar posicionLanzarse|
		
	posicionRematar  := PosicionPenales crearPosicionPenales: unaPosicionARematar.
	posicionLanzarse := PosicionPenales crearPosicionPenales: unaPosicionALanzarse.
	
	self posicionALanzarseValida: posicionLanzarse yPosicionARematarValida: posicionRematar .
	
	pelota := unaPelota.
	
	posicionRemate := delantero patearPelota: unaPelota hacia: posicionRematar .
	
	arquero lanzarseHacia: posicionLanzarse paraAtajarTiro: (delantero obtenerTiro) con: unaPelota.
	
	self calcularGanador.
	! !

!Penales methodsFor: 'evaluating' stamp: 'AC 9/30/2025 15:07:49'!
calcularGanador

	(posicionRemate isMemberOf: FueraArco)ifTrue: [^ arquero ganarPartido].
	
	(arquero obtenerResultado = #Perdio) ifTrue: [^delantero sumarPunto ].
	
	(arquero obtenerResultado = #ADeterminar) ifTrue: [
	(arquero obtenerPosicion = posicionRemate and: [arquero obtenerFuerza  >= delantero obtenerFuerza]) ifTrue: [^arquero sumarPunto].
	
	^ delantero sumarPunto ].
	! !


!Penales methodsFor: 'accessing' stamp: 'Lu 9/27/2025 13:34:57'!
puntajeDeArquero

	^arquero obtenerPuntaje .! !

!Penales methodsFor: 'accessing' stamp: 'Lu 9/27/2025 13:34:44'!
puntajeDeDelantero

	^delantero obtenerPuntaje .! !

!Penales methodsFor: 'accessing' stamp: 'Lu 9/29/2025 21:47:42'!
varDireccionRemateResultante

	^posicionRemate obtenerPoint.! !

!Penales methodsFor: 'accessing' stamp: 'Lu 9/27/2025 19:30:33'!
varFuerzaResultanteDeAtajada

	^ arquero obtenerFuerza .! !

!Penales methodsFor: 'accessing' stamp: 'Lu 9/27/2025 19:16:42'!
varFuerzaResultanteDeTiro

	^delantero obtenerFuerza ! !


!Penales methodsFor: 'validation' stamp: 'AC 9/30/2025 14:52:43'!
posicionALanzarseValida: unaPosicionLanzarse yPosicionARematarValida: unaPosicionRematar .
	
(unaPosicionRematar isMemberOf: FueraArco ) ifTrue:[self error: self class direccionTiroFueraDeRango].
	
	(unaPosicionLanzarse isMemberOf: FueraArco ) ifTrue:[self error: self class direccionArqueroFueraDeRango].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Penales class' category: #Penales!
Penales class
	instanceVariableNames: ''!

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:49'!
direccionArqueroFueraDeRango
	
	^'El arquero debe lanzarse a coordenadas válidas'! !

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:32'!
direccionTiroFueraDeRango
	
	^'La pelota debe dirigirse a coordenadas válidas'! !


!Penales class methodsFor: 'instance creation' stamp: 'Lu 9/27/2025 12:08:59'!
conDelantero: unDelantero yArquero: unArquero
	
	^ self new inicializarConDelantero: unDelantero yArquero: unArquero.! !


!classDefinition: #PosicionPenales category: #Penales!
Object subclass: #PosicionPenales
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!PosicionPenales methodsFor: 'initialization' stamp: 'Lu 9/29/2025 21:04:55'!
inicializarPosicion: unPoint

	value := unPoint.! !


!PosicionPenales methodsFor: 'accessing' stamp: 'Lu 9/29/2025 21:09:35'!
obtenerPoint 

	^value.! !

!PosicionPenales methodsFor: 'accessing' stamp: 'Lu 9/29/2025 21:16:05'!
x
	^value x.! !

!PosicionPenales methodsFor: 'accessing' stamp: 'Lu 9/29/2025 21:16:10'!
y
	^value y.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PosicionPenales class' category: #Penales!
PosicionPenales class
	instanceVariableNames: ''!

!PosicionPenales class methodsFor: 'instance creation' stamp: 'Lu 9/29/2025 21:03:07'!
crearPosicionPenales: unPoint

(unPoint between: 0@0 and: 2@2)ifTrue: [^DentroArco new inicializarPosicion: unPoint].

	^FueraArco new inicializarPosicion: unPoint.! !


!classDefinition: #DentroArco category: #Penales!
PosicionPenales subclass: #DentroArco
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!DentroArco methodsFor: 'comparing' stamp: 'Lu 9/29/2025 21:11:49'!
= unaPosicion

	^ value = unaPosicion obtenerPoint.! !


!classDefinition: #FueraArco category: #Penales!
PosicionPenales subclass: #FueraArco
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!


!classDefinition: #SoloAlto category: #Penales!
PosicionPenales subclass: #SoloAlto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!SoloAlto methodsFor: 'comparing' stamp: 'Lu 9/29/2025 21:16:48'!
= unaPosicion

	^ value y = unaPosicion y.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SoloAlto class' category: #Penales!
SoloAlto class
	instanceVariableNames: ''!

!SoloAlto class methodsFor: 'instance creation' stamp: 'Lu 9/29/2025 21:24:06'!
crearPosicionPenales: unPoint

	^self new inicializarPosicion: unPoint.! !


!classDefinition: #SoloAncho category: #Penales!
PosicionPenales subclass: #SoloAncho
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!SoloAncho methodsFor: 'comparing' stamp: 'Lu 9/29/2025 21:16:54'!
= unaPosicion

	^ value x  = unaPosicion x.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SoloAncho class' category: #Penales!
SoloAncho class
	instanceVariableNames: ''!

!SoloAncho class methodsFor: 'instance creation' stamp: 'Lu 9/29/2025 21:24:19'!
crearPosicionPenales: unPoint

	^self new inicializarPosicion: unPoint.! !


!classDefinition: #TiroAlArco category: #Penales!
Object subclass: #TiroAlArco
	instanceVariableNames: 'posicion delantero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!TiroAlArco methodsFor: 'evaluating' stamp: 'Lu 9/27/2025 21:20:19'!
asignarDelantero: unDelantero

	delantero := unDelantero .! !

!TiroAlArco methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:18:49'!
conPelota: unaPelota paraArquero: unArquero

	self subclassResponsibility! !

!TiroAlArco methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:23:33'!
tiroDeDelantero: unDelantero pateaPelota: unaPelota hacia: unaPosicion

	self subclassResponsibility! !


!classDefinition: #TiroAColocar category: #Penales!
TiroAlArco subclass: #TiroAColocar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!TiroAColocar methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:18:04'!
conPelota: unaPelota paraArquero: unArquero

	unaPelota recibirPatadaAColocarPara: unArquero. ! !

!TiroAColocar methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 19:19:38'!
tiroDeDelantero: unDelantero pateaPelota: unaPelota hacia: unaPosicion

	unDelantero disminuirFuerza50.
	
	^ unaPelota recibirPatadaAColocarDe: unDelantero hacia: unaPosicion.! !


!classDefinition: #TiroAMatar category: #Penales!
TiroAlArco subclass: #TiroAMatar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!TiroAMatar methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 20:18:41'!
conPelota: unaPelota paraArquero: unArquero

	unaPelota recibirPatadaAMatarPara: unArquero.! !

!TiroAMatar methodsFor: 'evaluating' stamp: 'Lu 9/29/2025 21:19:47'!
tiroDeDelantero: unDelantero pateaPelota: unaPelota hacia: unaPosicion
	
	 | posicionRemate |
	
	posicionRemate := unaPelota recibirPatadaAMatarDe: unDelantero hacia: unaPosicion.
	
	((unaPosicion x !!= 1) and: (unaPosicion y !!= 1))ifTrue: [^PosicionPenales crearPosicionPenales:  (unaPosicion x @ 1)].
	
	^ posicionRemate.! !


!classDefinition: #PenalesTest category: #Penales!
TestCase subclass: #PenalesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test01DelanteroNoPuedeApuntarHaciaAfueraDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: -1@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test02DelanteroNoPuedeApuntarHaciaAfueraDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 3@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test03DelanteroNoPuedeApuntarHaciaAbajoDelArco
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@-1 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test04DelanteroNoPuedeApuntarHaciaArribaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@3 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test05ArqueroNoPuedePasarseDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: -1@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test06ArqueroNoPuedePasarseDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 3@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test07ArqueroNoPuedeMeterseAbajoDeLaTierra
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@-1.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test08ArqueroNoPuedeSaltarPorEncimaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@3.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test09DireccionesDiferentesGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante
	"varXXXX es por VAR, de 'Video Assistant Referee'"! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test10MismasDireccionesInsuficienteFuerzaGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 10.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test11MismasDireccionesSuficienteFuerzaAtajaArquero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test12DelanteroQueTiraAColocarPierde50PorcFuerza
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"(delantero sacrificia potencia para ganar mayor precisión)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test13ArqueroQueEligeAntesDeTiroVsJabulaniAColocarSuma50PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige donde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	"(el arquero llega más cómodo y aprovecha mejor su fuerza)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 34.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 51 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test14FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige adonde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 32.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 48 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test15ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAColocarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que espera y se adelanta ante un tiro de jabulani a colocar ignora la 2da coordenada (altura) al atajar..."	
	"(al adelanterse encara la pelota antes de que su elevación se transforme en un problema)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test16PelotaPlayeraUsadaAColocarLeHacePerder20PorcFuerzaExtraAlDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% de fuerza adicional al delantero que la use para colocar... (no importa el arquero)"
	"(no debería ser reglamentaria... al menos no es de trapo, nos responden)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test17ArqueroQueEligeAntesDeTiroVsPlayeraAColocarSuma100PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	"(a quien madruga...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 20.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test18FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsPlayeraAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 19.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 38 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test19ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAColocarEsDescubiertoYPuntoParaDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Arquero que espera y se adelanta ante tiro con la lenta pelota playera, siempre es descubierto por el Árbitro, y el punto se le otorga al Delantero..."
	"(lo que servía de ventaja ante la Jabulani rápida, acá es tan obvio por lo que tarda en llegar la pelota al arco, que marchás preso...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:52'!
test20DelanteroTiraAMatarAlAnguloInferiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:47'!
test21DelanteroTiraAMatarAlAnguloSuperiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:41'!
test22DelanteroTiraAMatarAlAnguloInferiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:36'!
test23DelanteroTiraAMatarAlAnguloSuperiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:29'!
test24DelanteroTiraAMatarNoAlAnguloMantieneDireccionTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@1.

	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test25DelanteroTiraAMatarUsa100PorcFuerzaBase
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:150.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 150 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test26DelanteroTiraAMatarConJabulaniGana20PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	"(Jabulani a matar es la elección de los guerreros Z)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 120.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test27FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAMatar
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 119.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test28ArqueroQueEligeAntesDeTiroVsJabulaniAMatarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que elige donde tirarse antes de un tiro de jabulani a matar, ignora la 2da coordenada (altura) al atajar..."		
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test29ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAMatarNuncaAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera a ver la dirección del remate de una pelota jabulani rápida a matar antes de lanzarse, nunca la ataja sin importar nada, siquiera que se adelantó..."	
	"(su poder era de más de 9000!! era impresionante, no podía moverme, sólo la ví pasar... f )"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@1 arqueroSeLanzaEnDirección: 1@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test30DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAdentro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(y voló.. y me hizo volar... y yo volé de él...  pero acá por la arbolada... y el voló.. y se estrelló por acá por la pared...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 1@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test31DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAfuera
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(El caso auspiciado por el Pipita...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@1 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@3 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test32ArqueroQueEligeAntesDeTiroVsPlayeraAMatarAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 18:39:22'!
test33ArqueroQueEligeAntesDeTiroVsPlayeraAMatarNoAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test34ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAMatarSiempreAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera y se adelanta ante una pelota playera lenta a matar, siempre la ataja sin importar nada..."	
	"(como la pelota es taaaan lentaaa, el arquero se puede ir a tomar un cafe, verse una serie, volver y aún atajar la pelota habiendose tirado a cualquier lado. Pero igual es más rapida que cuando se la tira a colocar, donde indefectiblemente el arbitro lo detecta...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !
