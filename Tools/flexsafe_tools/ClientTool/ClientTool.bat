::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFAhASQ2MKm60OpEZ++Pv4Pq7tkISWPEAKd2DyqyxcbJDvxe1I6ko12lDkcgDAlVWewblZww7yQ==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFAhASQ2MKm60OpEZ++Pv4Pq7gUEUUewrTIDU1vqLOOVz
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title Windows Client Tester Tool
mode con cols=110 lines=30
color 2F

rem ����ͬ��Ŀ¼b0
call:generateUserDir
:generateUserDir
if exist b0 (
   echo "�Ѿ������ļ���b0"
) else (
md b0
)


:top
cls
echo ***************************ע�⣺��������ִ�й����о���ֱ�ӻ�ر�Windows Client************************
echo ***************************ע�⣺���������־��������7z���򣺡�C:\Program Files\7-Zip��****************
echo.
echo ------------------------------------------------------------------------------------------------------
echo.
echo 1. ɾ��boxsafe����-------------------��ա�C:\ProgramData\boxsafe��Ŀ¼
echo.
echo 2. ɾ���û�����----------------------��ոó�������Ŀ¼����Ϊ��b0����Ŀ¼����b0������ͬ��Ŀ¼
echo.
echo 3. ɾ��Boxsafe Log-------------------ɾ����C:\ProgramData\boxsafe��Ŀ¼������Log�����ڻ�ȡ��Ϊ��׼��Log
echo.
echo 4. �ռ�Boxsafe Log-------------------�����C:\ProgramData\boxsafe��Ŀ¼�������ڸó���boxsafeLogsĿ¼
echo.
echo 5. ���û�Ŀ¼�µ�boxsafeĿ¼-------���û�Ŀ¼�µġ�boxsafe��Ŀ¼
echo.
echo 6. ɾ���û�Ŀ¼�µ�boxsafeĿ¼-------ɾ���û�Ŀ¼�µġ�boxsafe���������ļ�
echo.
echo ------------------------------------------------------------------------------------------------------

set /p a=��ѡ��Ҫִ�еĲ�����

if %a% EQU 1 (call:delBoxsafeData)
if %a% EQU 2 (call:delRootData)
if %a% EQU 3 (call:clearLogs)
if %a% EQU 4 (call:collectLogs)
if %a% EQU 5 (call:openUserBoxsafeFolder)
if %a% EQU 6 (call:delUserBoxsafeFolder)
goto top

rem �رտͻ���
:stopApp
echo ���ڹرտͻ���...
taskkill /f /im Flexsafe.exe
taskkill /f /im Boxsafe.exe
GOTO:EOF

rem ɾ���û�����
:delRootData
call:stopApp
SET user_root_dir=b0
del /q /s %user_root_dir%\*.*
for /f "delims=" %%a in ('dir /ad/b/s %user_root_dir%') do (rd /q /s "%%a")>nul
pause
GOTO:EOF

rem ɾ��boxsafe����
:delBoxsafeData
call:stopApp
SET boxsafe_dir=C:\ProgramData\boxsafe
del /q /s %boxsafe_dir%\*.*
for /f "delims=" %%a in ('dir /ad/b/s %boxsafe_dir%') do (rd /q /s "%%a")>nul
pause
GOTO:EOF

rem ɾ��Log
:clearLogs
call:stopApp
SET log_dir=C:\ProgramData\boxsafe\logs
del /q /s %log_dir%\*.*
del /q /s C:\ProgramData\boxsafe\*.log
pause
GOTO:EOF

rem �ռ�Log
:collectLogs
call:stopApp
set zip=C:\Program Files\7-Zip\7z.exe
set ymd=%date:~0,4%%date:~5,2%%date:~8,2%
set hms=%time:~0,2%%time:~3,2%%time:~6,2%
set dt=%ymd%%hms%
set /p zip_name=������Logѹ���ļ�����
set dir=C:\ProgramData\boxsafe
echo "%zip%" 
echo "%dir%"
echo "%dt%-%zip_name%"
if exist boxsafeLogs (
   echo "�Ѿ������ļ���boxsafeLogs"
) else (
md boxsafeLogs
)
"%zip%" a boxsafeLogs\%dt%-%zip_name%.7z "%dir%"
pause
GOTO:EOF

rem ���û�Ŀ¼�µ�boxsafeĿ¼
:openUserBoxsafeFolder
if exist "%appdata%\..\Local\VirtualStore\ProgramData\boxsafe" (
   start ""  "%appdata%\..\Local\VirtualStore\ProgramData\boxsafe"
) else (
   echo δ�ҵ��û�Ŀ¼�µ�boxsafeĿ¼�����ֶ�����
)
pause
GOTO:EOF

rem �û�Ŀ¼�µ�boxsafeĿ¼
:delUserBoxsafeFolder
call:stopApp
if exist "%appdata%\..\Local\VirtualStore\ProgramData\boxsafe" (
   del /q /s %appdata%\..\Local\VirtualStore\ProgramData\boxsafe\*.*
   for /f "delims=" %%a in ('dir /ad/b/s %appdata%\..\Local\VirtualStore\ProgramData\boxsafe') do (rd /q /s "%%a")>nul
) else (
   echo δ�ҵ��û�Ŀ¼�µ�boxsafeĿ¼�����ֶ�����  
)
pause
GOTO:EOF
