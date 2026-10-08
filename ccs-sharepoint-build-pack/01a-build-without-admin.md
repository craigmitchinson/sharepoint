# Building without admin rights

Use this instead of steps 1 to 3 of `01-build-guide.md` when you can create sites and own them, but can't get a SharePoint, Entra or Power Platform admin. Everything here is done in the browser as a site owner. The page build sheets, list definitions, formatting JSON, assets and Deneb specs are unchanged.

## What changes

| Needs an admin | What you do instead |
|---|---|
| Hub sites (CCS and the Labs as hubs, the hub bar, hub news roll-up) | Every site gets the same top navigation by hand, with a CCS menu first. News and site cards pull from named sites instead of "all sites in the hub" |
| Custom themes | The closest Microsoft theme per site (table below). Card and pill colours come from the formatting JSON, so they stay exact |
| Organisation assets library | One `Brand` library on CCS holding `assets/`. Pick images from it through "Sites" in the file picker |
| PnP provisioning scripts | Create lists by hand from `07-lists-and-formatting/lists.json`, then paste the formatting JSON |
| Entra security groups | Use each site's Owners, Members and Visitors groups, adding people or existing groups you can already see |
| Agent environment and publishing | Leave the agent for later; the "Ask the CCS agent" buttons can open the front door page until it exists |

## 1. Create the sites

Create each site from the SharePoint start page: Create site, Communication site, Blank, language English (United Kingdom). Titles, addresses and descriptions are in `00-site-register.md`. Create private team sites from Teams. If "Create site" is missing for you, site creation is switched off in your tenant and that one step does need someone else.

## 2. Theme per site

Settings, Change the look, Theme, From Microsoft:

| Site | Theme |
|---|---|
| CCS | Cobalt (not Dark Blue or Dark Teal: those are inverted themes with dark page backgrounds) |
| Automated Operations Lab and its teams | Red |
| 24x7 Services Lab and its teams | Orange |
| Colleague Tooling Lab and its teams | Blue |
| Data & Insights Lab and its teams | Teal |
| Frontier and Frontier Team | Purple |

These are lighter than the design colours. Buttons, links, Soft and Strong sections and active navigation follow the theme; everything else (title images, logos, cards, pills, charts) uses the design colours exactly. If you later get custom themes, switching recolours every page with no rework.

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
