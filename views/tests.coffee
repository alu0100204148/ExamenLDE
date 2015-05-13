assert = chai.assert

suite 'PEGJS ADPR', ->
	test 'Fecha con -', ->
		aux = DSLEx.parse('\'Examen1\',21-02-1995,\'Marcos\',\'Empresas\'{  \'P1\' [\'HOLA\', F;]};')
	test 'Fecha con /', ->
		aux = DSLEx.parse('\'Examen1\',21/02/1995,\'Marcos\',\'Empresas\'{  \'P1\' [\'HOLA\', F;]};')
	test '1 P 1 R', ->
    aux = DSLEx.parse('\'Examen1\',21-02-1995,\'Marcos\',\'Empresas\'{  \'P1\' [\'HOLA\', F;]};')
   test '1 P 2 R', ->
    aux = DSLEx.parse('\'Examen1\',21-02-1995,\'Marcos\',\'Empresas\'{  \'P1\' [\'HOLA\', F; \'ADIOS\', V;]};')
		test '2 P 2 R', ->
    aux = DSLEx.parse('\'Examen1\',21-02-1995,\'Marcos\',\'Empresas\'{  \'P1\' [\'HOLA\', F; \'ADIOS\', V;]  \'P2\' [\'MIRA\', F; \'ESO\', V;]};')
		test '4 P 4 R', ->
    aux = DSLEx.parse('\'Examen1\',21-02-1995,\'Marcos\',\'Empresas\'{  \'P1\' [\'HOLA\', F; \'ADIOS\', V; \'CARA\', V; \'PERRO\', V;]  \'P2\' [\'MIRA\', F; \'ESO\', V;]  \'P3\' [\'QUE\', F; \'GUAPO\', V;]  \'P4\' [\'ESTA\', F; \'NO?\', V;]};') 
return
