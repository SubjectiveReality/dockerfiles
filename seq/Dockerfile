FROM microsoft/windowsservercore
ARG VERSION
ENV SEQ_VERSION $VERSION

LABEL Description="Seq Event Server" Vendor="Datalust" Version="$CONT_IMG_VER"

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

RUN Invoke-WebRequest $('https://getseq.net/Download/Begin?version={0}' -f $env:SEQ_VERSION) -OutFile c:\seq-installer.msi -UseBasicParsing ; \
    Start-Process msiexec.exe -ArgumentList '/i c:\seq-installer.msi /quiet /norestart' -Wait ; \
    Remove-Item c:\seq-installer.msi -Force 

RUN seq install

CMD Start-Service seq ; \
    Write-Host Seq Event Server started... ; \
    Get-NetAdapter | Get-NetIPAddress | ? AddressFamily -EQ 'IPv4' | select -ExpandProperty IPAddress ; \
    while ($true) { Start-Sleep -Seconds 3600 }

EXPOSE 5341
