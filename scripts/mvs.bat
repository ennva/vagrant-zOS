@ECHO OFF
REM **********************************************************************
REM ***                                                                ***
REM *** Script:  mvs.bat                                               ***
REM ***                                                                ***
REM *** Purpose: IPL OS/VS2-MVS 3.8j (TK4- unattended operations)      ***
REM ***                                                                ***
REM *** Updated: 2013/11/26                                            ***
REM ***                                                                ***
REM **********************************************************************
setlocal
REM *
REM * set environment
REM *
SET ARCH=32
IF DEFINED ProgramFiles(x86) SET ARCH=64
SET DAEMON=-d
IF NOT EXIST unattended\mode GOTO default
SET /P MODE=<unattended\mode
IF "x%MODE%" equ "xCONSOLE" SET DAEMON=
:default
REM *
REM * IPL OS/VS2-MVS 3.8j
REM *
SET HERCULES_RC=scripts\ipl.rc
SET TK4CRLF=CRLF
.\hercules\windows\%ARCH%\hercules %DAEMON% -f conf\tk4-.cnf >log/3033.log
