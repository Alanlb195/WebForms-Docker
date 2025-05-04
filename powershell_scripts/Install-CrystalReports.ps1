<#
.Synopsis
Download and install Crystal Reports runtime for .NET framework

.Link
https://origin.softwaredownloads.sap.com/public/file/0020000000195602021

.Link
https://powershellexplained.com/2016-10-21-powershell-installing-msi-files/
#>

[CmdletBinding()]
param ()

# Ruta donde se encuentra el archivo local
$localFilePath = "C:\powershell_scripts\install\CR13SP30MSI64_0-10010309.msi"

# Ruta de descarga en caso de que el archivo no exista
$destinationPath = "$env:USERPROFILE\Downloads\CrystalReportsRuntimeInstaller.msi"

# Si el archivo MSI ya existe localmente, se usará; si no, se descargará
if (Test-Path $localFilePath) {
    Write-Verbose "Found local installer at $localFilePath"
    $installerPath = $localFilePath
} else {
    # Si no está disponible localmente, descargar de internet
    $sourceUri = 'https://origin.softwaredownloads.sap.com/public/file/0020000000195602021'
    
    Write-Verbose 'Local installer not found. Downloading from the internet...'
    Invoke-WebRequest -Uri $sourceUri -OutFile $destinationPath

    # Usar el archivo descargado
    $installerPath = $destinationPath
}

# Instalar el archivo MSI
Write-Verbose "Installing library from $installerPath..."
Start-Process msiexec.exe -Wait -NoNewWindow -ArgumentList "/i $installerPath /quiet /qn /norestart /l*v install.log"

# Si descarga el archivo, se elimina para ahorrar espacio
if ($installerPath -eq $destinationPath) {
    Write-Verbose "Removing downloaded installer..."
    Remove-Item -Path $destinationPath
}
else {
    Write-Verbose "Removing local installer..."
    Remove-Item -Path $localFilePath
}
