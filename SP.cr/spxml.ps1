<#
.Description
      Sharepoint XML configuration file must be updated 
      with the right domain names and netbios-name before deploying. 
      So, this "one-liner" helps to achieve it
.NOTES
       Name: SP XML
       Author : Roman Levchenko
       WebSite: www.rlevchenko.com
       Prerequisites: <none>
#>


$domain = (gwmi WIN32_ComputerSystem).Domain
$netbios = (Get-ADDomain -Identity (gwmi WIN32_ComputerSystem).Domain).NetBIOSName + "\"
$temp = Get-Content S:\SP\AutoSPInstaller\AutoSPInstallerInput.xml
$temp.replace("tenant.rlevchenko.com", "$domain") | set-content S:\SP\AutoSPInstaller\AutoSPInstallerInput.xml -force | Out-Null
$temp1 = Get-Content S:\SP\AutoSPInstaller\AutoSPInstallerInput.xml
$temp1.replace("TENANT\", "$netbios") | set-content S:\SP\AutoSPInstaller\AutoSPInstallerInput.xml -force | Out-Null