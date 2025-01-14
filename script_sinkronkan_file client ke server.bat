@echo off
REM Ganti dengan path folder jaringan tujuan
set NETWORK_PATH="\\MILANGAMECENTER"  

REM Mengambil nama komputer
set COMPUTER_NAME=%COMPUTERNAME%

REM Membuat folder baru dengan nama komputer dan subfolder yang diperlukan
set NEW_FOLDER=\\MILANGAMECENTER\%COMPUTER_NAME%
set NEW_FOLDER1=%NEW_FOLDER%\DxCache
set NEW_FOLDER2=%NEW_FOLDER%\DxcCache
set NEW_FOLDER3=%NEW_FOLDER%\D3DSCache
set NEW_FOLDER4=%NEW_FOLDER%\Delta_Force

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

REM Menyalin file dari folder lokal ke folder jaringan untuk masing-masing subfolder
set SOURCE_DIR1=%localappdata%\AMD\DxCache
set SOURCE_DIR2=%localappdata%\AMD\DxcCache
set SOURCE_DIR3=%localappdata%\D3DSCache
set SOURCE_DIR4=G:\Steam\steamapps\common\Delta Force\Game\DeltaForce\Saved


REM Salin file dari DxCache ke folder tujuan
robocopy "%SOURCE_DIR1%" "%NEW_FOLDER1%" /E /Z /XO

REM Salin file dari DxcCache ke folder tujuan
robocopy "%SOURCE_DIR2%" "%NEW_FOLDER2%" /E /Z /XO

REM Salin file dari D3DSCache ke folder tujuan
robocopy "%SOURCE_DIR3%" "%NEW_FOLDER3%" /E /Z /XO

REM Salin file dari Delta_Force ke folder tujuan
robocopy "%SOURCE_DIR4%" "%NEW_FOLDER4%" /E /Z /XO

echo Transfer selesai.

