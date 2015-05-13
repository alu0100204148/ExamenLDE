{ 
  var auxr = 0;
  var auxp = 0;
}

head
  = tit:LITERAL COMMA fec:DATE COMMA prf:LITERAL COMMA asi:LITERAL b:body { return ('<h1 style="font-family:courier"><p style="text-align:left;">Titulo: ' + tit + '<span style="float:right;">Fecha: ' + fec.toString() + '</span></p></h1><h2 style="font-family:courier">Profesor: ' + prf + '</br>Asignatura: ' + asi + '</h2>' + b); }
  
body
  = LBRACE q:(question)+ RBRACE SEMICOLON { return (q); }
  
question
  = n:LITERAL LBRACKET a:(answer)+ RBRACKET { auxp++; auxr=0; return ('<div style="border-radius: 15px 50px 30px; border: 2px solid red; padding: 20px;><p class="question" style="font-family:courier; font-size:19px">' + auxp + '. ' + n + '</p><div style="border-radius: 15px 50px 30px; background: #8AC007; padding: 20px;><ul class=\x22answers\x22>' + a + '</ul></div></div></br>'); }

answer
  = l:LITERAL COMMA r:VF SEMICOLON { auxr++; return ('<input type=\x22radio\x22 name=\x22q' + auxp + '\x22 value=\x22'+ auxr + '\x22 id=\x22q' + auxp + auxr +'\x22 ver=\x22' + r + '\x22><label for=\x22q' + auxp + auxr + '\x22 style="font-family:courier; font-size:14px">' + l + '</label><br/>'); }

_ = $[ \t\n\r]*

LITERAL = _ "\'" literal:$([^']*) "\'" _ { return literal.replace(/</, '&lt;').replace(/>/, '&gt;'); }
DATE = _ date:$([0-9][0-9]?_[-/]_[0-9][0-9]?_[-/]_[1-2][0-9][0-9][0-9]) _ { return date.split(/[ ]*[-/][ ]*/); }
VF = _ vf:$([VF]) _ { return vf; }

COMMA = _ "," _
SEMICOLON = _ ";" _
LBRACE = _ "{" _
RBRACE = _ "}" _
LBRACKET = _ "[" _
RBRACKET = _ "]" _
