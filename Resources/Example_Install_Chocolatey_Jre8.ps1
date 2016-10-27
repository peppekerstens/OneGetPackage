Configuration InstallCutePDF
{

    Import-DSCResource -ModuleName NuGetPackage

    NuGetPackage CutePDF
    {
        Name = 'CutePDF'
        Source = 'Chocolatey'
        Ensure = 'Present'
    }
}

$MOFPath = 'C:\MOF'
If (!(Test-Path $MOFPath)){New-Item -Path $MOFPath -ItemType Directory}
InstallCutePDF -OutputPath $MOFPath
Start-DscConfiguration -Path $MOFPath -Wait -Force -Verbose