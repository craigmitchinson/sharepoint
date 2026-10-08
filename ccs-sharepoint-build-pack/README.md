# CCS SharePoint build pack

Everything needed to build the Colleague & Customer Service (CCS) SharePoint estate: the CCS platform hub, the four Lab hubs, Frontier, and a team's business and private sites. Automated Services, in the Automated Operations Lab, is the worked team example; every other team copies its pattern.

All solution names, teams, people, quotes and figures in the designs and seed data are illustrative. Replace them before launch.

## Start here

1. Open `design/offline/index.html` in Edge or Chrome. It is every page, clickable as it will be in SharePoint, with a Web part labels button that shows what builds each block.
2. Read `01-build-guide.md` for the order of work.
3. Build each page from `05-page-build-sheets/`, with the offline copy open beside it.

## Contents

| Folder or file | What it holds |
|---|---|
| `01-build-guide.md` | The order of work, from decisions and admin requests to launch checks |
| `02-access-and-permissions.md` | Groups, site and list permissions, Power BI and agent access, copy-paste admin requests, fixes for common access problems |
| `03-sites-urls-and-folders.md` | How the sites join up, every site and page address, every list and library, folder structures, naming |
| `04-design-spec.md` | Grid, type, the colour ramps for every site, themes and title images per site, components, Power BI sizes, the mark, and every asset with its size and use |
| `05-page-build-sheets/` | Every page on every site, top to bottom: background, layout, web part and settings, opening copy |
| `06-power-bi/` | Workspaces, the semantic model and measures, every visual with its Deneb spec, site configs, 13 specs with sample data and previews |
| `07-lists-and-formatting/` | List schemas, seed rows, and the card, board and column formatting JSON |
| `08-provisioning/` | PnP PowerShell for sites, hubs, themes and lists |
| `09-agent/` | The one CCS agent: instructions, knowledge, actions, how routing works, evaluation set, go-live steps |
| `10-governance-and-maintenance.md` | Who owns what, rules, review cycles, compliance, adding a team or a Lab |
| `assets/` | Every mark, logo, background, image, icon and animation, SVG and PNG |
| `theme/` | Six SharePoint themes and six Power BI themes, one per site colour |
| `design/` | The offline copy, and one PDF per site for reference |

The live designs, for showing stakeholders: https://claude.ai/artifact/QffCJTsbWMGufEMsgcRAS4

## The estate

| Level | Site | Address (placeholder tenant `contoso`) | Colour |
|---|---|---|---|
| Platform | Colleague & Customer Service (hub) | `https://contoso.sharepoint.com/sites/ccs` | Navy #243B6B |
| Lab | 24x7 Services Lab (hub, joined to CCS) | `/sites/ccs-247` | Burnt orange #B84C14 |
| Lab | Automated Operations Lab (hub, joined to CCS) | `/sites/ccs-autoops` | Crimson #CE143D |
| Lab | Colleague Tooling Lab (hub, joined to CCS) | `/sites/ccs-tooling` | Blue #18519D |
| Lab | Data & Insights Lab (hub, joined to CCS) | `/sites/ccs-insights` | Teal #00838F |
| Forum | Frontier (associated with CCS) | `/sites/ccs-frontier` | Purple #4F2391 |
| Team | Automated Services (business site, joined to its Lab) | `/sites/ccs-autoops-services` | Inherits crimson |
| Team | Automated Services Team (private site, joined to its Lab) | `/sites/ccs-autoops-services-team` | Inherits crimson |

Roles named throughout: Business Platform Lead and Technology Platform Lead (CCS); Lab Product Owner and Lab Engineering Lead (each Lab); Frontier Product Owner and Frontier Engineering Lead; team Product Owner and Engineering Lead.

Everything is native SharePoint (web parts, list formatting, hubs, themes) plus Power BI with the certified Deneb visual. No custom code runs on any page.
