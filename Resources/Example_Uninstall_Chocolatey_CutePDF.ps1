Configuration UninstallCutePDF
{

    Import-DSCResource -ModuleName OneGetPackage

    OneGetPackage CutePDF
    {
        Name = 'CutePDF'
        Source = 'Chocolatey'
        Ensure = 'Absent'
    }
}

$MOFPath = 'C:\MOF'
If (!(Test-Path $MOFPath)){New-Item -Path $MOFPath -ItemType Directory}
UninstallCutePDF -OutputPath $MOFPath
Start-DscConfiguration -Path $MOFPath -Wait -Force -Verbose