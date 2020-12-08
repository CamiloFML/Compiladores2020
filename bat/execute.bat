::Arcivo .bat para ejecutar lo compilado
::Compiladores 2016 - fgonzlez,  ahidalgo, robulloa.
@echo off
cls
::cd ..
cd ..\build
java -cp ..\lib\jansi.jar;..\lib\java-cup-11b.jar;..\lib\jflex-1.6.1.jar;. Test
cd ..\bat
echo "Ejecucion finalizada."
PAUSE