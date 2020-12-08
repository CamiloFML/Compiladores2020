::Arcivo .bat para correr lexer.flex
::Compiladores 2016 - fgonzlez,  ahidalgo, robulloa.
@echo off
cd ..\analizadores
java  -Xmx128m -jar ../lib/jflex-1.6.1.jar lexico.flex
move *java ../src 
del *.java*
cd ..\bat