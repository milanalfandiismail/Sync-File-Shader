@echo off
:loop
REM Memutuskan semua sesi yang terhubung ke server
net session /delete /y 

echo Semua sesi telah diputuskan.

