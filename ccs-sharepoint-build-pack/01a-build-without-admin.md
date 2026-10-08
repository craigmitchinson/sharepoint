# Building without admin rights

Use this instead of steps 1 to 3 of `01-build-guide.md` when you can create sites and own them, but can't get a SharePoint, Entra or Power Platform admin. Everything here is done in the browser as a site owner. The page build sheets, list definitions, formatting JSON, assets and Deneb specs are unchanged.

## What changes

| Needs an admin | What you do instead |
|---|---|
| Hub sites (CCS and the Labs as hubs, the hub bar, hub news roll-up) | Every site gets the same top navigation by hand, with a CCS menu first. News and site cards pull from named sites instead of "all sites in the hub" |
| Tenant-wide custom themes | A site theme created by you as owner on each site (Site branding, table below) |
| Organisation assets library | One `Brand` library on CCS holding `assets/`. Pick images from it through "Sites" in the file picker |
| PnP provisioning scripts | Create lists by hand from `07-lists-and-formatting/lists.json`, then paste the formatting JSON |
| Entra security groups | Use each site's Owners, Members and Visitors groups, adding people or existing groups you can already see |
| Agent environment and publishing | Leave the agent for later; the "Ask the CCS agent" buttons can open the front door page until it exists |

## 1. Create the sites

Create each site from the SharePoint start page: Create site, Communication site, Blank, language English (United Kingdom). Titles, addresses and descriptions are in `00-site-register.md`. Create private team sites from Teams. If "Create site" is missing for you, site creation is switched off in your tenant and that one step does need someone else.

## 2. Theme per site

Site owners can create their own theme on each site: Settings, Site branding, Theme, + New theme. It can't be switched off by admins, but a theme only exists on the site it was made on, so create it once on every site that uses that colour (a Lab's team sites need their Lab's theme too).

In the theme designer, add the colours below with + Add color (custom colour, type the hex), then add the four combinations with + New combination. Name the theme as shown, save, and pick it in Change the look, Theme.

| Theme name | Colours to add | Combinations (background / accent) |
|---|---|---|
| CCS platform | #243B6B, #15223E, #D8DCE4, #ACB5C7 | #FFFFFF / #243B6B · #D8DCE4 / #243B6B · #243B6B / #FFFFFF · #15223E / #ACB5C7 |
| CCS Automated Operations | #CE143D, #470C1E, #F6D5DC, #ECA6B5 | #FFFFFF / #CE143D · #F6D5DC / #A11030 · #CE143D / #FFFFFF · #470C1E / #ECA6B5 |
| CCS 24x7 Services | #B84C14, #5C260A, #FBE3D5, #F2BC9C | #FFFFFF / #B84C14 · #FBE3D5 / #8F3A0E · #B84C14 / #FFFFFF · #5C260A / #F2BC9C |
| CCS Colleague Tooling | #18519D, #0E2F5B, #D5E0ED, #A7BDDA | #FFFFFF / #18519D · #D5E0ED / #133F7A · #18519D / #FFFFFF · #0E2F5B / #A7BDDA |
| CCS Data & Insights | #00838F, #004C53, #D1E9EB, #9ED0D4 | #FFFFFF / #00838F · #D1E9EB / #006670 · #00838F / #FFFFFF · #004C53 / #9ED0D4 |
| CCS Frontier | #4F2391, #1E0D3D, #EDE6F7, #D3C3EE | #FFFFFF / #4F2391 · #EDE6F7 / #4F2391 · #4F2391 / #FFFFFF · #1E0D3D / #BBA3EA |

The first colour is the primary (buttons, links, active navigation). The combinations become the section backgrounds you pick when editing a page: white, Soft (light tint), Strong (primary) and Dark (the title-image ground). Where the page build sheets say Neutral, use the grey section background if the theme still offers it, or white.

If the designer won't take a value as typed, use the nearest it offers for that slot; the card, pill and chart colours come from the formatting JSON and Deneb config, so they stay exact regardless.

Fallback with no site branding: the closest Microsoft themes are Cobalt (CCS), Red, Orange, Blue, Teal and Purple. Avoid Dark Blue and Dark Teal, which give the whole site a dark background.

Then, on every site: Change the look, Header: Compact, site title on, logo and thumbnail from `assets/logos` (Lab sites use their Lab mark, Frontier its own logo, CCS the platform logo). Footer: on, logo `footer-logo-ccs-platform-dark_300x300.png`. Navigation: Horizontal, Mega menu on.

## 3. Navigation instead of hubs

Without hubs there is no shared bar, so every site carries the CCS structure in its own navigation. Build it once on CCS, then copy it on each site (Edit, under the navigation).

CCS (top level): Home, Labs (sub-links: the four Lab sites), Find a solution, Tools and partners, Front door, Trust and controls, How we count value, Frontier, News.

Each Lab site: first link "CCS" with sub-links Home, Labs, Front door, Trust and controls, How we count value, Frontier; then the Lab's own pages (Home, Teams, Programme, Tools and skills, Rules, News) and a "Teams" heading with its team sites.

Frontier: "CCS" menu as above, then Home, Ideas, Experiments, Showcase, Methods, Get involved.

Team business sites: "CCS" menu, a link back to their Lab, then their own pages.

Where a page build sheet says "News web part, source: this site and all sites associated with the hub", choose Source: Select sites and add the sites. The same for Sites and Highlighted content web parts.

## 4. Brand library

On CCS: New, Document library, name `Brand`. Upload `assets/` keeping the folders. Give Visitors read (it inherits from the site). When an Image web part or title area asks for an image, choose Sites, Colleague & Customer Service, Brand.

## 5. Lists

For each list in `lists.json` on the site you are building: New, List, Blank list, the name exactly as written. Add each column with the type, name and choices listed (create the column with the internal name first, then rename the display name if one is given, so formulas in the formatting JSON find it). Then:
- Column formats: column header, Column settings, Format this column, Advanced mode, paste the `col-*.json` named in `lists.json`.
- Gallery and board views: + Add view, Gallery or Board, then Format current view, Advanced mode, paste the `tile-*.json`.
- Requests: List settings, Advanced settings, Read access "Read items that were created by the user", Create and Edit access "Create items and edit items that were created by the user".
- Ideas on Frontier: List settings, Rating settings, Likes. Then List settings, Permissions for this list, Stop inheriting, give Visitors Contribute.
- Sample rows: paste from `seed.json` in grid view, or leave them out and add real ones.

## 6. Power BI and showing lists from other sites

Power BI web part: works with no admin change, for anyone who has access to the report through a workspace or app you share.

Deneb: try adding it from AppSource in Power BI Desktop. Most tenants allow certified visuals; if yours blocks it, use the native visuals with the Power BI theme and keep the PNG placeholders until it's allowed.

KPI strips and lists from another site use the Embed web part. On each site that has them: Settings, Site information, View all site settings, HTML Field Security, and allow `app.powerbi.com` (you can do this as the site's owner). SharePoint list views (`?env=WebViewList`) need no change.

## 7. Flows

Create them in Power Automate under your own account to start with. Before launch, share each flow with a second owner so it doesn't stop if you're away, and ask for a service account when you can.

## What you lose, and why it's acceptable

The hub bar and automatic news roll-up are the visible losses. A consistent mega menu on every site gives visitors the same way around, and named-site news gives the same roll-up. Search across the estate still works because it's one tenant. If admin help arrives later, registering the hubs and adding the themes changes nothing you've built.
