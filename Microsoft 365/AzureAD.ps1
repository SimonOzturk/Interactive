Install-Module -Name 'AzureAD' -Force -AllowClobber
Import-Module -Name 'AzureAD'

$Credential = [PSCredential]::new($Settings.Tenant.UserName, (ConvertTo-SecureString $Settings.Tenant.Password -AsPlainText -Force ))

Connect-AzureAD -Credential $Credential


Get-Command -Module AzureAD

Get-AzureADUser
Get-AzureADGroup