[string]$var = "Hello World";
[int]$number = 10;
$var | Get-Member
$number | Get-Member

Get-Service WinRM | Get-Member
$WinRM = Get-Service WinRM | Get-Member
Get-Service WinRM | Stop-Service
Get-Service | Format-Table Name, Status
$Selected = Get-Service | Out-GridView -PassThru
$Selected

foreach ($i in $Selected) {

}

Set-Location C:\