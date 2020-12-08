::Arcivo .bat para correr parser.cup
::Compiladores 2016 - fgonzlez,  ahidalgo, robulloa.
::-expect X significa que después de X advertencias no se generará nada y se lanzará error
@echo off
cd ..\analizadores
java  -Xmx128m -jar ../lib/java-cup-11b.jar -expect 5 -nowarn sintactico.cup
move *java ..\src 
del *.java*
cd ..\bat