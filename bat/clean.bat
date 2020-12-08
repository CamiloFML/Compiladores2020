::Arcivo .bat para limpiar la carpeta
::Compiladores 2016 - fgonzlez,  ahidalgo, robulloa.
@echo off
cls
echo "limpiando residuos"
::cd ..
cd ..\src
del Lexer.jav*
del parser.jav*
del sym.jav*
cd ..\build
del *.class
del *.jar
cd ..\bat
echo "limpieza terminada"