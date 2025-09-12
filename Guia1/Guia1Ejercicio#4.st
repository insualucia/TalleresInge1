!classDefinition: #I category: #'Ejercicio 4'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Ejercicio 4'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'next' stamp: 'lu 9/5/2025 21:23:24'!
next
	II previous: self.
	^II.! !


!I class methodsFor: 'artimeticos' stamp: 'lu 9/5/2025 21:20:25'!
* multiplicando

 ^multiplicando.! !

!I class methodsFor: 'artimeticos' stamp: 'lu 9/5/2025 21:12:11'!
+ sumando
	
	^sumando next.! !

!I class methodsFor: 'artimeticos' stamp: 'Lu 9/6/2025 19:25:51'!
- restando
	
	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'artimeticos' stamp: 'Lu 9/6/2025 19:27:08'!
/ divisor
	I = divisor ifTrue: [^self].

	self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor! !

!I class methodsFor: 'artimeticos' stamp: 'Lu 9/6/2025 19:39:55'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
^'no se puede dividir por un número mayor'.! !

!I class methodsFor: 'artimeticos' stamp: 'Lu 9/6/2025 19:25:34'!
descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'artimeticos' stamp: 'Lu 9/6/2025 19:11:21'!
sustraerDe: minuendo

^minuendo previous.! !


!classDefinition: #II category: #'Ejercicio 4'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Ejercicio 4'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:57:55'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!II class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:58:15'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!II class methodsFor: 'next & previous' stamp: 'lu 9/5/2025 21:06:42'!
previous
	^previous.! !

!II class methodsFor: 'next & previous' stamp: 'lu 9/5/2025 21:08:22'!
previous: numAnterior
	previous := numAnterior.
	! !


!II class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:22:58'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!II class methodsFor: 'aritmeticas' stamp: 'lu 9/5/2025 21:22:39'!
+ sumando

^ self previous + sumando next.! !

!II class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:12:54'!
- restando
	
^ restando sustraerDe: self.! !

!II class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:35:27'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!II class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:39:39'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!II class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:09:26'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !


!classDefinition: #III category: #'Ejercicio 4'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Ejercicio 4'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:58:36'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!III class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:58:36'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!III class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:58:36'!
previous
	^previous.! !

!III class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:58:36'!
previous: numAnterior
	previous := numAnterior.
	! !


!III class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:58:36'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!III class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:58:36'!
+ sumando

^ self previous + sumando next.! !

!III class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:58:36'!
- restando
	
^ restando sustraerDe: self.! !

!III class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:58:36'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!III class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:58:36'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!III class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:58:36'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !


!classDefinition: #IV category: #'Ejercicio 4'!
DenotativeObject subclass: #IV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IV class' category: #'Ejercicio 4'!
IV class
	instanceVariableNames: 'next previous'!

!IV class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:58:46'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!IV class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:58:46'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!IV class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:58:46'!
previous
	^previous.! !

!IV class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:58:46'!
previous: numAnterior
	previous := numAnterior.
	! !


!IV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:58:46'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!IV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:58:46'!
+ sumando

^ self previous + sumando next.! !

!IV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:58:46'!
- restando
	
^ restando sustraerDe: self.! !

!IV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:58:46'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!IV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:58:46'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!IV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:58:46'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !


!classDefinition: #IX category: #'Ejercicio 4'!
DenotativeObject subclass: #IX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IX class' category: #'Ejercicio 4'!
IX class
	instanceVariableNames: 'next previous'!

!IX class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!IX class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!IX class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous
	^previous.! !

!IX class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous: numAnterior
	previous := numAnterior.
	! !


!IX class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!IX class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
+ sumando

^ self previous + sumando next.! !

!IX class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
- restando
	
^ restando sustraerDe: self.! !

!IX class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!IX class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!IX class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !


!classDefinition: #V category: #'Ejercicio 4'!
DenotativeObject subclass: #V
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'V class' category: #'Ejercicio 4'!
V class
	instanceVariableNames: 'next previous'!

!V class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!V class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!V class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous
	^previous.! !

!V class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous: numAnterior
	previous := numAnterior.
	! !


!V class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!V class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
+ sumando

^ self previous + sumando next.! !

!V class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
- restando
	
^ restando sustraerDe: self.! !

!V class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!V class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!V class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !


!classDefinition: #VI category: #'Ejercicio 4'!
DenotativeObject subclass: #VI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VI class' category: #'Ejercicio 4'!
VI class
	instanceVariableNames: 'next previous'!

!VI class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!VI class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!VI class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous
	^previous.! !

!VI class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous: numAnterior
	previous := numAnterior.
	! !


!VI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!VI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
+ sumando

^ self previous + sumando next.! !

!VI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
- restando
	
^ restando sustraerDe: self.! !

!VI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!VI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!VI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !


!classDefinition: #VII category: #'Ejercicio 4'!
DenotativeObject subclass: #VII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VII class' category: #'Ejercicio 4'!
VII class
	instanceVariableNames: 'next previous'!

!VII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!VII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!VII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous
	^previous.! !

!VII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous: numAnterior
	previous := numAnterior.
	! !


!VII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!VII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
+ sumando

^ self previous + sumando next.! !

!VII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
- restando
	
^ restando sustraerDe: self.! !

!VII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!VII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!VII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !


!classDefinition: #VIII category: #'Ejercicio 4'!
DenotativeObject subclass: #VIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VIII class' category: #'Ejercicio 4'!
VIII class
	instanceVariableNames: 'next previous'!

!VIII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!VIII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!VIII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous
	^previous.! !

!VIII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous: numAnterior
	previous := numAnterior.
	! !


!VIII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!VIII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
+ sumando

^ self previous + sumando next.! !

!VIII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
- restando
	
^ restando sustraerDe: self.! !

!VIII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!VIII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!VIII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !


!classDefinition: #X category: #'Ejercicio 4'!
DenotativeObject subclass: #X
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'X class' category: #'Ejercicio 4'!
X class
	instanceVariableNames: 'next previous'!

!X class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!X class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!X class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous
	^previous.! !

!X class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous: numAnterior
	previous := numAnterior.
	! !


!X class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!X class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
+ sumando

^ self previous + sumando next.! !

!X class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
- restando
	
^ restando sustraerDe: self.! !

!X class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!X class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!X class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !


!classDefinition: #XI category: #'Ejercicio 4'!
DenotativeObject subclass: #XI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XI class' category: #'Ejercicio 4'!
XI class
	instanceVariableNames: 'next previous'!

!XI class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!XI class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!XI class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous
	^previous.! !

!XI class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous: numAnterior
	previous := numAnterior.
	! !


!XI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!XI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
+ sumando

^ self previous + sumando next.! !

!XI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
- restando
	
^ restando sustraerDe: self.! !

!XI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!XI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!XI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !


!classDefinition: #XII category: #'Ejercicio 4'!
DenotativeObject subclass: #XII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XII class' category: #'Ejercicio 4'!
XII class
	instanceVariableNames: 'next previous'!

!XII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!XII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!XII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous
	^previous.! !

!XII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous: numAnterior
	previous := numAnterior.
	! !


!XII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!XII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
+ sumando

^ self previous + sumando next.! !

!XII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
- restando
	
^ restando sustraerDe: self.! !

!XII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!XII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!XII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !


!classDefinition: #XIII category: #'Ejercicio 4'!
DenotativeObject subclass: #XIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIII class' category: #'Ejercicio 4'!
XIII class
	instanceVariableNames: 'next previous'!

!XIII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!XIII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!XIII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous
	^previous.! !

!XIII class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous: numAnterior
	previous := numAnterior.
	! !


!XIII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!XIII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
+ sumando

^ self previous + sumando next.! !

!XIII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
- restando
	
^ restando sustraerDe: self.! !

!XIII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!XIII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!XIII class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !


!classDefinition: #XIV category: #'Ejercicio 4'!
DenotativeObject subclass: #XIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIV class' category: #'Ejercicio 4'!
XIV class
	instanceVariableNames: 'next previous'!

!XIV class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!XIV class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!XIV class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous
	^previous.! !

!XIV class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous: numAnterior
	previous := numAnterior.
	! !


!XIV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!XIV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
+ sumando

^ self previous + sumando next.! !

!XIV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
- restando
	
^ restando sustraerDe: self.! !

!XIV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!XIV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!XIV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !


!classDefinition: #XV category: #'Ejercicio 4'!
DenotativeObject subclass: #XV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XV class' category: #'Ejercicio 4'!
XV class
	instanceVariableNames: 'next previous'!

!XV class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!XV class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!XV class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous
	^previous.! !

!XV class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous: numAnterior
	previous := numAnterior.
	! !


!XV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!XV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
+ sumando

^ self previous + sumando next.! !

!XV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
- restando
	
^ restando sustraerDe: self.! !

!XV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!XV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!XV class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !


!classDefinition: #XVI category: #'Ejercicio 4'!
DenotativeObject subclass: #XVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVI class' category: #'Ejercicio 4'!
XVI class
	instanceVariableNames: 'next previous'!

!XVI class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
nameOfNext
	
	(self name endsWith: 'VIII')ifTrue: [^(self name withoutSuffix:'VIII'),'IX'].
	(self name endsWith: 'III')ifTrue: [^(self name withoutSuffix:'III'),'IV'].
	(self name endsWith: 'IV')ifTrue: [^(self name withoutSuffix:'IV'),'V'].
	(self name endsWith: 'IX')ifTrue: [^(self name withoutSuffix:'IX'),'X'].
	
	^self name, 'I'.! !

!XVI class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
next
	next ifNotNil: [^next].
	next := self cloneNamed: self nameOfNext.
	next previous: self.
	
	^next.! !

!XVI class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous
	^previous.! !

!XVI class methodsFor: 'next & previous' stamp: 'Lu 9/6/2025 19:59:03'!
previous: numAnterior
	previous := numAnterior.
	! !


!XVI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
* multiplicando
	

^ multiplicando + (multiplicando * self previous).! !

!XVI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
+ sumando

^ self previous + sumando next.! !

!XVI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
- restando
	
^ restando sustraerDe: self.! !

!XVI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
/ divisor

	(divisor = self)ifTrue: [^I].
	
	^((self - divisor) / divisor) + I.! !

!XVI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

^'no se puede dividir por un número mayor'.! !

!XVI class methodsFor: 'aritmeticas' stamp: 'Lu 9/6/2025 19:59:03'!
sustraerDe: minuendo

^minuendo previous - self previous.
! !
