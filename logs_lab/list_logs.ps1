# list_logs.ps1

param(
   [string]$Source = ".\sample",
   [string]$Destination = ".\logs_archive"
)

$ErrorActionPreference = "Stop"

if (!(Test-Path $Destination)) { New-Item -ItemType Directory -Path $Destination | Out-Null }


# copy only .log files
Get-ChildItem -Path $Source -Filter *.log -File -Recurse | Copy-Item -Destination $Destination -Force

# count copied logs
$Count = (Get-ChildItem -Path $Destination -Filter *.log -File -Recurse).Count
Write-Host "Archived $Count log file(s) from '$Source' to '$Destination'"