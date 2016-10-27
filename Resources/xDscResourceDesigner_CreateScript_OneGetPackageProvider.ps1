$modules = 'C:\Users\peppe\Documents\GitHub'
$modulename = 'OneGetPackage'
$Description = 'This module is used to install software via the OneGet system. Functionality is limited to install/remove and define source'

#if (!(test-path (join-path $modules $modulename))) {

#    $modulefolder = mkdir (join-path $modules $modulename)
#    New-ModuleManifest -Path (join-path $modulefolder "$modulename.psd1") -Guid $([system.guid]::newguid().guid) -Author 'Peppe Kerstens' -CompanyName 'ITON Services BV' -Copyright '2016' -ModuleVersion '0.1.0.0' -Description $Description -PowerShellVersion '5.0'

    $standard = @{ModuleName = $modulename
                ClassVersion = '0.1.0.0'
                Path = $modules
                }
    $P = @()
    $P += New-xDscResourceProperty -Name Name -Type String -Attribute Key -Description 'Name of the packageprovider'
    $P += New-xDscResourceProperty -Name Ensure -Type String -Attribute Write -ValidateSet 'Present','Absent' -Description 'Determines whether should be activated or disabled'
    New-xDscResource -Name OneGetPackageProvider -Property $P -FriendlyName OneGetPackageProvider @standard
#}