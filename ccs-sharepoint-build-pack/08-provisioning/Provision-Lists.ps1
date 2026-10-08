<#
Creates the lists for one site from 07-lists-and-formatting/lists.json: columns, content types,
views, column formats, item-level permissions on Requests, ratings on Ideas, and optional seed rows
from seed.json. Applies gallery and board card formats once those views exist. Prints the four
front-door form links when run against the platform.

Run once per site, as an owner of that site, with PnP.PowerShell 2.x and an Entra app registration
your tenant has approved for PnP (pass its client ID). Run against test sites first.

  ./Provision-Lists.ps1 -Site Platform      -Url https://contoso.sharepoint.com/sites/ccs -ClientId <app-id> -SeedData
  ./Provision-Lists.ps1 -Site Lab           -Url https://contoso.sharepoint.com/sites/ccs-autoops -ClientId <app-id> -SeedData
  ./Provision-Lists.ps1 -Site Frontier      -Url https://contoso.sharepoint.com/sites/ccs-frontier -ClientId <app-id> -SeedData
  ./Provision-Lists.ps1 -Site 'Team business' -Url https://contoso.sharepoint.com/sites/ccs-autoops-services -ClientId <app-id>
  ./Provision-Lists.ps1 -Site 'Team private'  -Url https://contoso.sharepoint.com/sites/ccs-autoops-services-team -ClientId <app-id>

Board and gallery views can't be created by script with the board layout, so create them in the
browser (names in lists.json, 'views'), then run again with -ApplyCardFormats.
Seed rows are illustrative mock data from the designs; the Programme seed is the Automated
Operations Lab's, so leave -SeedData off for the other Lab hubs.
#>
param(
  [Parameter(Mandatory)] [ValidateSet('Platform', 'Lab', 'Frontier', 'Team business', 'Team private')] [string] $Site,
  [Parameter(Mandatory)] [string] $Url,
  [Parameter(Mandatory)] [string] $ClientId,
  [switch] $SeedData,
  [switch] $ApplyCardFormats
)
$ErrorActionPreference = 'Stop'
$root   = Split-Path -Parent $PSScriptRoot
$schema = Get-Content (Join-Path $root '07-lists-and-formatting/lists.json') -Raw | ConvertFrom-Json
$seed   = Get-Content (Join-Path $root '07-lists-and-formatting/seed.json')  -Raw | ConvertFrom-Json
$group  = 'CCS'

function ConvertTo-XmlText([string] $s) { [System.Security.SecurityElement]::Escape($s) }

function Get-FieldXml($f) {
  $n = $f.name
  $d = if ($f.display) { ConvertTo-XmlText $f.display } else { $n }
  $common = "DisplayName=`"$d`" Name=`"$n`" StaticName=`"$n`" Group=`"$group`""
  switch ($f.type) {
    'Text'     { "<Field Type=`"Text`" $common MaxLength=`"255`" />" }
    'Note'     { "<Field Type=`"Note`" $common RichText=`"FALSE`" NumLines=`"4`" />" }
    'Number'   { "<Field Type=`"Number`" $common Decimals=`"0`" />" }
    'Currency' { "<Field Type=`"Currency`" $common LCID=`"2057`" Decimals=`"0`" />" }
    'URL'      { "<Field Type=`"URL`" $common Format=`"Hyperlink`" />" }
    'MultiChoice' {
      $choices = ($f.choices | ForEach-Object { "<CHOICE>$(ConvertTo-XmlText $_)</CHOICE>" }) -join ''
      "<Field Type=`"MultiChoice`" $common><CHOICES>$choices</CHOICES></Field>"
    }
    'Boolean'  { "<Field Type=`"Boolean`" $common><Default>0</Default></Field>" }
    'DateTime' { "<Field Type=`"DateTime`" $common Format=`"DateOnly`" />" }
    'User'     { "<Field Type=`"User`" $common UserSelectionMode=`"PeopleOnly`" />" }
    'Lookup'   {
      $target = Get-PnPList -Identity $f.lookupList
      "<Field Type=`"Lookup`" $common List=`"{$($target.Id)}`" ShowField=`"Title`" />"
    }
    'Choice'   {
      $choices = ($f.choices | ForEach-Object { "<CHOICE>$(ConvertTo-XmlText $_)</CHOICE>" }) -join ''
      "<Field Type=`"Choice`" $common Format=`"Dropdown`"><CHOICES>$choices</CHOICES></Field>"
    }
    default    { throw "Unknown field type $($f.type) on $n" }
  }
}

function Set-ColumnFormat($listName, $f) {
  if ($f.format) {
    $json = Get-Content (Join-Path $root "07-lists-and-formatting/formatting/$($f.format)") -Raw
    Set-PnPField -List $listName -Identity $f.name -Values @{ CustomFormatter = $json } | Out-Null
  }
}

$formLinks = @()

foreach ($siteKey in @($Site)) {
  $url = $Url
  Write-Host "`n== $siteKey site: $url" -ForegroundColor Cyan
  Connect-PnPOnline -Url $url -Interactive -ClientId $ClientId

  foreach ($l in ($schema.lists | Where-Object { $_.site -eq $siteKey })) {
    Write-Host "List $($l.name)"
    if (-not (Get-PnPList -Identity $l.name -ErrorAction SilentlyContinue)) {
      New-PnPList -Title $l.name -Template GenericList | Out-Null
    }
    if ($l.titleLabel) { Set-PnPField -List $l.name -Identity 'Title' -Values @{ Title = $l.titleLabel } | Out-Null }

    if ($l.contentTypes) {
      # Site columns, then content types built from them, then attach to the list
      Set-PnPList -Identity $l.name -EnableContentTypes $true | Out-Null
      foreach ($f in $l.fields) {
        if (-not (Get-PnPField -Identity $f.name -ErrorAction SilentlyContinue)) {
          Add-PnPFieldFromXml -FieldXml (Get-FieldXml $f) | Out-Null
        }
      }
      $item = Get-PnPContentType -Identity 'Item'
      foreach ($ct in $l.contentTypes) {
        if (-not (Get-PnPContentType -Identity $ct.name -ErrorAction SilentlyContinue)) {
          Add-PnPContentType -Name $ct.name -Group $group -ParentContentType $item | Out-Null
        }
        foreach ($fn in $ct.fields) { Add-PnPFieldToContentType -Field $fn -ContentType $ct.name | Out-Null }
        # Internal-only columns (status, squad, gate, waiting) belong to every request type
        foreach ($f in ($l.fields | Where-Object { $_.internalOnly })) {
          Add-PnPFieldToContentType -Field $f.name -ContentType $ct.name -Hidden | Out-Null
        }
        Add-PnPContentTypeToList -List $l.name -ContentType $ct.name | Out-Null
      }
      Remove-PnPContentTypeFromList -List $l.name -ContentType 'Item' -ErrorAction SilentlyContinue
      foreach ($f in $l.fields) { Set-ColumnFormat $l.name $f }
    } else {
      foreach ($f in $l.fields) {
        if (-not (Get-PnPField -List $l.name -Identity $f.name -ErrorAction SilentlyContinue)) {
          Add-PnPFieldFromXml -List $l.name -FieldXml (Get-FieldXml $f) | Out-Null
        }
        Set-ColumnFormat $l.name $f
      }
    }

    if ($l.readOwnItemsOnly) {
      # Requesters read and edit only their own items; people with Design or above see all
      Set-PnPList -Identity $l.name -ReadSecurity 2 -WriteSecurity 2 | Out-Null
    }

    if ($l.ratings -eq 'Likes') {
      # Likes on Ideas: adds the LikesCount column the ideas cards show
      $list = Get-PnPList -Identity $l.name -Includes RootFolder
      $list.RootFolder.Properties['Ratings_VotingExperience'] = 'Likes'; $list.RootFolder.Update(); Invoke-PnPQuery
      Write-Warning "  Ratings: open List settings, Rating settings once and save with Likes on, so the rating columns are added."
    }

    if ($l.formHeader) {
      $header = Get-Content (Join-Path $root "07-lists-and-formatting/formatting/$($l.formHeader)") -Raw
      foreach ($ct in (Get-PnPContentType -List $l.name)) {
        if ($ct.Name -ne 'Folder') { $ct.ClientFormCustomFormatter = (@{ headerJSONFormatter = $header } | ConvertTo-Json -Compress); $ct.Update($false) }
      }
      Invoke-PnPQuery
    }

    $all = @('Title') + ($l.fields | ForEach-Object { $_.name })
    $default = Get-PnPView -List $l.name | Where-Object { $_.DefaultView } | Select-Object -First 1
    Set-PnPView -List $l.name -Identity $default.Id -Fields $all | Out-Null

    foreach ($v in ($l.views | Where-Object { -not $_.layout })) {
      if (-not (Get-PnPView -List $l.name -Identity $v.title -ErrorAction SilentlyContinue)) {
        Add-PnPView -List $l.name -Title $v.title -Fields $v.fields -Query $v.query -RowLimit 100 | Out-Null
      }
    }

    if ($SeedData -and $seed.PSObject.Properties.Name -contains $l.name) {
      if ((Get-PnPListItem -List $l.name -PageSize 1).Count -eq 0) {
        foreach ($row in $seed.($l.name)) {
          $values = @{}; $ct = $null
          $tenantRoot = ([uri]$url).GetLeftPart([System.UriPartial]::Authority)
          $row.PSObject.Properties | ForEach-Object {
            if ($_.Name -eq 'ContentType') { $ct = $_.Value }
            elseif ($_.Value -is [string] -and $_.Value.StartsWith('/sites/')) { $values[$_.Name] = "$tenantRoot$($_.Value)" }  # links in seed.json are tenant-relative
            else { $values[$_.Name] = $_.Value }
          }
          if ($ct) { Add-PnPListItem -List $l.name -ContentType $ct -Values $values | Out-Null }
          else     { Add-PnPListItem -List $l.name -Values $values | Out-Null }
        }
      }
    }

    if ($ApplyCardFormats) {
      foreach ($v in ($l.views | Where-Object { $_.layout -and $_.note -match '\.json' })) {
        $fmt = [regex]::Match($v.note, '[\w-]+\.json').Value
        $view = Get-PnPView -List $l.name -Identity $v.title -ErrorAction SilentlyContinue
        if ($view) {
          $json = Get-Content (Join-Path $root "07-lists-and-formatting/formatting/$fmt") -Raw
          Set-PnPView -List $l.name -Identity $v.title -Values @{ CustomFormatter = $json } | Out-Null
          Write-Host "  $fmt applied to view $($v.title)"
        } else {
          Write-Warning "  No view '$($v.title)' on $($l.name). Create it in the browser ($($v.layout)) and run again."
        }
      }
      # Lists whose only card format is 'gallery': apply it to a gallery view called Cards
      if ($l.gallery -and -not ($l.views | Where-Object { $_.note -match [regex]::Escape($l.gallery) })) {
        if (Get-PnPView -List $l.name -Identity 'Cards' -ErrorAction SilentlyContinue) {
          $json = Get-Content (Join-Path $root "07-lists-and-formatting/formatting/$($l.gallery)") -Raw
          Set-PnPView -List $l.name -Identity 'Cards' -Values @{ CustomFormatter = $json } | Out-Null
          Write-Host "  $($l.gallery) applied to view Cards"
        } else { Write-Warning "  Create a gallery view called 'Cards' on $($l.name) and run again." }
      }
    }

    if ($l.contentTypes) {
      $list = Get-PnPList -Identity $l.name
      foreach ($ct in (Get-PnPContentType -List $l.name | Where-Object { $_.Name -ne 'Folder' })) {
        $formLinks += [pscustomobject]@{ Route = $ct.Name; Link = "$url/Lists/$($l.name)/NewForm.aspx?ContentTypeId=$($ct.Id.StringValue)" }
      }
    }
  }
}

if ($formLinks.Count) {
  Write-Host "`nFront door links (use these in the Quick links web part):" -ForegroundColor Cyan
  $formLinks | Format-Table -AutoSize
}
Write-Host "Done." -ForegroundColor Green
