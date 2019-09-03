Start-Transcript -Path c:\sp_install_log.txt

#################
#Disk Operations#
#################

$disk = get-disk | ? { $_.Size -eq "107374182400" -and $_.ProvisioningType -eq "Thin" }
Initialize-Disk $disk.Number
New-Partition -DiskNumber $disk.Number -UseMaximumSize -DriveLetter S
Get-Partition -DiskNumber $disk.Number | Format-Volume -FileSystem NTFS -Force -Confirm:$false -ErrorAction SilentlyContinue