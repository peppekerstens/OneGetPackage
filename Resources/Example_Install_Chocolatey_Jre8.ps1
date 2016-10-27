Configuration InstallJre8
{

    Import-DSCResource -ModuleName NuGetPackage

    NuGetPackage Jre8
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