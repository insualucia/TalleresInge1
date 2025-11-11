!classDefinition: #TestsCarrito category: #TusLibros!
TestCase subclass: #TestsCarrito
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TestsCarrito methodsFor: 'tests' stamp: 'LU 11/10/2025 20:39:06'!
test01AlCrearCarritoEstaVacio
	| carrito |
	carrito := Cart acceptingItemsOf: Set new.
	
	self assert: carrito isEmpty! !

!TestsCarrito methodsFor: 'tests' stamp: 'LU 11/10/2025 20:39:12'!
test02SePuedeAgregarAlCarritoUnProductoEnElCatalogo
	| carrito producto catalogo |
	
	catalogo := Set with: 9780553808049.
	carrito := Cart acceptingItemsOf: catalogo .
	
	producto := 9780553808049.
	carrito add: producto.
	
	self deny: carrito isEmpty.
	
	self assert: (carrito includes:9780553808049).! !

!TestsCarrito methodsFor: 'tests' stamp: 'LU 11/10/2025 20:39:17'!
test03NoSePuedeAgregarAlCarritoUnProductoQueNoEstaEnElCatalogo
	| carrito producto catalogo |
	
	catalogo := Set with:9780553808049.
	carrito := Cart acceptingItemsOf: catalogo.
	
	producto := 9780553808016.
	
	self should:[carrito add: producto]
		raise: Error
		withExceptionDo:[:anError |
							self assert: carrito isEmpty.
							self assert: anError messageText equals: Cart errorProductsMustBeInCatalog.
						].
	! !

!TestsCarrito methodsFor: 'tests' stamp: 'AC 11/11/2025 12:13:40'!
test04SePuedenAgregarVariosProductosDistintosDelCatalagoAlCarrito
	| carrito catalogo |
	
	catalogo := Set with: 9780553808016 with:9780553808049.
	carrito := Cart acceptingItemsOf: catalogo.
	
	carrito add: 5 of: 9780553808016.
	carrito add: 3 of: 9780553808049.
	
	self assert: (carrito occurrencesOf: 9780553808016) equals: 5.
	self assert: (carrito occurrencesOf: 9780553808049 ) equals: 3.! !

!TestsCarrito methodsFor: 'tests' stamp: 'AC 11/11/2025 12:14:04'!
test05SePuedenAgregarVariosDelMismoProductoDelCatalogoALaVez
	| carrito producto catalogo |
	
	catalogo := Set with:9780553808049.
	carrito := Cart acceptingItemsOf: catalogo.
	
	producto := 9780553808049.
	
	carrito add: 3 of: 9780553808049.
	
	self assert: (carrito occurrencesOf: 9780553808049) equals: 3.
	! !

!TestsCarrito methodsFor: 'tests' stamp: 'LU 11/10/2025 20:42:55'!
test06NoSePuedenAgregarCantidadesMenoresQueUno
	| carrito producto catalogo |
	
	catalogo := Set with:9780553808049.
	carrito := Cart acceptingItemsOf: catalogo.
	
	producto := 9780553808049.
	
	
	self should:[carrito add: 0 of: 9780553808049.]
		raise: Error
		withExceptionDo:[:anError |
							self assert: carrito isEmpty.
							self assert: anError messageText equals: Cart errorQuantityShouldBeMoreThan1.
						].
	! !

!TestsCarrito methodsFor: 'tests' stamp: 'AC 11/11/2025 12:14:28'!
test07SePuedenAgregarVariosDelMismoProductoDelCatalagoDistintasVecesAcumulaCantidades
	| carrito producto catalogo |
	
	catalogo := Set with: 9780553808016.
	carrito := Cart acceptingItemsOf: catalogo.
	
	producto := 9780553808049.
	
	carrito add: 5 of: 9780553808016.
	carrito add: 3 of: 9780553808016.
	
	self assert: (carrito occurrencesOf: 9780553808016) equals: 8.
	! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'products catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'testing' stamp: 'AC 11/10/2025 15:42:42'!
includes: aProduct 
	^products keys includes: aProduct .! !

!Cart methodsFor: 'testing' stamp: 'AC 11/7/2025 21:42:45'!
isEmpty
	^products isEmpty ! !


!Cart methodsFor: 'initialization' stamp: 'AC 11/10/2025 15:36:52'!
initializeWithCatalog: aCatalog 
	products := Dictionary new.
	catalog := aCatalog.! !


!Cart methodsFor: 'adding products' stamp: 'LU 11/10/2025 20:43:36'!
add: aProduct 
	^self add: 1 of: aProduct.
	! !

!Cart methodsFor: 'adding products' stamp: 'LU 11/10/2025 20:41:28'!
add: aQuantityOfProduct of: aProduct
	(catalog includes: aProduct)  ifFalse:[self error: self class errorProductsMustBeInCatalog].
	aQuantityOfProduct < 1 ifTrue: [self error: self class errorQuantityShouldBeMoreThan1].
	products at: aProduct put: (products at: aProduct ifAbsent:[0]) + aQuantityOfProduct .! !


!Cart methodsFor: 'product quantity' stamp: 'LU 11/10/2025 20:50:54'!
occurrencesOf: aProduct

	^ products at: aProduct ifAbsent: 0. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'LU 11/10/2025 20:38:32'!
acceptingItemsOf: aCatalog
	^self new initializeWithCatalog: aCatalog ! !


!Cart class methodsFor: 'errors' stamp: 'AC 11/7/2025 21:50:21'!
errorProductsMustBeInCatalog
	^'Products to add must be in the catalog'! !

!Cart class methodsFor: 'errors' stamp: 'AC 11/10/2025 15:48:31'!
errorQuantityShouldBeMoreThan1
	^'Product quantity must be more than zero'! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 126 112 117 107 118 126 122 61 59 17 74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 126 112 117 107 118 126 122 61 59 99 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 76 113 108 121 106 112 106 112 118 91 124 122 83 112 105 121 118 122 53 112 116 104 110 108 17 94 112 117 58 57 17 61 53 57 17 95 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 100 17 94 112 117 107 118 126 122 17 94 112 117 58 57 39 105 124 112 115 123 39 118 117 39 84 104 121 39 39 56 39 57 55 57 60 39 55 56 65 55 59 65 57 57 39 78 84 91 39 74 118 116 119 112 115 108 121 65 39 59 53 57 53 56 39 74 118 116 119 104 123 112 105 115 108 39 74 115 104 117 110 39 63 53 55 53 56 39 47 123 104 110 122 54 89 76 83 76 72 90 76 102 63 55 56 54 109 112 117 104 115 48 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 84 104 121 39 39 56 39 57 55 57 60 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 84 104 121 39 39 56 39 57 55 57 60 17 93 84 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 84 118 117 39 86 106 123 39 61 39 56 57 65 58 59 65 57 56 39 57 55 57 60 39 74 118 116 116 112 123 79 104 122 111 65 39 108 107 58 60 59 63 61 39 87 115 124 110 112 117 122 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 199 175 217 112 17 56 64 57 53 56 61 63 53 57 56 55 53 56 55 60 17 83 72 87 91 86 87 52 57 73 79 64 59 80 61 75 53 115 104 117 17 83 72 87 91 86 87 52 57 73 79 64 59 80 61 75 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 56 91 56 57 65 55 61 65 58 55 53 63 55 61 60 59 60 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 91 104 115 115 108 121 108 122 80 117 110 108 56 99 76 113 108 121 106 112 106 112 118 91 124 122 83 112 105 121 118 122 99 91 124 122 83 112 105 121 118 122 53 122 123 17 56 57 61 60 61 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 55 91 56 61 65 55 64 65 55 63 53 61 63 63 57 64 63 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 91 124 122 83 112 105 121 118 122 53 122 123 17 60 56 64 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 55 91 56 61 65 56 58 65 59 57 53 58 64 58 57 64 63 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 91 124 122 83 112 105 121 118 122 53 122 123 17 60 56 57 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 56 91 56 57 65 56 62 65 57 64 53 61 63 59 60 59 60 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 72 115 108 99 75 118 106 124 116 108 117 123 122 99 76 122 123 124 107 112 118 99 77 104 106 124 115 123 104 107 99 57 55 57 60 99 80 117 110 108 117 112 108 121 112 104 39 56 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 91 124 122 83 112 105 121 118 122 53 122 123 17 59 63 56 59 17 52 52 52 52 52 52 52 52 52 52 17 17))!