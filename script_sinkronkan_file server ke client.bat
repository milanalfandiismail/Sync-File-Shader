@echo off
setlocal enabledelayedexpansion

REM ========== BAGIAN DAFTAR IP YANG DIPILIH ==========
REM Edit IP-IP berikut sesuai dengan kebutuhan Anda
set ip1=10.10.10.10
set ip2=10.10.10.9
set ip3=10.10.10.8

REM Tentukan jumlah total IP yang tersedia
set IP_COUNT=3
REM ========== END BAGIAN DAFTAR IP ==========

REM ========== PEMILIHAN IP RANDOM ==========
set /a random_index=%RANDOM% %% %IP_COUNT% + 1
set selected_ip=!ip%random_index%!

REM ========== SET SERVER PATH ==========
set SERVER_PATH="\\%selected_ip%\%COMPUTERNAME%"

echo Menggunakan IP server: %selected_ip%
echo Server path: %SERVER_PATH%
echo.

REM Mengambil nama komputer (client)
set COMPUTER_NAME=%COMPUTERNAME%

REM Menentukan folder tujuan di client
set CLIENT_DX_CACHE=%localappdata%\AMD\DxCache
set CLIENT_DXC_CACHE=%localappdata%\AMD\DxcCache
set CLIENT_D3DS_CACHE=%localappdata%\D3DSCache
set CLIENT_DELTA_FORCE_CACHE="G:\Steam\steamapps\common\Delta Force\Game\DeltaForce\Saved"
set CLIENT_WUTHERING_WAVES_CACHE="G:\Wuthering Waves\Wuthering Waves Game\Client\Saved\PSO"
set CLIENT_APEX_CACHE="%USERPROFILE%\Saved Games\Respawn\Apex\local"

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

if not exist %CLIENT_DELTA_FORCE_CACHE% (
    echo Folder DeltaForce tidak ditemukan, membuat folder baru...
    mkdir %CLIENT_DELTA_FORCE_CACHE%
) else (
    echo Folder Delta Force Sudah ada.
)

if not exist %CLIENT_WUTHERING_WAVES_CACHE% (
    echo folder Wuthering_Waves tidak ditemukan, membuat folder baru...
    mkdir %CLIENT_WUTHERING_WAVES_CACHE%
) else (
    echo Folder Wuthering_Waves sudah ada
)

if not exist %CLIENT_APEX_CACHE% (
    echo folder Apex tidak ditemukan, membuat folder baru...
    mkdir %CLIENT_APEX_CACHE%
) else (
    echo Folder Apex sudah ada
)

REM Menyalin file dari folder server ke client
set SERVER_DX_CACHE=%SERVER_PATH%\DxCache
set SERVER_DXC_CACHE=%SERVER_PATH%\DxcCache
set SERVER_D3DS_CACHE=%SERVER_PATH%\D3DSCache
set SERVER_DELTA_FORCE_CACHE=%SERVER_PATH%\Delta_Force
set SERVER_WUTHERING_WAVES_CACHE=%SERVER_PATH%\Wuthering_Waves
set SERVER_APEX_CACHE=%SERVER_PATH%\Apex


REM Salin file dari DxCache di server ke folder DxCache di client
robocopy %SERVER_DX_CACHE% %CLIENT_DX_CACHE% /E /Z /XO /W:5

REM Salin file dari DxcCache di server ke folder DxcCache di client
robocopy %SERVER_DXC_CACHE% %CLIENT_DXC_CACHE% /E /Z /XO /W:5

REM Salin file dari D3DSCache di server ke folder D3DSCache di client
robocopy %SERVER_D3DS_CACHE% %CLIENT_D3DS_CACHE% /E /Z /XO /W:5

REM Salin file DeltaForce Shader
robocopy %SERVER_DELTA_FORCE_CACHE% %CLIENT_DELTA_FORCE_CACHE% *.ushaderprecache /E /Z /XO /W:5

REM Salin file Wuthering_Waves Shader
robocopy %SERVER_WUTHERING_WAVES_CACHE% %CLIENT_WUTHERING_WAVES_CACHE% /E /Z /XO /W:5

REM Salin file Apex Shader
robocopy %SERVER_APEX_CACHE% %CLIENT_APEX_CACHE% *.pso /E /Z /XO /W:5

echo Transfer selesai.


