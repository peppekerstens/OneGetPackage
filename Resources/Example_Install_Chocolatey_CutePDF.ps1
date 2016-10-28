Configuration InstallCutePDF
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

    OneGetPackage CutePDF
    {
        Name = 'CutePDF'
        Source = 'Chocolatey'
        Ensure = 'Present'
        DependsOn = '[OneGetPackageProvider]Chocolatey'
    }
}

$MOFPath = 'C:\MOF'
If (!(Test-Path $MOFPath)){New-Item -Path $MOFPath -ItemType Directory}
InstallCutePDF -OutputPath $MOFPath
Start-DscConfiguration -Path $MOFPath -Wait -Force -Verbose