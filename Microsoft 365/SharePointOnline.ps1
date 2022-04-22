$Settings = Get-Content '.\Microsoft 365\Settings.json' | ConvertFrom-Json
$Credential = [PSCredential]::new($Settings.Tenant.UserName, (ConvertTo-SecureString $Settings.Tenant.Password -AsPlainText -Force ))


$AdminUrl = 'https://<TenantDomain>-admin.sharepoint.com/'

Install-Module -Name 'Microsoft.Online.SharePoint.PowerShell' -Confirm:$false -Force -AllowClobber
Install-Module -Name 'PnP.PowerShell' -Confirm:$false -Force

Import-Module -Name 'Microsoft.Online.SharePoint.PowerShell'
Import-Module -Name 'PnP.PowerShell'

Connect-SPOService -Url $AdminUrl

Get-SPOSite
New-SPOSite -Title 'PowerShell Training'
New-SPOSite -Title 'PowerShell Training' -Url https://<TenantDomain>.sharepoint.com/sites/PowerShellTraining -Owner user@domain.com -StorageQuota 1024 -Template STS#0