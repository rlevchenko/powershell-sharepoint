# PowerShell scripts to automate Sharepoint farm deployment

## Process
- step 1: Enable-PingResponse.ps1 - opens the necessary firewall ports before the deployment
- step 2: EnablePSExec.cmd - configures the UAC/PowerShell settings before the deployment
- step 3: spprep.ps1 - prepares the first SharePoint server, adds the requried SP service accounts
- step 4: spxml.ps1 - updates the AutoSPInstallerInput.xml with the right domain names
- step 5: AutoSPInstaller\AutoSPInstallerMain.ps1 - installs and configures the SharePoint Server with settings defined in the AutoSPInstallerInput.xml
- step 6: spprep2.ps1 prepares the second server in the farm
- repeats 1-5 steps on the second server

## Notes 
- Uses AutoSPInstaller as a core https://autospinstaller.com/
- SharePoint media files must be located in the S:\SP folder
- Navigate to https://autospinstaller.com/FarmConfiguration to change/check XML config files before the deployment
- Originally made for VMM templates. Tested with VMM 2016/Sharepoint 2013
- Thanks for commits and stars! Happy deployment!


