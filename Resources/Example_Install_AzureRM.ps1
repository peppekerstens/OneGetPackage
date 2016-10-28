Configuration InstallAzureRM
{

    Import-DSCResource -ModuleName OneGetPackage

    OneGetPackageProvider NuGet
    {
        Name = 'NuGet'
    }

    OneGetPackage AzureRM
    {
        Name = 'AzureRM'
        Ensure = 'Present'
        DependsOn = '[OneGetPackageProvider]NuGet'
    }
}

$MOFPath = 'C:\MOF'
If (!(Test-Path $MOFPath)){New-Item -Path $MOFPath -ItemType Directory}
InstallAzureRM -OutputPath $MOFPath
Start-DscConfiguration -Path $MOFPath -Wait -Force -Verbose