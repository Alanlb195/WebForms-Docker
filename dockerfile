FROM mcr.microsoft.com/windows/servercore:1809


SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

# Dependencies
WORKDIR /powershell_scripts

COPY ./powershell_scripts .


# IIS and additional features
RUN .\Install-IIS.ps1 -Verbose


# Crystal Report Runtime
RUN .\Install-CrystalReports.ps1 -Verbose


# Remove default iis website
RUN .\Installation_clean.ps1 -Verbose

# Move the application to wwwroot
WORKDIR /inetpub/wwwroot
COPY ./app .

EXPOSE 80

# start IIS service
CMD ["powershell", "-Command", "Start-Service w3svc; while ($true) { Start-Sleep -Seconds 3600 }"]

