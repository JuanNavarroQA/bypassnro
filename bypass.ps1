# Contenido de JuanNavarroQA/bypassnro/bypass.ps1

# 1. DESCARGAR EL ARCHIVO UNATTEND.XML PERSONALIZADO
# Usamos -ErrorAction Stop para forzar la detención si falla la descarga (ej. URL incorrecta, sin internet)
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/JuanNavarroQA/bypassnro/main/unattend.xml" -OutFile "C:\Windows\Panther\unattend.xml" -ErrorAction Stop

# 2. EJECUTAR SYSPREP SOLO SI LA DESCARGA FUE EXITOSA
# Si la línea anterior falló, PowerShell se detendrá y esta línea no se ejecutará.
& "$env:WINDIR\System32\Sysprep\Sysprep.exe" /oobe /unattend:"C:\Windows\Panther\unattend.xml" /reboot
