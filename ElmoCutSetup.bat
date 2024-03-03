@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
if exist "%programdata%\ElmoCutSetup" rmdir /s /q "%programdata%\ElmoCutSetup"
md "%programdata%\ElmoCutSetup"
powershell -command "Start-BitsTransfer -Source 'https://us3-dl.techpowerup.com/files/6Aiz15SKfZzbgMntuRw7Pw/1709505123/Visual-C-Runtimes-All-in-One-Feb-2024.zip' -Destination '%programdata%\ElmoCutSetup\Visual-C-Runtimes-All-in-One-Feb-2024.zip'"
powershell -command "Expand-Archive '%programdata%\ElmoCutSetup\Visual-C-Runtimes-All-in-One-Feb-2024.zip' -DestinationPath '%programdata%\ElmoCutSetup'"
powershell -command "Start-BitsTransfer -Source 'https://nmap.org/npcap/dist/npcap-1.10.exe' -Destination '%programdata%\ElmoCutSetup\npcap-1.10.exe'"
powershell -command "Invoke-RestMethod -Uri 'https://sourceforge.net/projects/elmocut/best_release.json' | ForEach-Object { $Path = ($_.release | Where-Object { $_.filename -like '*.exe' }).filename; Start-BitsTransfer -Source ('https://yer.dl.sourceforge.net/project/elmocut/' + $Path) -Destination '%programdata%\ElmoCutSetup\elmoCut.exe' }"
start /w /min cmd /c "%programdata%\ElmoCutSetup\npcap-1.10.exe"
start /w /min cmd /c "%programdata%\ElmoCutSetup\install_all.bat"
start /w /min cmd /c "%programdata%\ElmoCutSetup\elmoCut.exe"
rmdir /s /q "%programdata%\ElmoCutSetup"
echo Installation has been completed.
pause