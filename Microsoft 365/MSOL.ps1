$Settings = Get-Content '.\Microsoft 365\Settings.json' | ConvertFrom-Json


# Hey this is description

Install-Module -Name 'MSOnline' -Force -AllowClobber
Import-Module -Name 'MSOnline'

$Credential = [PSCredential]::new($Settings.Tenant.UserName, (ConvertTo-SecureString $Settings.Tenant.Password -AsPlainText -Force ))


Connect-MsolService -Credential $Credential

Get-MsolUser

New-MsolUser -FirstName Simon -LastName Ozturk -City Sydney -Department IT -UserPrincipalName user@domain.com -DisplayName "Simon Ozturk"

# List Groups
Get-MsolGroup

# Export Groups to Json
Get-MsolGroup | ConvertTo-Json | Out-File .\MSOnline\Groups.json

# List Products Sku
Get-MsolAccountSku | Format-Table -AutoSize

# List Unlicensed Users and Assign License to them

Get-MsolUser -UserPrincipalName "user@domain.com" | Set-MsolUser -UsageLocation "US"
Get-MsolUser -UserPrincipalName "user@domain.com" | Set-MsolUserLicense -AddLicenses '<TenantDomain>:ENTERPRISEPREMIUM'

Get-MsolUser -UnlicensedUsersOnly | Set-MsolUserLicense -AddLicenses '<TenantDomain>:ENTERPRISEPREMIUM'

# Create Security Group for Limit Microsoft 365 Group Creation.
New-MsolGroup -DisplayName "Microsoft 365 Group Creators" -Description "Members of this group allow to Create Microsoft 365 Group"