@ECHO OFF
REM **********************************************************************
REM ***                                                                ***
REM *** Script:  start_herc.bat                                        ***
REM ***                                                                ***
REM *** Purpose: Hercules startup for OS/VS2-MVS 3.8j                  ***
REM ***          (TK4- manual operations)                              ***
REM ***                                                                ***
REM *** Updated: 2013/11/18                                            ***
REM ***                                                                ***
REM **********************************************************************
setlocal
REM *
REM * set environment
REM *
SET ARCH=32
IF DEFINED ProgramFiles(x86) SET ARCH=64
REM *
REM * start Hercules
REM *
SET HERCULES_RC=scripts\tk4-.rc
SET TK4CONS=extcons
SET TK4CRLF=CRLF
.\hercules\windows\%ARCH%\hercules -f conf\tk4-.cnf >log/3033.log
