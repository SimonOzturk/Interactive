Get-CimInstance -Query 'Select * from Win32_BIOS'

Get-WmiObject -Query 'Select * from Win32_BIOS'
Get-WmiObject -Class 'Win32_BIOS'
$Bios = Get-WmiObject -Class 'Win32_BIOS'
$Bios | Format-List


Get-WmiObject -Class 'Win32_Product'
$Updates = Get-WmiObject -Class 'Win32_QuickFixEngineering'
$Updates

Get-CimClass -ClassName *Processor*

# CLR
[datetime]$Today = Get-Date;


$Query = @{
    ClassName = 'CIM_DiskDrive'
    Namespace = 'ROOT/cimv2' 
    ComputerName = ('Localhost','CORSAIRONEPRO')
}
Get-CimInstance @Query

Get-CimInstance -ClassName CIM_DiskDrive -Namespace 'ROOT/cimv2' -ComputerName Localhost,CORSAIRONEPRO
Get-CimInstance -ClassName Win32_DiskDrive
Get-WmiObject -Class Win32_DiskDrive | Select-Object DeviceID,Caption,Partitions,Size,Model | ConvertTo-Json | Out-File .\DiskDrive.json

