{ 
  var auxr = 0;
  var auxp = 0;
}

head
  = tit:LITERAL COMMA fec:DATE COMMA prf:LITERAL COMMA asi:LITERAL b:body { return ('<h1>Titulo: ' + tit + '  Fecha: ' + fec.toString() + '  Profesor: ' + prf + '  Asignatura: ' + asi + '</h1>' + b); }
  
body
  = LBRACE q:(question)+ RBRACE SEMICOLON { return (q); }
  
question
  = n:LITERAL LBRACKET a:(answer)+ RBRACKET { auxp++; auxr=0; return ('<p class=\x22question\x22>' + auxp + '. ' + n + '</p><ul class=\x22answers\x22>' + a + '</ul>'); }

answer
  = l:LITERAL COMMA r:VF SEMICOLON { auxr++; return ('<input type=\x22radio\x22 name=\x22q' + auxp + '\x22 value=\x22'+ auxr + '\x22 id=\x22q' + auxp + auxr +'\x22 ver=\x22' + r + '\x22><label for=\x22q' + auxp + auxr + '\x22>' + l + '</label><br/>'); }

_ = $[ \t\n\r]*

LITERAL = _ "\'" literal:$([^']*) "\'" _ { return literal; }
DATE = _ date:$([0-9][0-9]?_[-/]_[0-9][0-9]?_[-/]_[1-2][0-9][0-9][0-9]) _ { return date.split(/[ ]*[-/][ ]*/); }
VF = _ vf:$([VF]) _ { return vf; }

COMMA = _ "," _
SEMICOLON = _ ";" _
LBRACE = _ "{" _
RBRACE = _ "}" _
LBRACKET = _ "[" _
RBRACKET = _ "]" _
