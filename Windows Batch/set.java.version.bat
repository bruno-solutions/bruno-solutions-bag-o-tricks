@echo off
cls

if [] equ [%1] goto usage

:: select the Java path that corresponds to the desired Java version
if [8] equ [%1] ( 
	set JAVA_HOME=P:\Java\jdk1.8.0_202
	goto set
)
if [11] equ [%1] (
	set JAVA_HOME=P:\Java\jdk-11.0.12
	goto set
)

:usage
echo Specify 8 or 11 to set the Java version
exit /b

:set
:: set the Java environment variables
set path=%JAVA_HOME%\bin;%path%

:: display environment variables
echo PATH=%path%
echo JAVA_HOME=%JAVA_HOME%
