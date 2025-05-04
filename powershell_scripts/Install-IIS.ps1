<#
.Synopsis
Install IIS and additional characteristics for ASP.NET

#>
[CmdletBinding()]
param ()


Write-Verbose "Installing features for IIS..."
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole, IIS-WebServer, IIS-ManagementScriptingTools, IIS-ApplicationInit, IIS-NetFxExtensibility45, IIS-ASPNET45 -All

Write-Host "IIS successfully Enabled."
