@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
if exist "%programdata%\ElmoCutSetup" rmdir /s /q "%programdata%\ElmoCutSetup"
md "%programdata%\ElmoCutSetup"
powershell -command "$wc = New-Object net.webclient; $wc.Downloadfile('https://www.dropbox.com/scl/fi/uy7ugs2oh3fybb03wkhul/Visual-C-Runtimes-All-in-One.zip?rlkey=qfogb9xiubv108349l1vn5lxe&dl=1', '%programdata%\ElmoCutSetup\Visual-C-Runtimes-All-in-One.zip')"
powershell -command "Expand-Archive '%programdata%\ElmoCutSetup\Visual-C-Runtimes-All-in-One.zip' -DestinationPath '%programdata%\ElmoCutSetup'"
powershell -command "Start-BitsTransfer -Source 'https://nmap.org/npcap/dist/npcap-1.10.exe' -Destination '%programdata%\ElmoCutSetup\npcap-1.10.exe'"
powershell -command "Invoke-RestMethod -Uri 'https://sourceforge.net/projects/elmocut/best_release.json' | ForEach-Object { $Path = ($_.release | Where-Object { $_.filename -like '*.exe' }).filename; Start-BitsTransfer -Source ('https://yer.dl.sourceforge.net/project/elmocut/' + $Path) -Destination '%programdata%\ElmoCutSetup\elmoCut.exe' }"
start /w /min cmd /c "%programdata%\ElmoCutSetup\npcap-1.10.exe"
start /w /min cmd /c "%programdata%\ElmoCutSetup\install_all.bat"
start /w /min cmd /c "%programdata%\ElmoCutSetup\elmoCut.exe"
rmdir /s /q "%programdata%\ElmoCutSetup"
echo Installation has been completed.
pause
