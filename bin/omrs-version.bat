@echo off

rem Make sure we can set environment variables
if "%OS%" == "Windows_NT" setlocal enableextensions enabledelayedexpansion

rem ######
rem Lets find out if user is checking for help command
rem ######

if /I "%1"=="help" goto displayhelp
if /I "%1"=="-help" goto displayhelp
if /I "%1"=="--help" goto displayhelp
if /I "%1"=="/help" goto displayhelp
if /I "%1"=="-?" goto displayhelp
if /I "%1"=="/?" goto displayhelp
if /I "%1"=="/h" goto displayhelp
if /I "%1"=="-h" goto displayhelp

goto continue

:displayhelp
echo.
echo Usage: omrs-version [options]
echo.
echo Displays version and runtime information for the OpenMRS Module SDK.
goto finish

:continue
rem ######
rem Get SDK path
rem ######

set PROGDIR=%~dp0
set CURRENTDIR=%cd%
cd /d %PROGDIR%..
set SDK_HOME=%cd%
cd /d %CURRENTDIR%

rem ######
rem get maven location
rem ######

set MVN_HOME=%SDK_HOME%\apache-maven
set MVN_EXEC="%MVN_HOME%\bin\mvn.bat"
set SDK_VERSION="1.0.1"

echo.
echo OMRS Version:    %SDK_VERSION%
echo OMRS Home:       %SDK_HOME%
echo ORMS Scripts:    %SDK_HOME%\bin
echo OMRS Maven Home: %MVN_HOME%
echo --------

rem ######
rem Executing maven
rem ######
echo Executing: %MVN_EXEC% --version
%MVN_EXEC% --version

:finish




