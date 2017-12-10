# Programación estructurada

En esta sección vamos a introducir los proncipios de programación estructurada en R y Python.

## Elementos fundamentales de programación estructurada

La programación estructurada, históricamente, representó un avance sobre la manera en que se programaban los primeros ordenadores. Está basada en el uso de:

* Estructuras condicionales (`if`/`if-else`)
* Bucles (`for`/`while`)
* Funciones

Estos elementos están disponibles en casi todos los lenguajes de programación y casi siempre tienen una sintaxis similar. Una referencia para la sintaxis de estos elementos en R es [esta](https://datanalytics.com/libro_r/programacion-imperativa-en-r.html) y en Python, [esta](https://docs.python.org/3/tutorial/controlflow.html).

## Funciones, librerías y APIs

En la programación estructurada, el uso de funciones tiene un objetivo fundamental: evitar repetir código. Las funciones permiten _extraer funcionalidad común_ en determinados puntos de programas para poder utilizarla donde sea necesario. Un principio básico de programación es _don't repeat yourself_. Si te das cuenta de que estás haciendo lo mismo dos o más veces en sitios distintos de tu programa, es que necesitas definir funciones.

Determinadas funciones tienen un uso más general que exceden al del programa en cuestión que las motivó. Todos los lenguajes de programación permiten crear _librerías_ (o conjuntos de funciones) que pueden utilizarse en diversos programas.

Para que una función (o una colección de funciones) sea útil y usable (típicamente, por terceros), es conveniente definir cuidadosamente su API. El API de una función consiste en lo que acepta como argumentos y lo que devuelve como salida. Una buena API:

* Elige bien el nombre de los argumentos.
* Elige bien el formato de salida de los datos.
* Documenta adecuadamente unos y otros. [Aquí](http://kbroman.org/pkg_primer/pages/docs.html) puedes encontrar algunos ejemplos de cómo documentar el API de funciones usando `Roxygen2`. No es necesario que aprendas (todavía) `Roxygen2` pero puedes inspirarte en ese ejemplo para documentar tus propias funciones.



## Ejercicios

### Ejercicio

En `dat/datos_ejercicio_ode_01.txt` están los datos observados correspondientes a un _experimento_ en el que se ha obserado el crecimiento de una población. Se puede suponer que esta población evoluciona siguiendo una [ecuación logística](http://mathworld.wolfram.com/LogisticEquation.html) y tiene un error de medida.

El objetivo del problema es identificar los parámetros relevantes (`r` y `K` en la nomenclatura del enlace anterior) a partir de esos datos.

Vamos a crear la solución tanto en R como en Python trabajando en grupos de tres y utilizando GitHub. En R, el resultado final será un documento creado con RMarkdown. En Python, un cuaderno de Jupyter.

Harán falta, cuando menos, tres funciones:

* Una, dados los parámetros adecuados, calcula la solución a la ecuación logística (resolviendo la ODE por cualquier procedimiento o usando la fórmula cerrada).
* Otra calcula el error cuadrático entre las estimaciones y las observadas.
* Otra calcula el mínimo de la función de error. No uses funciones de optimizaciòn: para este ejercicio, utiliza un algoritmo de fuerza bruta explorando una rejilla de valores.

### Ejercicio

Es similar al anterior, aunque usando los datos `dat/datos_ejercicio_ode_01.txt`. La diferencia con el ejercicio anterior consiste en que ahora hay un parámetro más: el momento en el que la población comienza a crecer: en los datos, la población es constante durante un determinado periodo y hay un momento en el que comienza a crecer de acuerdo con el criterio del ejercicio anterior. Identifica los parámetros de la ecuación diferencial y, además, el punto de inicio del crecimiento de la población.


## Para saber más: texto y fechas

Existen dos tipos de datos muy particulares que aparecen siempre que se programa con datos: texto y fechas. Afortunadamente, en casi todos los lenguajes de programación se manejan de la misma forma e incluso las funciones involucradas tienen nombres parecidos.

Para saber más sobre fechas y suprocesamiento (en R) lee con detenimiento [esto](https://rpubs.com/davoodastaraky/lubridate) y échale un vistazo a [esto](https://www.jstatsoft.org/article/view/v040i03/v40i03.pdf). Puedes comparar estas funciones con [las equivalentes de Python](https://docs.python.org/3/library/time.html).

Para el procesamiento de texto, puedes echarle un vistazo a [esto (en R)](http://www.mjdenny.com/Text_Processing_In_R.html) o [esto (en Python)](https://docs.python.org/3/library/text.html). Verás que, en cualquier caso, la manipulación avanzada de texto está basada en el uso de [_expresiones regulares_](https://en.wikipedia.org/wiki/Regular_expression), cuyo conocimiento es inexcusable. Para aprender lo fundamental de las expresiones regulares puedes comenzar [aquí](https://regexone.com/).
