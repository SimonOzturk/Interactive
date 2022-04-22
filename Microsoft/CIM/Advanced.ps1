function Get-OSInfo {
    param (
        [string]$Namespace = 'ROOT/cimv2'
    )
    
    return [PSCustomObject]@{
        DiskDrive       = Get-CimInstance  -Namespace $Namespace -ClassName CIM_DiskDrive | Select-Object DeviceID, Caption, Partitions, Size, Model
        LogicalDisk     = Get-CimInstance  -Namespace $Namespace -ClassName CIM_LogicalDisk  | Select-Object DeviceID, DriveType, ProviderName, VolumeName, Size, FreeSpace
        BIOS            = Get-CimInstance  -Namespace $Namespace -ClassName CIM_BIOSElement  | Select-Object SMBIOSBIOSVersion, Manufacturer, Name, SerialNumber, Version
        OperatingSystem = Get-CimInstance  -Namespace $Namespace -ClassName CIM_OperatingSystem  | Select-Object SystemDirectory, Organization, BuildNumber, RegisteredUser, SerialNumber, Version 
        NetworkAdapter  = Get-CimInstance  -Namespace $Namespace -ClassName CIM_NetworkAdapter  | Select-Object DeviceID, Name, AdapterType
    }
}

Get-OSInfo | ConvertTo-Json | Out-File .\OS.json