# Introducción a la programación (científica)

Este curso cubre una selección de métodos y herramientas para la programación en general y la programación científica en particular.

## Sistema operativo: Linux

Actualmente, la plataforma de programación científica por excelencia es Linux (y los sistemas operativos _tipo Linux_, que incluyen UNIX y su dialecto más extendido, Mac OS).

Como recomendación personal, si no usas Linux, comienza por [Ubuntu](https://www.ubuntu.com/). Es el que mejor documentación tiene para quienes se inician en Linux.

Además, deberías trabajar fundamentalemente sobre la consola de Linux. Cuando accedas a servidores remotos (¡casi todos correrán Linux!) es lo único que tendrás disponible.

### Referencias (TODO: añadir enlaces)

* Instalación de Ubuntu
* Línea de comandos

## Editores de texto

El texto es el formato universal (pero lee el último párrafo de esta sección). Queremos usar, en la medida de lo posible, texto: para datos, para código, para documentación, etc. Es decir, no queremos Excel, Word, etc. Toleraremos formatos binarios (p.e., para gráficos, PDFs, etc.) cuando no quede otro remedio y para sus fines particulares.

### Opciones

Como casi siempre vamos a trabajar con texto, necesitaremos un editor de texto decente. Hay muchos disponibles y comento unas cuantas opciones debajo:

* `vi`: un dinosaurio de otra época que aún goza de buena salud. Su principal ventaja es que está disponible en consola y en la práctica totalidad de las máquinas sobre las que trabajes. Es esencial, por lo tanto, cuando vayas a acceder y trabajar sobre máquinas remotas. Posiblemente, sea el único editor de texto que tengas disponible.
* `vim`: es una versión modernizada de `vi`. Es `vi` con esteroides. Posiblemente, si instalas `vi` estarás, en realidad, instalando `vim`.
* `emacs`: otro dinosaurio con una hinchada pequeña pero militante. Mantente alejado y no atiendas los cantos de sirena de sus partidarios. En realidad, `emacs` es muy potente; pero, a la vez, tremendamente complicado: es cosa tuya si quieres invertir el tiempo necesarios para dominarlo. Si lo logras, ¡enhorabuena! Pero no tomes una decisión antes de probar otras opciones y seas consciente de en lo que te metes.
* [Sublime](https://www.sublimetext.com/): es un `emacs` más fiel a su espíritu que a su letra. Es decir, como `emacs` pero reescrito usando las tecnologías actuales. Propietario y no sé si de pago (TODO: averiguar).
* [Atom](https://atom.io/): una alternativa abierta a Sublime.

Hay más (particularmente, editores de texto orientados a fines particulares: determinados lenguajes de programación, LaTeX, etc.) pero todos los de arriba (menos `vi`) te permitirán editar LaTeX, desarrollar código en varios lenguajes, etc.

Mi recomendación es que aprendas lo básico de `vi` (lo necesitarás cuando trabajes remotamente casi seguro) y te vuelvas experto ya sea en Sublime o en Atom.

### Codificaciones de caracteres

El que el texto plano sea el formato unversal es una mentira piadosa. Desafortunadamente, coexisten demasiadas codificaciones de caracteres distintas y es imperativo tenerlas siempre en cuenta. Lo mínimo que deberías saber al respecto es [esto](https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/).

### Formatos de fichero

Aunque el texto plano sea universal, casi nadie escribe texto libre. Casi siempre se escribe texto en un formato determinado, es decir, con una serie de reglas y sintaxis dadas. Los editores anteriores reconocen esos formatos y les dan soporte a través de funcionalidades muy deseables como el [resaltado de sintaxis](https://es.wikipedia.org/wiki/Coloreado_de_sintaxis).

El texto dirigido a otros humanos se redacta en Markdown (más sobre eso después) y sus dialectos, como Rmarkdown. Una alternativa vieja y de nicho para el Markdown es LaTeX (del que Markdown aprovecha las funcionalidades más valiosas, como las fórmulas matemáticas). También, a veces, querrás editar HTML directamente, aunque no es lo más habitual ni recomendado.

No obstante, frecuentemente, te verás leyendo o editando texto en otros formatos tales como:

* `json` y XML: que son similares, solo que `json` es más moderno y amigable.
* CSV: el eterno (y peligroso, por la excesiva flexibilidad del formato) formato de intercambio de tablas de datos.
* [`yaml`](https://en.wikipedia.org/wiki/YAML): una alternativa a `json` y XML para pequeños documentos (p.e., ficheros de configuración, preámbulos, etc.).

Una de las características más notables de los formatos más modernos (Markdown, `json`, `yalm`) es que buscan (¿y consiguen?) un equilibrio entre lo fácilmente inteligible para humanos y lo fácilmente procesable automáticamente por máquinas.

## Tecnologías web

Cada día es más frecuente tener que acceder a datos y recursos (científicos y no solo científicos) disponibles remotamente a través de _servicios web_. Y cada día es más frecuente tener que dar servicio a terceros a través de tal tipo de servicios.

Por tanto, se está volviendo imprescindible conocer las tecnologías que mueven todo lo _web_. En particular:

* `telnet` y `ssh`: permiten acceder a máquinas remotas y abrir sesiones en ellas. `telnet` es el antecesor de `ssh` y solo deberías usarlo si no hay más remedio. `ssh` es una versión moderna de `telnet` cuya mejora fundamental consiste en que las comunicaciones están encriptadas. Casi siempre que accedas a una máquina remota, querrás hacerlo usando `ssh`.
* `ftp` y `scp`: sirven para enviar y recibir ficheros entre máquinas. `ftp` es el antecesor de `scp` y la diferencia entre ellas es, esencialmente, la misma que entre `telnet` y `ssh`: la encriptación.
* TCP/IP (y redes, en general): tienes que aprender sobre direcciones de internet, puertos y comunicaciones.
* APIs, servicios REST y `http`: querrás saber sobre _endpoints_, cómo realizar peticiones REST sobre el protocolo `http` (o `https`), etc. También lo básico sobre autenticación (p.e., OAuth2). Y a manejar cURL (ya sea directamente o a través de _wrappers_ como el [paquete `httr` de R](https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html)).
* Creación de servicios _web_: por ejemplo, usando [OpenCPU](https://www.opencpu.org/) en R o [Flask](http://flask.pocoo.org/) en Python.

## Bases de datos

Salvo en projectos de mínima envergadura, los datos de trabajo van a estar almacenados en una base de datos. Típicamente, una base de datos _relacional_ que admite consultas SQL.

El SQL es condición _sine qua non_ para el trabajo serio en ciencia de datos.

También es conveniente familiarizarse (como usuario, pero también como administrador) en algunas de las bases de datos más conocidas (MySQL o PostgreSQL).

La revolución de todo lo NoSQL (sistemas de almacenamiento de datos no relacionales y que no usan o suelen usar SQL como lenguaje de consultas) es una revolución _contra_ SQL. Así, SQL es la puerta de entrada para NoSQL.


## Programación

### Lenguajes de programación

Los lenguajes de programación fundamentales para la computación científica son R y Python. R, fundamentalmente, para todo lo que tenga un sesgo más estadístico. Python para cálculos en ingeniería, física, etc.

A partir de ahí, hay dos rutas:

* Datos pequeños, máxima eficiencia: C y C++. Tal vez, para aplicaciones concretas, querrás que tus algoritmos corran más rápido (¿cien veces más?). Ahí C y C++ son imbatibles.
* Datos grandes y paralelismo: Scala y Spark.


### IDE's

Un IDE es un programa para programar. Cuenta con editores de texto (para escribir el código) y muchas cosas más que facilitan la tarea de la programación:

* Resaltadores de sintaxis.
* _Debuggers_ más o menos interactivos.
* Detectores de errores de sintaxis.
* Compilación y ejecución de programas.
* Acceso a respositorios (`git` y otros).
* Herramientas de refactorización.
* ...

Los hay de muchos tipos. Algunos están adaptados a muchos lenguajes de programación distintos vía _plugins_ (p.e., Eclipse o [Intelij IDEA](https://en.wikipedia.org/wiki/IntelliJ_IDEA)) y los hay específicos para un lenguaje de programación determinado (p.e., [RStudio](https://www.rstudio.com/) para R o [PyCharm](https://www.jetbrains.com/pycharm/) para Python).

De hecho, se recomenda usar RStudio para trabajar con R. RStudio, de hecho, es un IDE un tanto particular. Casi todos los IDEs están diseñados para gestionar grandes proyectos de _software_, mientras que RStudio está más orientado al trabajo interactivo.


### Principios de ingeniería de software

Hay código bueno y código malo. El código bueno es:

* Legible y comprensible (por humanos)
* Eficiente (frecuentemente, legibilidad y eficiencia son la misma cosa pero, en ocasiones, sucede al revés).
* Mantenible, i.e., es fácil de modificar y ampliar
* Tiene pruebas y _tests_ automáticos

El código malo es lo contario.

La historia de la ingeniería de _software_ es la historia de un conjunto de prácticas y herramientas para conseguir esos objetivos anteriores. A ella le debemos, por ejemplo:

* La programación estructurada: está orientada a partir programas largos y complejos en funciones más simples.
* La programación orientada a objetos: que abunda en la anterior y encapsula datos y funciones en unidades de código, los objetos, independientes.
* La programación funcional: de inspiración matemática, introduce una serie de operaciones comunes (_map_, _reduce_, etc.) y permite abstaer _lo que los programas hacen_ de _la máquina donde corren los programas_. Por eso es fundamental en el mundo de la computación distribuida y subyace a todas las tecnologías _big data_ modernas: Hadoop, Spark, etc.
* TODO: ¿algo sobre _tests_ unitarios?

Existen muchos principios más granulares que los anteriores que sirven de criterio para escrbir código de una manera u otra. Por ejemplo:

* No dupliques código, no tengas dos líneas iguales en dos partes distintas, ¡no uses copiar y pegar nunca!
* Haz programas y funciones que hagan una sola cosa y la hagan bien.
* Documenta tu código adecuadamente.
* Sigue las guías de estilo más comunes para el lenguaje de progrmación que uses.
* Sé cuidadoso con el nombre que das a programas, funciones y variables.
* Etc.

Existen libros de _autoayuda para programadores_ que, a diferencia de los de propósito general, se recomiendan encarecidamente. Por ejemplo:

* [_The pragmatic programmer_](https://en.wikipedia.org/wiki/The_Pragmatic_Programmer)
* [_The Art of Unix Programming_](http://www.catb.org/esr/writings/taoup/html/)


## Colaboración y comunicación

El programador científico, a diferencia del ingeniero de _software_, no crea programas sino que resuelve problemas para los que la programación es fundamental. Pero su _entregable_ no suele ser un programa sino la solución a su problema. Que tiene que ser comunicado a terceros.

Las prácticas y herramientas a las que se refiere esta sección no son exclusivas de la programación científica, sino que han penetrado y son de uso generalizado en entornos (no solo académicos) de trabajo modernos.

### Ensayos computacionales y herramientas de reproducibilidad

Por muchos motivos, entre ellos los relacionados con la reproducibilidad (condición necesaria para la replicabilidad), es conveniente (y casi imperativo) integrar el código dentro del entregable del producto científico y técnico (sea este una tesis, un artículo, un libro, etc.).

El procedimiento tradicional consistía en redactar en Word o LaTeX e insertar a mano las tablas y gráficos necesarios (generados más o menos manualmente mediante programas externos) en el cuerpo del texto. Ese proceso, tan expuesto a errores, está totalmente superado hoy en día.

Hoy en día, y en la medida de lo posible, rigen los llamados [_ensayos computacionales_](http://blog.stephenwolfram.com/2017/11/what-is-a-computational-essay/). Existen tecnologías para redactar ensayos computacionales, como (sin perjucio de otros)

* Rmarkdown en R y
* los _notebooks_ de Python/Jupyter.

Además, cada vez es más frecuente que el código generado dentro de un proyecto de investigación y sus resultados se compartan con la comunidad científica (y no solo científica) de varias maneras:

* Paquetizando el código (p.e., creando y publicando paquetes de R o Python)
* Creando servicios _web_ que publiquen datos o expongan al exterior servicios de cálculo.

### Herramientas de comunicación

Durante el proceso de creación del código (y no solo del código) es necesario comunicarse con terceros (superiores, colaboradores, colegas). Incluso después de completado el análisis, es conveniente disponer de una plataforma de comunicación con usuarios (que informan de _bugs_ o posibles mejoras), etc.

Pero el correo electrónico (¡y nada que decir del postal!) no bastan hoy en día.

Por eso, el código se desarrolla en plataformas colaborativas como GitHub, BitBucket o GitLab, basada en _git_, que no solo permiten gestionar las versiones de los ficheros y sus cambios, sino crear canales de comunicación eficientes entre colaboradores y usuarios.

Y para proyectos que no sean personales, está imponiéndose (como alternativa al correo elecrónico) el uso de plataformas de colaboración como [Slack](http://www.slack.com).
