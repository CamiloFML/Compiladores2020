::Arcivo .bat para compilar Lex.java (generado por jflex)
::Compiladores 2020 - maraya,  cmu�oz, fzabala.
@echo off
cls
::cd ..
cd ..\src
echo "compilando..."
javac -classpath ..\lib\jansi.jar;..\lib\java-cup-11b.jar;..\lib\jflex-1.6.1.jar;. -d ..\build -nowarn *.java
echo "Listo!"
cd ..\bat