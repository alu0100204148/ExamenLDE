# Proyecto: Diseña e Implementa un Lenguaje de Dominio Específico

> Autores: Alexis López, Marcos Luis, Sergio González Rodríguez.

>Coordinador: Alexis López.

## Objetivo
>Diseñar un lenguaje de dominio específico para simplificar cualquier tarea en la que estés interesado:Para escribir exámenes,
Para dibujar/(hablar sobre) árboles: poner información en un nodo, mostrar los ancestros de este, buscar el ancestro común, dibujar subarbol, etc.
Para calcular fechas,
Para generar emails
Para escribir música
Para escribir autómatas finitos
Para procesar CSS (tipo SASS por ejemplo)
Para generar HTML (tipo haml o slim)
Para controlar un robot
Para programar un conjunto Restringido de Juegos
Especificar tareas (tipo Make, Rake, etc.)
etc.

## Desarrollo

>En este caso hemos decidido desarrollar un LDE que reconozca exámenes de tipo test, dado que es algo que ya conocemos de asignaturas anteriores.

La estructura en un principio será del tipo: 

  TituloExamen,fechaExamen, profesor, asignatura{
 - Enunciado de la pregunta1( respuesta1, voF;respuesta2, voF;respuesta3;voF);
 - Enunciado de la pregunta2( respuesta1, voF; respuesta2, voF;respuesta3;voF);
 - Enunciado de la pregunta3( respuesta1, voF; respuesta2, voF;respuesta3;voF);
}


Para ello hemos utilizado mucho de lo utilizado anteriormente en clase.
- JavaScript
- CooffeeScript
- Jade
- Mocha + Chai + Blanket (testeo web)
- Travis



## Página web de la Práctica
Se puede acceder desde el siguiente enlace:

- Despliegue Heroku: [https://examenlde.herokuapp.com/](https://examenlde.herokuapp.com/), 
- Pruebas: [https://examenlde.herokuapp.com/test](https://examenlde.herokuapp.com/test), 


## Travis
[![Build Status](https://travis-ci.org/alu0100204148/ExamenLDE.svg)](https://travis-ci.org/alu0100204148/ExamenLDE)

