@echo off
setlocal EnableDelayedExpansion
for /F "tokens=1* eol=/ usebackq delims==" %%A IN (%~dp0conf/parser.properties) DO (set %%A=%%B)
::set args=--regular false http://ircm-srv.mnsk.rw/ASFKI_XML/TELEJKA.xml.xz
::DB2 CONNECT TO %database% USER %user% USING %password%
::if errorlevel = 1 goto conerror
"%jre_path%\bin\java.exe" -Dlog4j.configuration=file:conf/log4j.properties -jar asfk_parser.jar %args%
goto end
:conerror

::@echo  ERROR - Could not connect to Database. Check connection details configuration in conf/parser.properties
::@echo  ERROR - Could not connect to Database. Check connection details configuration in conf/parser.properties >> logs/asfki_parser.log 
goto end
:end
