Configuration InstallAzureRM
{

    Import-DSCResource -ModuleName OneGetPackage

    OneGetPackage AzureRM
    {
        Name = 'AzureRM'
        Ensure = 'Present'
    }
}

$MOFPath = 'C:\MOF'
If (!(Test-Path $MOFPath)){New-Item -Path $MOFPath -ItemType Directory}
InstallAzureRM -OutputPath $MOFPath
Start-DscConfiguration -Path $MOFPath -Wait -Force -Verbose