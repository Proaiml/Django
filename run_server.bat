@echo off
setlocal
cd /d "%~dp0"
title Django Web Sitesi - mywebsite

echo ===================================================
echo    DJANGO WEB PROJESI - ILHAN KOCASLAN
echo ===================================================
echo.

where py >nul 2>&1
if %errorlevel%==0 (
    set "PY=py -3"
) else (
    where python >nul 2>&1
    if %errorlevel% neq 0 (
        echo [HATA] Python bulunamadi. Lutfen Python 3.8+ kurup PATH'e ekleyin.
        pause
        exit /b 1
    )
    set "PY=python"
)

echo [1/3] Django kontrol ediliyor...
%PY% -c "import django; print('Django Surumu:', django.get_version())" >nul 2>&1
if %errorlevel% neq 0 (
    echo Django yuklu degil. Kuruluyor...
    %PY% -m pip install -r requirements.txt
    if %errorlevel% neq 0 (
        echo [HATA] Django yuklenemedi.
        pause
        exit /b 1
    )
)

echo [2/3] Proje sistem kontrolleri calistiriliyor...
%PY% jang\manage.py check
if %errorlevel% neq 0 (
    echo [HATA] Sistem kontrolleri basarisiz.
    pause
    exit /b 1
)

echo [3/3] Gelistirme sunucusu baslatiliyor...
echo.
echo Tarayiciniz aciliyor: http://127.0.0.1:8000
echo Sunucuyu durdurmak icin CTRL+C basin.
echo.

start "" "http://127.0.0.1:8000"

%PY% jang\manage.py runserver 127.0.0.1:8000

pause
endlocal
