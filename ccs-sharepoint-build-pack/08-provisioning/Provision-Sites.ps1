<#
Creates the CCS estate: the CCS platform hub, the four Lab hubs, Frontier, and one Lab's team
business site. Registers the hubs, joins each Lab hub to CCS, associates Frontier with CCS, joins
the team site to its Lab, adds the six tenant themes, applies each site's theme and logo, sets
Compact headers and registers the BrandAssets organisation assets library.

Run as a SharePoint admin with PnP.PowerShell 2.x and an Entra app registration approved for PnP.
Run against a test tenant first. Re-running is safe: existing sites are left as they are.

  ./Provision-Sites.ps1 -Tenant contoso -ClientId <app-id>

Another team in any Lab (business site):
  ./Provision-Sites.ps1 -Tenant contoso -ClientId <app-id> -TeamOnly -LabCode 247 -TeamCode monitoring -TeamTitle 'Monitoring'

The private team site is created from Teams (so it has a team and channels). Then:
  ./Provision-Sites.ps1 -Tenant contoso -ClientId <app-id> -AssociatePrivateSite -LabCode autoops -TeamCode services
#>
param(
  [Parameter(Mandatory)] [string] $Tenant,
  [Parameter(Mandatory)] [string] $ClientId,
  [string] $LabCode = 'autoops',
  [string] $TeamCode = 'services',
  [string] $TeamTitle = 'Automated Services',
  [switch] $TeamOnly,
  [switch] $AssociatePrivateSite
)
$ErrorActionPreference = 'Stop'
$root  = "https://$Tenant.sharepoint.com"
$admin = "https://$Tenant-admin.sharepoint.com"
$here  = Split-Path -Parent $PSScriptRoot
$ccs   = "$root/sites/ccs"

# Every Lab: address code, title, theme file and logo
$labs = @(
  @{ Code = '247';      Title = '24x7 Services Lab';        Theme = '24x7-services';        Logo = 'lab-mark-24x7-services_300x300.png' },
  @{ Code = 'autoops';  Title = 'Automated Operations Lab'; Theme = 'automated-operations'; Logo = 'lab-mark-automated-operations_300x300.png' },
  @{ Code = 'tooling';  Title = 'Colleague Tooling Lab';    Theme = 'colleague-tooling';    Logo = 'lab-mark-colleague-tooling_300x300.png' },
  @{ Code = 'insights'; Title = 'Data & Insights Lab';      Theme = 'data-and-insights';    Logo = 'lab-mark-data-and-insights_300x300.png' }
)
$lab = $labs | Where-Object { $_.Code -eq $LabCode }
if (-not $lab) { throw "Unknown LabCode $LabCode. Use one of: $($labs.Code -join ', ')" }
$labUrl  = "$root/sites/ccs-$LabCode"
$teamUrl = "$root/sites/ccs-$LabCode-$TeamCode"

Connect-PnPOnline -Url $admin -ClientId $ClientId -Interactive

if ($AssociatePrivateSite) {
  Add-PnPHubSiteAssociation -Site "$teamUrl-team" -HubSite $labUrl
  Write-Host "Joined $teamUrl-team to $labUrl"; return
}

function Ensure-Site($url, $title, $owner) {
  if (-not (Get-PnPTenantSite -Identity $url -ErrorAction SilentlyContinue)) {
    New-PnPSite -Type CommunicationSite -Title $title -Url $url -SiteDesign Topic -Lcid 2057 | Out-Null
    Write-Host "Created $url"
  }
  Set-PnPTenantSite -Identity $url -Owners $owner
}

function Set-Look($url, $themeName, $logo) {
  Connect-PnPOnline -Url $url -ClientId $ClientId -Interactive
  Set-PnPWebTheme -Theme $themeName
  Set-PnPWebHeader -HeaderLayout Compact -HeaderEmphasis None
  Set-PnPSite -LogoFilePath (Join-Path $here "assets/logos/$logo")
  Connect-PnPOnline -Url $admin -ClientId $ClientId -Interactive
}

if (-not $TeamOnly) {
  # Tenant themes: one per site colour
  foreach ($t in 'platform-navy', 'automated-operations', '24x7-services', 'colleague-tooling', 'data-and-insights', 'frontier') {
    $palette = Get-Content (Join-Path $here "theme/sharepoint-theme-$t.json") -Raw | ConvertFrom-Json -AsHashtable
    Add-PnPTenantTheme -Identity "CCS $t" -Palette $palette -IsInverted $false -Overwrite
  }

  # Platform hub
  Ensure-Site $ccs 'Colleague & Customer Service' 'CCS-Platform-Owners'
  if (-not (Get-PnPHubSite -Identity $ccs -ErrorAction SilentlyContinue)) { Register-PnPHubSite -Site $ccs | Out-Null }

  # Lab hubs, each joined to the CCS hub
  foreach ($l in $labs) {
    $u = "$root/sites/ccs-$($l.Code)"
    Ensure-Site $u $l.Title "CCS-$($l.Code)-Owners"
    if (-not (Get-PnPHubSite -Identity $u -ErrorAction SilentlyContinue)) { Register-PnPHubSite -Site $u | Out-Null }
    Add-PnPHubToHubAssociation -SourceUrl $u -TargetUrl $ccs
  }

  # Frontier: a communication site associated with the CCS hub (not a hub itself)
  Ensure-Site "$root/sites/ccs-frontier" 'Frontier' 'CCS-Frontier-Owners'
  Add-PnPHubSiteAssociation -Site "$root/sites/ccs-frontier" -HubSite $ccs

  # Organisation assets library on CCS
  Connect-PnPOnline -Url $ccs -ClientId $ClientId -Interactive
  New-PnPList -Title 'BrandAssets' -Template DocumentLibrary -ErrorAction SilentlyContinue | Out-Null
  foreach ($d in 'marks', 'logos', 'backgrounds', 'images', 'icons', 'motion') { Resolve-PnPFolder -SiteRelativePath "BrandAssets/$d" | Out-Null }
  Connect-PnPOnline -Url $admin -ClientId $ClientId -Interactive
  Add-PnPOrgAssetsLibrary -LibraryUrl "$ccs/BrandAssets" -OrgAssetType ImageDocumentLibrary -ErrorAction SilentlyContinue

  # Themes, headers and logos
  Set-Look $ccs 'CCS platform-navy' 'footer-logo-ccs-platform-light_300x300.png'
  foreach ($l in $labs) { Set-Look "$root/sites/ccs-$($l.Code)" "CCS $($l.Theme)" $l.Logo }
  Set-Look "$root/sites/ccs-frontier" 'CCS frontier' 'site-logo-frontier_300x300.png'
}

# The team business site, joined to its Lab hub; it inherits the Lab's theme through the hub
Ensure-Site $teamUrl $TeamTitle "CCS-$LabCode-$TeamCode-Owners"
Add-PnPHubSiteAssociation -Site $teamUrl -HubSite $labUrl
Set-Look $teamUrl "CCS $($lab.Theme)" $lab.Logo

Write-Host 'Done. Next: upload assets/ to BrandAssets, create the private team site from Teams and run -AssociatePrivateSite, then Provision-Lists.ps1 for each site.'
