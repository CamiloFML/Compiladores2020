::Arcivo .bat para correr lexer.flex
::Compiladores 2020 - maraya,  cmuñoz, fzabala.
@echo off
cd ..\analizadores
java  -Xmx128m -jar ../lib/jflex-1.6.1.jar lexico.flex
move *java ../src 
del *.java*
cd ..\bat