require '../public/js/DSLEx.js'
chai = require 'chai'

assert = chai.assert

describe 'PEGJS ADPR', ->
  it 'DUMMY', ->
    aux = DSLEx.parse('"Examen1",21-02-1995,"Marcos","Empresas"{
  "P1" ["HOLA", F; "ADIOS", V;]
  "P2" ["ADIOS", V;]
};')
    return
  return
