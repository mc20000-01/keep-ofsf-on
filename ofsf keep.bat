@echo off
REM =============================
REM Fetch JSON from URL every 5 minutes
REM =============================

:loop
echo [%date% %time%] Fetching JSON data...

REM --- Fetch JSON using PowerShell and store in a variable ---
for /f "usebackq delims=" %%i in (`powershell -Command "Invoke-RestMethod -Uri 'https://ofsf-server-mc20000.onrender.com/files/main' | ConvertTo-Json -Compress"`) do set "jsonData=%%i"

echo JSON data fetched:
echo %jsonData%

REM --- Wait 5 minutes ---
timeout /t 300 /nobreak >nul

goto loop
