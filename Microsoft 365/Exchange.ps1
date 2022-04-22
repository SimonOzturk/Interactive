
$Settings = Get-Content '.\Microsoft 365\Settings.json' | ConvertFrom-Json
$Credential = [PSCredential]::new($Settings.Tenant.UserName, (ConvertTo-SecureString $Settings.Tenant.Password -AsPlainText -Force ))
$Session = New-PSSession -ConfigurationName "Microsoft.Exchange" -Authentication Basic -ConnectionUri 'https://outlook.office365.com/powershell-liveid/' -Credential $Credential

Import-PSSession $Session

Get-Mailbox