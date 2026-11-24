@echo off

setlocal
set PATH=bin;%PATH%

IF EXIST h2.z? del h2.z?
IF EXIST h2*.*zap del h2*.*zap

zilf -d -ci h2.zil -ip ..\zillib -ip ..\zillib\parser

zapf -ab h2.zap > h2_freq.xzap

del h2_freq.zap
zapf h2.zap

pause