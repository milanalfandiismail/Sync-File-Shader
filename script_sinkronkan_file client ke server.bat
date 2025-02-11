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
set SERVER_PATH=\\%selected_ip%

echo Menggunakan IP server: %selected_ip%
echo Server path: %SERVER_PATH%
echo.

REM Mengambil nama komputer
set COMPUTER_NAME=%COMPUTERNAME%

REM Membuat folder baru dengan nama komputer dan subfolder yang diperlukan
set NEW_FOLDER=%SERVER_PATH%\%COMPUTER_NAME%
set NEW_FOLDER1=%NEW_FOLDER%\DxCache
set NEW_FOLDER2=%NEW_FOLDER%\DxcCache
set NEW_FOLDER3=%NEW_FOLDER%\D3DSCache
set NEW_FOLDER4=%NEW_FOLDER%\Delta_Force
set NEW_FOLDER5=%NEW_FOLDER%\Wuthering_Waves
set NEW_FOLDER6=%NEW_FOLDER%\Apex
set NEW_FOLDER7=%SERVER_PATH%\DataValorant

REM Memeriksa apakah folder tujuan sudah ada dan membuat folder baru jika tidak ada
if not exist %NEW_FOLDER% (
    echo Folder dengan nama %COMPUTER_NAME% tidak ditemukan, membuat folder baru...
    mkdir %NEW_FOLDER%  REM Membuat folder baru dengan nama komputer di network share
) else (
    echo Folder dengan nama %COMPUTER_NAME% sudah ada.
)

REM Membuat subfolder DxCache, DxcCache, dan D3DSCache jika tidak ada
if not exist %NEW_FOLDER1% (
    echo Membuat subfolder DxCache...
    mkdir %NEW_FOLDER1%
)

if not exist %NEW_FOLDER2% (
    echo Membuat subfolder DxcCache...
    mkdir %NEW_FOLDER2%
)

if not exist %NEW_FOLDER3% (
    echo Membuat subfolder D3DSCache...
    mkdir %NEW_FOLDER3%
)

if not exist %NEW_FOLDER4% (
    echo Membuat subfolder DeltaForce
    mkdir %NEW_FOLDER4%%
)

if not exist %NEW_FOLDER5% (
    echo Membuat subfolder Wuthering_Waves
    mkdir %NEW_FOLDER5%
)

if not exist %NEW_FOLDER6% (
    echo Membuat subfolder Apex
    mkdir %NEW_FOLDER6%
)

REM Menyalin file dari folder lokal ke folder jaringan untuk masing-masing subfolder
set SOURCE_DIR1=%localappdata%\AMD\DxCache
set SOURCE_DIR2=%localappdata%\AMD\DxcCache
set SOURCE_DIR3=%localappdata%\D3DSCache
set SOURCE_DIR4=G:\Steam\steamapps\common\Delta Force\Game\DeltaForce\Saved
set SOURCE_DIR5=G:\Wuthering Waves\Wuthering Waves Game\Client\Saved\PSO
set SOURCE_DIR6=%USERPROFILE%\Saved Games\Respawn\Apex\local
set SOURCE_DIR7=%localappdata%\VALORANT

REM Salin file dari DxCache ke folder tujuan
robocopy "%SOURCE_DIR1%" "%NEW_FOLDER1%" /E /Z /XO /W:0 /R:10

REM Salin file dari DxcCache ke folder tujuan
robocopy "%SOURCE_DIR2%" "%NEW_FOLDER2%" /E /Z /XO /W:0 /R:10

REM Salin file dari D3DSCache ke folder tujuan
robocopy "%SOURCE_DIR3%" "%NEW_FOLDER3%" /E /Z /XO /W:0 /R:10

REM Salin file Shader Delta Force
robocopy "%SOURCE_DIR4%" "%NEW_FOLDER4%" *.ushaderprecache /E /Z /XO /W:0 /R:10

REM Salin file shader Wuthering_Waves
robocopy "%SOURCE_DIR5%" "%NEW_FOLDER5%" /E /Z /XO /W:0 /R:10

REM Salin file shader Apex
robocopy "%SOURCE_DIR6%" "%NEW_FOLDER6%" *.pso /E /Z /XO /W:0 /R:10

REM Salin file cache valorant + setting
robocopy "%SOURCE_DIR7%" "%NEW_FOLDER7%" /E /Z /XO /W:0 /R:10 /XD "Logs" "CrashReportClient"

echo Transfer selesai.
