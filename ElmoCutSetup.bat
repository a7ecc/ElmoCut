@echo off
powershell Invoke-WebRequest https://nmap.org/npcap/dist/npcap-1.10.exe -o npcap-1.10.exe
powershell Invoke-WebRequest https://liquidtelecom.dl.sourceforge.net/project/elmocut/1.0.7/elmoCut.1.0.7.x64.exe -o elmoCut.1.0.7.x64.exe
powershell Invoke-WebRequest https://www.python.org/ftp/python/3.10.2/python-3.10.2-amd64.exe -o python-3.10.2-amd64.exe
timeout 3
npcap-1.10.exe
timeout 3
python-3.10.2-amd64.exe
timeout 3
elmoCut.1.0.7.x64.exe
timeout 3
del npcap-1.10.exe
del python-3.10.2-amd64.exe
del elmoCut.1.0.7.x64.exe
