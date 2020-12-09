::Arcivo .bat para ejecutar lo compilado
::Compiladores 2020 - maraya,  cmuñoz, fzabala.
@echo off
cls
::cd ..
cd ..\build
java -cp ..\lib\jansi.jar;..\lib\java-cup-11b.jar;..\lib\jflex-1.6.1.jar;. Test
cd ..\bat
echo "Ejecucion finalizada."
PAUSE