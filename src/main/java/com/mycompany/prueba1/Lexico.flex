/* Sección de declaraciones de JFlex */
package com.mycompany.prueba1;
%%
%public
%class AnalizadorLexico
%{
 
 /* Código personalizado */
 
 // Se agregó una propiedad para verificar si existen tokens pendientes
 private boolean _existenTokens = false;
 
 public boolean existenTokens(){
 return this._existenTokens;
 }
 
%}
 
 /* Al utilizar esta instrucción, se le indica a JFlex que devuelva objetos del tipo TokenPersonalizado */
%type TokenPersonalizado
 
%init{
 /* Código que se ejecutará en el constructor de la clase */
%init}
 
%eof{
 
 /* Código a ejecutar al finalizar el análisis, en este caso cambiaremos el valor de una variable bandera */
 this._existenTokens = false;
 
%eof}
 
/* Inicio de Expresiones regulares */
 Espacio = " "
 SaltoDeLinea = \n|\r|\r\n
 Identificador = "."(([A-Za-z]|"_"|".")+([A-Za-z0-9]|"_"|".")*)*
 Identificador1 = [A-Za-z]+([A-Za-z0-9]|"_"|".")*
 Error =  ~" "
/* Finaliza expresiones regulares */
 
%%
/* Finaliza la sección de declaraciones de JFlex */
 
/* Inicia sección de reglas */
 
// Cada regla está formada por una {expresión} espacio {código}
 
{Identificador} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "IDENTIFICADOR");
 this._existenTokens = true;
 return t;
}

{Identificador1} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "IDENTIFICADOR1_");
 this._existenTokens = true;
 return t;
}

 
{Espacio} {
 // Ignorar cuando se ingrese un espacio
}
 
{SaltoDeLinea} {
 TokenPersonalizado t = new TokenPersonalizado("Enter", "NUEVA_LINEA");
 this._existenTokens = true;
 return t;
}
{Error} {
 TokenPersonalizado t = new TokenPersonalizado("Error", "Error");
 this._existenTokens = true;
 return t;
}

