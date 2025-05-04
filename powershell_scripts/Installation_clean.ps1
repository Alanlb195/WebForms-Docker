<#
.Synopsis
Clean residual files of the installation

#>
[CmdletBinding()]
param ()


Write-Verbose "Removing Default Web Site files..."
Remove-Item -Recurse C:\inetpub\wwwroot\*
