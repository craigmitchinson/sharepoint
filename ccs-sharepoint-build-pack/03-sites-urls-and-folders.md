# Sites, addresses and folders

## How the estate fits together

CCS is the hub at the top. Its hub navigation is the main navigation on every CCS page, and its site navigation is off. The four Lab hubs are hubs in their own right, joined to CCS, so a Lab page shows the Lab's navigation and inherits CCS search and news roll-up. Team sites join their Lab hub. Every site people come to read is a communication site; each team's private working space, and Frontier's, is a Teams-connected team site. Frontier is an ordinary site associated with the CCS hub, so it shows the CCS navigation with Frontier added as a link, and keeps its own purple theme and site navigation.

| Level | Site | Address | Joined to | Theme |
|---|---|---|---|---|
| Platform | Colleague & Customer Service | `/sites/ccs` | Hub (top) | CCS platform-navy |
| Lab | 24x7 Services Lab | `/sites/ccs-247` | CCS hub | CCS 24x7-services (burnt orange) |
| Lab | Automated Operations Lab | `/sites/ccs-autoops` | CCS hub | CCS automated-operations (crimson) |
| Lab | Colleague Tooling Lab | `/sites/ccs-tooling` | CCS hub | CCS colleague-tooling (blue) |
| Lab | Data & Insights Lab | `/sites/ccs-insights` | CCS hub | CCS data-and-insights (teal) |
| Forum | Frontier (communication site) | `/sites/ccs-frontier` | Associated with CCS | CCS frontier (purple) |
| Forum | Frontier Team (team site, connected to Teams) | `/sites/ccs-frontier-team` | Associated with CCS | CCS frontier (purple) |
| Team | Automated Services (business site) | `/sites/ccs-autoops-services` | Automated Operations Lab | Inherits the Lab's |
| Team | Automated Services Team (private site) | `/sites/ccs-autoops-services-team` | Automated Operations Lab | Inherits the Lab's |

Address pattern: `ccs` for the platform, `ccs-{lab}` for a Lab, `ccs-{lab}-{team}` for a team's business site and `ccs-{lab}-{team}-team` for its private site. Codes are lower case, one word where possible, 12 characters at most.

| Lab | Teams (business site addresses) |
|---|---|
| 24x7 Services | Monitoring `ccs-247-monitoring`, Incident Response `ccs-247-incidents`, Resilience `ccs-247-resilience`, Release Management `ccs-247-releases` |
| Automated Operations | Automated Services `ccs-autoops-services`, Agent Engineering `ccs-autoops-agents`, Process Intelligence `ccs-autoops-intelligence` |
| Colleague Tooling | Case Tools `ccs-tooling-case`, Knowledge `ccs-tooling-knowledge`, Desktop `ccs-tooling-desktop` |
| Data & Insights | Reporting `ccs-insights-reporting`, Data Engineering `ccs-insights-engineering` |

If an existing Teams site has an old address, a SharePoint admin can change it (Active sites, Edit address, or `Start-SPOSiteRename` with `-ValidationOnly` first). The old address keeps redirecting.

## Pages on each site

Every site at a level has the same page set with the same file names. Nothing is added without a request through the front door.

| Site | Pages (file names in SitePages) |
|---|---|
| CCS | Home, `labs.aspx`, `find-a-solution.aspx`, `tools-and-partners.aspx`, `front-door.aspx`, `trust-and-controls.aspx`, `how-we-count-value.aspx`, `news.aspx`, news posts |
| Each Lab hub | Home, `teams.aspx`, `programme.aspx`, `tools-and-skills.aspx`, `rules.aspx`, `news.aspx`, news posts |
| Frontier | Home, `ideas.aspx`, `experiments.aspx`, `experiments/{experiment}.aspx` (one per experiment, from the template), `showcase.aspx`, `methods.aspx`, `get-involved.aspx`, news posts |
| Team business site | Home, `what-we-deliver.aspx`, `our-people.aspx`, `what-we-can-do.aspx`, `our-lab-work.aspx`, `contact-us.aspx`, `solutions/{solution}.aspx` (one per live solution, created by flow), `value/{area}.aspx` (insurance, pensions, investments), news posts |
| Team private site | Home, `delivery.aspx`, `service.aspx`, `cost-and-value.aspx`, `capability.aspx`, `ways-of-working.aspx` |

Front door, Trust and controls, How we count value and Find a solution exist only on CCS. Every "Ask a question", "Report a problem", "Change something" and "Bring us something new" link on every site opens the CCS Requests forms, and every "Ask the CCS agent" button opens the one CCS agent.

## Lists and libraries

| Site | Name | Address | Holds |
|---|---|---|---|
| CCS | Solutions | `/sites/ccs/Lists/Solutions` | Every live, in-build and retired solution, with Lab, Team, business area, hero journey, type, status, owner |
| CCS | Requests | `/sites/ccs/Lists/Requests` | Every front-door request, four content types, item-level permissions |
| CCS | Contacts | `/sites/ccs/Lists/Contacts` | Who to talk to, by Lab, team, role and topic (the People web parts and the agent) |
| CCS | Labs | `/sites/ccs/Lists/Labs` | One row per Lab, for the CCS Home cards |
| CCS | Teams | `/sites/ccs/Lists/Teams` | One row per team, for the Labs page and every Lab's Teams cards |
| CCS | Tools | `/sites/ccs/Lists/Tools` | Every tool and partner, who uses it, its status and licence owner |
| CCS | Stories, Quotes | `/sites/ccs/Lists/Stories`, `/Lists/Quotes` | Outcome stories and quotes, tagged by Lab and team |
| CCS | BrandAssets | `/sites/ccs/BrandAssets` | Organisation assets library: every file in `assets/` |
| Each Lab hub | Programme | `/sites/ccs-{lab}/Lists/Programme` | The Lab's programme, by stage (Sense, Understand, Act, Prove) and state |
| Frontier | Ideas | `/sites/ccs-frontier/Lists/Ideas` | Ideas from any colleague, with likes |
| Frontier | Experiments | `/sites/ccs-frontier/Lists/Experiments` | Each experiment by stage (Explore, Test, Decide, Handed over, Stopped) |
| Frontier | Radar | `/sites/ccs-frontier/Lists/Radar` | The technology radar's entries |
| Frontier | Methods toolkit | `/sites/ccs-frontier/Methods` | Templates and guides for running an experiment |
| Frontier | Documents | default library | One folder per experiment (`{experiment}/`), shown on its experiment page |
| Team business | Capabilities, Skills, Platforms | `/sites/ccs-{lab}-{team}/Lists/...` | What the team can do, its skills, the platforms it runs |
| Team business | Evidence | `/sites/ccs-{lab}-{team}/Evidence` | Controls evidence, one folder per solution |
| Team private | Portfolio, ToilLedger, Learning, CapabilityGaps | `/sites/ccs-{lab}-{team}-team/Lists/...` | Team-only working lists |

## Folder structures

CCS `BrandAssets` (organisation assets library):
```
BrandAssets/
  marks/            the CCS mark in every colourway and the Frontier mark, light and dark, SVG and PNG
  logos/            site logos (CCS, each Lab, Frontier) and footer logos
  backgrounds/      title-area backgrounds for every site, news thumbnails, section background
  images/           diagrams and strips (where we fit, lab family)
  icons/            route and interface icons, SVG
  motion/           GIF, MP4 and animated SVG
```

Team business site `Evidence` library:
```
Evidence/
  {solution}/        one folder per solution, e.g. claims-triage
    design/          design sign-off, architecture
    testing/         test packs
    controls/        control checks, DPIA, Responsible AI review
    run/             run books
```

Team private site `Documents` library:
```
Documents/
  01 Delivery/            briefs, showcases, release notes
  02 Service/             incident reviews, problem records
  03 Cost and value/      Finance packs, value sign-offs
  04 People and capability/
  05 Ways of working/     standards, templates
  99 Archive/             moved here by the quarterly review, never deleted by hand
```

Frontier `Documents` library:
```
Documents/
  {experiment}/      one folder per experiment, e.g. voice-notes-to-case-summaries
    plan/            the one-page plan and success measure
    evidence/        results, data notes, colleague feedback
    handover/        what the Lab receives through the front door
```

## Naming conventions

| Thing | Pattern | Example |
|---|---|---|
| Site title | Plain name | Automated Services |
| Lab hub title | Lab name + "Lab" | Automated Operations Lab |
| Private site title | Plain name + "Team" | Automated Services Team |
| Page file name | lower case, hyphens | `what-we-deliver.aspx` |
| List | Singular or plural noun, no spaces | `Solutions`, `Requests`, `Programme` |
| Column internal name | PascalCase, no spaces, set at creation | `BusinessArea`, `HeroJourney` |
| Entra group | `CCS-{lab}-{team}-{role}` | `CCS-AutoOps-Services-Editors` |
| Power BI workspace | `CCS Estate`, `CCS Estate (Dev)`, `(Test)` | |
| Power BI report | `CCS · {site}` | `CCS · 24x7 Services Lab` |
| Power BI report page | `{Level} · {Page} · {size}` | `Team · What we deliver · 16:9` |
| Flow | `CCS · {what it does}` | `CCS · Request update card` |
| Agent | `CCS agent` | |

## Source control

Keep the source in one Git repository (Azure DevOps or GitHub), so any site can be rebuilt:
```
ccs-sharepoint/
  provisioning/     PnP scripts
  lists/            list schemas, formatting JSON, seed data
  theme/            SharePoint and Power BI themes
  power-bi/deneb/   site configs and every spec
  agent/            instructions, topics, evaluation set
  assets/           the files in this pack's assets folder
```
