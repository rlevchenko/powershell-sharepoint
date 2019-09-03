REM echo off

:: Force PowerShell execution policy to RemoteSigned
REG ADD HKLM\Software\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell /v ExecutionPolicy /t REG_SZ /d "RemoteSigned" /f

:: Disable UAC prompt for Admins
REG ADD HKLM\Software\Microsoft\Windows\CurrentVersion\policies\system /v EnableLUA /t REG_DWORD /d 0 /f
