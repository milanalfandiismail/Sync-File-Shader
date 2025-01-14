@echo off
REM Ganti dengan path folder jaringan sumber (server)
set SERVER_PATH="\\MILANGAMECENTER\%COMPUTERNAME%"

REM Mengambil nama komputer (client)
set COMPUTER_NAME=%COMPUTERNAME%

REM Menentukan folder tujuan di client
set CLIENT_DX_CACHE=%localappdata%\AMD\DxCache
set CLIENT_DXC_CACHE=%localappdata%\AMD\DxcCache
set CLIENT_D3DS_CACHE=%localappdata%\D3DSCache
set CLIENT_DELTA_FORCE_CACHE=G:\Steam\steamapps\common\Delta Force\Game\DeltaForce\Saved

REM Memeriksa apakah folder tujuan di client sudah ada, jika tidak, buat folder
if not exist %CLIENT_DX_CACHE% (
    echo Folder DxCache tidak ditemukan, membuat folder baru...
    mkdir %CLIENT_DX_CACHE%
) else (
    echo Folder DxCache sudah ada.
)

if not exist %CLIENT_DXC_CACHE% (
    echo Folder DxcCache tidak ditemukan, membuat folder baru...
    mkdir %CLIENT_DXC_CACHE%
) else (
    echo Folder DxcCache sudah ada.
)

if not exist %CLIENT_D3DS_CACHE% (
    echo Folder D3DSCache tidak ditemukan, membuat folder baru...
    mkdir %CLIENT_D3DS_CACHE%
) else (
    echo Folder D3DSCache sudah ada.
)

if not exit %CLIENT_DELTA_FORCE_CACHE% (
    echo Folder DeltaForce tidak ditemukan, membuat folder baru...
    mkdir %CLIENT_DELTA_FORCE_CACHE%
) else(
    echo Folder Delta Force Sudah ada.
)

REM Menyalin file dari folder server ke client
set SERVER_DX_CACHE=%SERVER_PATH%\DxCache
set SERVER_DXC_CACHE=%SERVER_PATH%\DxcCache
set SERVER_D3DS_CACHE=%SERVER_PATH%\D3DSCache
set SERVER_DELTA_FORCE_CACHE=%SERVER_PATH%\Delta_Force


REM Salin file dari DxCache di server ke folder DxCache di client
robocopy %SERVER_DX_CACHE% %CLIENT_DX_CACHE% /E /Z /XO

REM Salin file dari DxcCache di server ke folder DxcCache di client
robocopy %SERVER_DXC_CACHE% %CLIENT_DXC_CACHE% /E /Z /XO

REM Salin file dari D3DSCache di server ke folder D3DSCache di client
robocopy %SERVER_D3DS_CACHE% %CLIENT_D3DS_CACHE% /E /Z /XO

REM Salin file dari Delta_Force Cache di server ke folder Delta_Force_cache di client
robocopy %SERVER_DELTA_FORCE_CACHE% %CLIENT_DELTA_FORCE_CACHE%" /E /Z /XO

echo Transfer selesai.


