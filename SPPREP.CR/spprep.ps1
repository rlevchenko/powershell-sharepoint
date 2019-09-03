Start-Transcript -Path c:\sp_install_log.txt

#Pass for services
$spass = $args[0] #VMM argument
$svcsecpass = convertto-securestring $spass -asplaintext -force

#################
#Disk Operations#
#################

$disk = get-disk | ? { $_.Size -eq "107374182400" -and $_.ProvisioningType -eq "Thin" }
Initialize-Disk $disk.Number
New-Partition -DiskNumber $disk.Number -UseMaximumSize -DriveLetter S
Get-Partition -DiskNumber $disk.Number | Format-Volume -FileSystem NTFS -Force -Confirm:$false -ErrorAction SilentlyContinue

New-ADUser -Name SP_Farm -AccountPassword $svcsecpass -PasswordNeverExpires $true -Enabled $true
New-ADUser -Name SP_CacheSuperUser -AccountPassword $svcsecpass -PasswordNeverExpires $true -Enabled $true
New-ADUser -Name SP_CacheSuperReader -AccountPassword $svcsecpass -PasswordNeverExpires $true -Enabled $true
New-ADUser -Name SP_Services -AccountPassword $svcsecpass -PasswordNeverExpires $true -Enabled $true
New-ADUser -Name SP_PortalAppPool -AccountPassword $svcsecpass -PasswordNeverExpires $true -Enabled $true
New-ADUser -Name SP_ProfilesAppPool -AccountPassword $svcsecpass -PasswordNeverExpires $true -Enabled $true
New-ADUser -Name SP_SearchService -AccountPassword $svcsecpass -PasswordNeverExpires $true -Enabled $true
New-ADUser -Name SP_SearchContent -AccountPassword $svcsecpass -PasswordNeverExpires $true -Enabled $true
New-ADUser -Name SP_ProfileSync -AccountPassword $svcsecpass -PasswordNeverExpires $true -Enabled $true
