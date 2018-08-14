@echo off
set "startTime=%time%"
REM magick *.jpg[1280x720] thumbnail%03d.png
start magick mogrify -resize 1280x720 0-*.jpg
start magick mogrify -resize 1280x720 1-*.jpg
start magick mogrify -resize 1280x720 2-*.jpg
start magick mogrify -resize 1280x720 3-*.jpg
start magick mogrify -resize 1280x720 4-*.jpg
start magick mogrify -resize 1280x720 5-*.jpg
start magick mogrify -resize 1280x720 6-*.jpg
start magick mogrify -resize 1280x720 7-*.jpg
start magick mogrify -resize 1280x720 8-*.jpg
start magick mogrify -resize 1280x720 9-*.jpg
start magick mogrify -resize 1280x720 10-*.jpg
start magick mogrify -resize 1280x720 11-*.jpg
start magick mogrify -resize 1280x720 12-*.jpg
start magick mogrify -resize 1280x720 13-*.jpg
:LOOP
tasklist /FI "IMAGENAME eq magick.exe" 2>NUL | find /I /N "magick.exe">NUL
if %ERRORLEVEL%==0 (
    ping localhost -n 2 >nul
    GOTO LOOP
)

set "stopTime=%time%"
call :timeDiff diff startTime stopTime
echo %diff% milli seconds
goto :eof

:timeDiff
setlocal
call :timeToMS time1 "%~2"
call :timeToMS time2 "%~3"
set /a diff=time2-time1
(
  ENDLOCAL
  set "%~1=%diff%"
  goto :eof
)

:timeToMS
::### WARNING, enclose the time in " ", because it can contain comma seperators
SETLOCAL EnableDelayedExpansion
FOR /F "tokens=1,2,3,4 delims=:,.^ " %%a IN ("!%~2!") DO (
  set /a "ms=(((30%%a%%100)*60+7%%b)*60+3%%c-42300)*1000+(1%%d0 %% 1000)"
)
(
  ENDLOCAL
  set %~1=%ms%
  goto :eof
)