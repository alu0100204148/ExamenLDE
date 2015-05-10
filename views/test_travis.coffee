require '../public/js/pl0.js'
chai = require 'chai'

assert = chai.assert

describe 'PEGJS ADPR', ->
  it 'Comprobación de prioridad de los operadores', ->
    aux = pl0.parse('x = 1 + 40 * 3 .')
    assert.equal aux.program[0].sentence.right.type, '+'
    assert.equal aux.program[0].sentence.right.right.type, '*'
    return
  it 'Comprobación de recursividad a izquierdas (resta)', ->
    aux = pl0.parse('x = 5 - 2 - 3 .')
    assert.equal aux.program[0].sentence.type, 'ASSIGN'
    assert.equal aux.program[0].sentence.right.type, '-'
    assert.equal aux.program[0].sentence.right.left.type, '-'
    return
  it 'Comprobación de detección de errores', ->
    assert.throws (->
      pl0.parse 'x = (2'
      return
    ), 'Expected ")", [ \\t\\n\\r], [*\\/], [+\\-] or [0-9] but end of input found.'
    return
  it 'Comprobación de IF', ->
    aux = pl0.parse('if x == 2 then y = 32.')
    assert.equal aux.program[0].sentence.type, 'IF'
    return
  it 'Comprobación de IF ELSE', ->
    aux = pl0.parse('if x == 2 then y = 32 else y = 34.')
    assert.equal aux.program[0].sentence.type, 'IFELSE'
    return
  it 'Comprobación de BEGIN', ->
    aux = pl0.parse('begin x = 150; y  = 200; end .')
    assert.equal aux.program[0].sentence.type, 'BEGIN'
    return
  it 'Comprobación de WHILE', ->
    aux = pl0.parse('while x == 3 do y = x - 1.')
    assert.equal aux.program[0].sentence.type, 'WHILE'
    return
  it 'Comprobación de CALL', ->
    aux = pl0.parse('call prueba.')
    assert.equal aux.program[0].sentence.type, 'CALL'
    return
  it 'Comprobación de CALL con args', ->
    aux = pl0.parse('call prueba(a, b, c).')
    assert.equal aux.program[0].sentence.type, 'CALL'
    assert.equal aux.program[0].sentence.arguments[0].ident.value, 'a'
    assert.equal aux.program[0].sentence.arguments[1].ident.value, 'b'
    assert.equal aux.program[0].sentence.arguments[2].ident.value, 'c'
    return
  it 'Comprobación de PROCEDURE con args', ->
    aux = pl0.parse('procedure prueba(a, b); begin a = 1; b = 2; end; x = 7 - 1; .')
    assert.equal aux.program[0].procedure[0].arguments[0].ident.value, 'a'
    assert.equal aux.program[0].procedure[0].arguments[1].ident.value, 'b'
    return
  return
