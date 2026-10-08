# Provisioning

| Script | Does | Run as |
|---|---|---|
| `Provision-Sites.ps1` | Adds the six tenant themes; creates the CCS hub, the four Lab hubs and Frontier; joins each Lab hub to CCS and associates Frontier with CCS; creates one team business site and joins it to its Lab; sets Compact headers, logos and each site's theme; creates and registers the BrandAssets organisation assets library | SharePoint admin |
| `Provision-Lists.ps1` | For one site at a time: every list in `07-lists-and-formatting/lists.json` for that site, with columns, content types, views, column formats, item-level permissions on Requests, Likes on Ideas and optional seed rows; applies the card formats once the board and gallery views exist; prints the four front-door form links on CCS | Owner of that site |

Both need PnP.PowerShell 2.x and an Entra app registration approved for PnP in your tenant. Run against a test tenant first.

Order:
1. `Provision-Sites.ps1 -Tenant contoso -ClientId <id>`
2. Upload `assets/` into `BrandAssets` on CCS, keeping the folders.
3. `Provision-Lists.ps1 -Site Platform -Url .../sites/ccs -SeedData` (the Labs, Teams and Tools rows point at BrandAssets, so upload first)
4. `Provision-Lists.ps1 -Site Lab -Url .../sites/ccs-{lab}` for each Lab hub; `-Site Frontier`; then the team sites
5. Create the board and gallery views named in `lists.json` in the browser, then rerun each with `-ApplyCardFormats`
6. Create the private team site from Teams and run `Provision-Sites.ps1 -AssociatePrivateSite -LabCode autoops -TeamCode services`

Another team: `Provision-Sites.ps1 -TeamOnly -LabCode 247 -TeamCode monitoring -TeamTitle 'Monitoring'`, then `Provision-Lists.ps1` for its sites and a row in the Teams list on CCS.
