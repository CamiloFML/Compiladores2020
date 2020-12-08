@echo off
::Arcivo .bat para generar un archivo ejecutable jar, a partir de 
::los archivos .class generados anteriormente en el proceso de compilacion
::Compiladores 2016 - fgonzlez,  ahidalgo, robulloa.
cd ..\build
jar -cvfm Test.jar manifest.txt *.class
cd ..\bat