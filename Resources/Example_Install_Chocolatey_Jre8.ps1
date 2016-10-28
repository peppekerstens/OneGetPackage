Configuration InstallJre8
{

    Import-DSCResource -ModuleName OneGetPackage

    OneGetPackageProvider NuGet
    {
        Name = 'NuGet'
    }

    OneGetPackageProvider Chocolatey
    {
        Name = 'Chocolatey'
        DependsOn = '[OneGetPackageProvider]NuGet'
    }
    
    OneGetPackage Jre8
    {
        Name = 'Jre8'
        Source = 'Chocolatey'
        Ensure = 'Present'
    }
}

$MOFPath = 'C:\MOF'
If (!(Test-Path $MOFPath)){New-Item -Path $MOFPath -ItemType Directory}
InstallJre8 -OutputPath $MOFPath
Start-DscConfiguration -Path $MOFPath -Wait -Force -Verbose