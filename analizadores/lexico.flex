//---- [1] PRIMERA SECCION 'Usercode' ----
import java_cup.runtime.*;
import java.io.Reader;

//---- [2] SEGUNDA SECCION 'Opciones y declaraciones'----
%%
%class Lexer //nombre de la clase a generar
%unicode //soporte con caracteres unicode
%line //usar un contador de linea que se esta analizando (variable yyline)
%column //usar un contador de columna que se este analizando (yycolumn)
%cup // integrar CUP
%ignorecase //no diferenciar de mayusculas y minusculas
//codigo de usuario

%{   
     StringBuffer string = new StringBuffer();//"string" vacío

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

//MACROS (definiciones de final de linea, espacio en blanco, numeros, id, etc)
LineTerm = \r|\n|\r\n
espacio = {LineTerm} | [ \t\f]
final_linea = \r|\n|\r\n
enter       =\n
espacio     = {final_linea} | [ \t\f]
num			= 0|[1-9][0-9]*
id 			= [L][0-9]*
Digit   = [0-9]+

StringCharacter = [^\r\n\"\\]
%state STRING

%%
// ---- [3] TERCERA SECCION 'Reglas Lexicas' ----

<YYINITIAL>{
	//simbolos de terminales y variables
	"("                	{return symbol(sym.LPAREN);							          }
  ")"                	{return symbol(sym.RPAREN);							          }
  "Partir"				      {return symbol(sym.PARTIR);							            }
  "iniciar"          {return symbol(sym.INICIAR);                     }
  "meter"            {return symbol(sym.METER);                       }
  "sacar"               {return symbol(sym.SACAR);                          }
  "mirar"                {return symbol(sym.MIRAR);                           }
  "dato"          {return symbol(sym.DATO);                     }
  "Finalizar"           {return symbol(sym.FINALIZAR);                     }
  {enter}             {return symbol(sym.ENTER);                        }
  {espacio}          	{/* NO HACER NADA*/									              }
  {num}				        {return symbol(sym.CONST, new Integer(yytext()));	}
  {id}                {return symbol(sym.ID, yytext());          	      }
  \"                  {yybegin(STRING); string.setLength(0);            }
}

//cuando se detecte un string hay que jugar con los estados 
<STRING> {
  \"                             {yybegin(YYINITIAL); return symbol(sym.TEXTO, string.toString()); }
  {StringCharacter}+             { string.append( yytext() ); }
  /* escape sequences */
  "\\b"                          { string.append( '\b' ); }
  "\\t"                          { string.append( '\t' ); }
  "\\n"                          { string.append( '\n' ); }
  "\\f"                          { string.append( '\f' ); }
  "\\r"                          { string.append( '\r' ); }
  "\\\""                         { string.append( '\"' ); }
  "\\'"                          { string.append( '\'' ); }
  "\\\\"                         { string.append( '\\' ); }
  \\[0-3]?{Digit}?{Digit}  { char val = (char) Integer.parseInt(yytext().substring(1),8);
                                   string.append( val ); }
  /* error cases */
  \\.                            { throw new RuntimeException("Illegal escape sequence \""+yytext()+"\""); }
  {LineTerm}               { throw new RuntimeException("Unterminated string at end of line"); }
}
[^]                 { throw new Error("Caracter no permitido <"+yytext()+">"); }