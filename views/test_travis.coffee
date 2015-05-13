require '../public/js/DSLEx.js'
chai = require 'chai'

assert = chai.assert

describe 'PEGJS ADPR', ->
	it 'Fecha con -', ->
    aux = DSLEx.parse('\'Examen1\',21-02-1995,\'Marcos\',\'Empresas\'{
  \'P1\' [\'HOLA\', F;]
};')
	it 'Fecha con /', ->
    aux = DSLEx.parse('\'Examen1\',21/02/1995,\'Marcos\',\'Empresas\'{
  \'P1\' [\'HOLA\', F;]
};')
  it '1 P 1 R', ->
    aux = DSLEx.parse('\'Examen1\',21-02-1995,\'Marcos\',\'Empresas\'{
  \'P1\' [\'HOLA\', F;]
};')
   it '1 P 2 R', ->
    aux = DSLEx.parse('\'Examen1\',21-02-1995,\'Marcos\',\'Empresas\'{
  \'P1\' [\'HOLA\', F; \'ADIOS\', V;]
};')
		it '2 P 2 R', ->
    aux = DSLEx.parse('\'Examen1\',21-02-1995,\'Marcos\',\'Empresas\'{
  \'P1\' [\'HOLA\', F; \'ADIOS\', V;]
  \'P2\' [\'MIRA\', F; \'ESO\', V;]
};')
		it '4 P 4 R', ->
    aux = DSLEx.parse('\'Examen1\',21-02-1995,\'Marcos\',\'Empresas\'{
  \'P1\' [\'HOLA\', F; \'ADIOS\', V; \'CARA\', V; \'PERRO\', V;]
  \'P2\' [\'MIRA\', F; \'ESO\', V;]
  \'P3\' [\'QUE\', F; \'GUAPO\', V;]
  \'P4\' [\'ESTA\', F; \'NO?\', V;]
};')
  return
return
