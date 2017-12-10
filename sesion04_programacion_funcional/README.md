# Estructuras de datos y colecciones

Hasta el momento hemos trabajado fundamentalmente con datos simples, i.e., variables atómicas, para almacenar valores. Pero la información con la que se trabaja habitualmente tiene una estructura determinada:

* Listas de valores (p.e., una serie temporal).
* Árboles (p.e., el resultado de leer un fichero `json` no trivial en R o Python).
* Diccionarios (o parejas clave-valor).

## Colecciones

Los lenguajes de programación modernos proporcionan ciertas estructuras predefinidas de datos que han dado en llamarse _colecciones_, aunque no todos los lenguajes de programación las soportan todas. Las más comunes son:

* Listas: secuencias de valores. Cada elemento de la lista tiene un elemento _siguiente_, menos el último, que acaba en `NULL`.
* Vectores: similares a las listas, pero que permiten el acceso por índice.
* Arrays: versión multidimensional de los vectores. Un array unidimensional es un vector; un array bidimensional es una matriz. Algunos lenguajes de programación incorporan operaciones matriciales de serie para matrices numéricas (p.e., R o MatLab) o a través de extensiones (NumPy para Python).
* Diccionarios o _hash tables_: almancenan parejas de valores clave-valor.
* Conjuntos: listas desordenadas y sin duplicados.
* _Streams_: listas sin fin (p.e., el _stream_ de los números primos).

En computación científica (y estadística, en particular), sin embargo, se usan otras _seudocolecciones_ que no suelen estar presentes en la mayor parte de los lenguajes de programación habituales: las tablas. Sin embargo, las tablas están disponibles en R (nativamente) y en Python (a través de `pandas`).

## Operacines sobre colecciones

Las colecciones permiten determinadas operaciones. Algunas son comunes a todo tipo de colecciones y otras son específicas de algunas de ellas.

Son operaciones comunes las que permiten, p.e.:

* Concatenar (p.e., dos listas).
* Añadir elementos.
* Borrar elementos.
* Comprobar si la colección contiene un determinado elemento.

Otras son específicas de determinados tipos de colecciones:

* Intersecar dos conjuntos.
* Acceder al n-ésimo elemento.
* Comprobar si un diccionario tiene una determinada clave o valor.

Y, por supuesto, operaciones para recorrer los elementos de una colección (p.e., dentro de un bucle). No obstante, postpondremos este tipo de operación hasta que discutamos la programación funcional, que es la manera natural de operar sobre colecciones.


## Ejercicios

TODO: ejercicios de añadir, borrar, etc. elementos en Python y/o R.


# Programación orientada a objetos

Las estructuras de datos descritas más arriba son suficientes para ciertos fines. Sin embargo, en determinados problemas y para ciertos fines es conveniente trabajar con clases y objetos, estructuras que pueden considerarse extensiones de las colecciones. De hecho, en algunos lenguajes de programación, las colecciones están implementadas como clases.

Un programa contiene estructuras de datos y algoritmos. En la programación no orientada a objetos En programación estructurada, usando o no colecciones, datos y algoritmos coexisten separadamente. En ciertas partes del código se definen las estructuras de datos y en otras se definen los algoritmos con las que manipularlas.

En la programación orientada a objetos, datos y funciones forman unidades atómicas, los objetos. Un objeto contiene datos y también las funciones que saben cómo operar con esos datos.

Un ejemplo de programación orientada a objetos es el que gestiona las ventanas del escritorio (p.e., de Windows). Una ventana, internamente, contiene datos como su posición, su tamaño, si está activa, si está en primer plano, etc. Y también funciones que saben repintarla, moverla, etc.

En R, el resultado de una regresión lineal, por ejemplo, también es un objeto. Ese objeto contiene múltiples elementos (la fórmula, los datos, los coeficientes, sus errores estándar, los resíduos, etc.) pero también funciones específicas como `summary`, que muestra un resumen del modelo, `plot` que muestra algunas gráficas relativas al ajuste del modelo, o `coef`, que devuelve el vector de coeficientes.


## Clases en R

En R hay varios mecanismos de creación de clases. Los más comunes son S3, S4 y las _reference clases_.

Las clases de tipo S3 son las más comunes y antiguas. Son las que usan casi todos los modelos estadísticos básicos (p.e., `lm`).

TODO: Ejemplo de creación de clases S3 (blog)

Las clases de tipo S4 son más formales y parecidas a las habituales en otros lenguajes de programación, como Python. No son particularmente populares, pero se usan, por ejemplo, en casi todo lo relacionado con la estadística espacial (paquete `sp`, etc.).

Las _reference classes_ son más modernas y... TODO: ¿qué más?


## Clases en Python

TODO: ejemplo de creación y uso de una clase en Python.



## Ejercicios

TODO: ¿cuáles?



# Programación funcional

La programación funcional tiene una larga historia (¡1958!) y una fuerte inspiración matemática. Los lenguajes funcionales (R y Python lo son, aunque no sean lenguajes _puramente funcionales_) permiten realizar ciertas operaciones abstractas (o de _alto nivel_), como `map`, `filter` o `reduce`.

En programación estructurada tradicional, para sumar las raíces cuadradas de los elementos de una lista habría que hacer algo así como:

```
total = 0
for i = 1 to len(lista):
    total = total + sqrt(lista[i])
```

En programación funcional, quedaría:

```
total = reduce(map(lista, sqsrt), "+")
```

que, habitualmente, se reduce a

```
total = sum(sqrt(lista))
```

## Operaciones básicas de programación funcional

### map

La operación `map` toma una lista y aplica una función a cada uno de sus elementos. Matemáticamente,

$$\text{map}((x_i), f) = (f(x_i))$$

En R, por ejemplo, la operación `map` está disponible mediante las funciones `sapply` o `lapply`. P.e.:

```
cuadrados <- sapply(1:!00, function(x) x^2)
```

En el código anterior estamos creando la lista `cuadrados` que contiene el cuadrado de cada elemento de la original, `1:100`. El segundo argumento de `sapply` es la función que queremos aplicar. En este caso, una función anónima o _lambda_.

En Python, se pueden usar _list comprehensions_, una sintaxis especial y muy práctica:

```
cuadrados = [x^2 for x in lista]
```

### filter

La operación `filter` crea sublistas seleccionando únicamente aquellos elemenos que cumplen una condición determinada. En R se puede usar o bien la función `Filter` (no recomendada) o el operador _multifuncional_ []:

```
lista <- 1:100
pares <- lista[lista %% 2 == 0]
```

En Python, se pueden usar de nuevo las _list comprehensions_:

```
pares = [x for x in lista if x %% 2 == 0]
```

De hecho, en Python se puede hacer

```
cuadrados_pares = [x^2 for x in lista if x %% 2 == 0]
```

combinando `map` y `filter`. Nótese cómo esta operación es similar a la deficinición matemática de los cuadrados de los pares:

$$\left{x^2 | x \in 1:100, x \text{es par} \right}$$


### reduce

La operación _reduce_ admite como argumento una función binaria y, aplicada a una lista, hace:

$$\reduce((x_i), f) = f(f(\dots f(x_1, x_2), 3, \dots), x_n)$$

La expresión anterior se entiende mejor si $f(a, b) = a + b$, con lo que queda

$$\reduce((x_i), +) = (((x_1 + x_2) + x_3) + \dots ) = x_1 + x_2 + \dots $$

En R (y en algunos paquetes de Python) existen operaciones como `sum` que son versiones concretas de `reduce`. También existe la función `Reduce` (mira los ejemplos).


### Ejercicios

TODO: ejercicios, tanto en R como en Python
