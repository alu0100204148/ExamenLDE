head
  = tit:LITERAL COMMA fec:DATE COMMA prf:LITERAL COMMA asi:LITERAL b:body { return {Titulo:tit, Fecha:fec, Profesor:prf, Asignatura:asi, Enunciados:b }; }
  
body
  = LBRACE q:(question)+ RBRACE SEMICOLON { return {Preguntas: q }; }
  
question
  = n:LITERAL LBRACKET a:(answer)+ RBRACKET { return {Enunciado:n, Respuestas:a }; }

answer
  = l:LITERAL COMMA r:VF SEMICOLON { return {EnunciadoResp:l, Veracidad:r }; }

_ = $[ \t\n\r]*

LITERAL = _ '"' literal:$([a-zA-Z0-9 ?¿<>]*) '"' _ { return literal; }
DATE = _ date:$([0-9][0-9]?_[-/]_[0-9][0-9]?_[-/]_[1-2][0-9][0-9][0-9]) _ { return date.split(/[ ]*[-/][ ]*/); }
VF = _ vf:$([VF]) _ { return vf; }

COMMA = _ "," _
SEMICOLON = _ ";" _
LBRACE = _ "{" _
RBRACE = _ "}" _
LBRACKET = _ "[" _
RBRACKET = _ "]" _
