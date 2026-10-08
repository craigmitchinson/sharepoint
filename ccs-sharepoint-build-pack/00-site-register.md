# Site register

Title, address and description for every site, as you type them when creating the site (Create site, or `New-PnPSite`). Address assumes the tenant `https://{tenant}.sharepoint.com`. Descriptions are kept under 150 characters so they show in full in search and site cards.

| Site | Type | Title | Address | Description |
|---|---|---|---|---|
| CCS platform | Communication, hub | Colleague & Customer Service | `/sites/ccs` | The automation, tools and insight behind our colleagues and customers. One front door to every Lab and team. |
| Lab | Communication, hub joined to CCS | 24x7 Services Lab | `/sites/ccs-247` | Keeps every CCS service running around the clock: monitoring, incident response, resilience and safe releases. |
| Lab | Communication, hub joined to CCS | Automated Operations Lab | `/sites/ccs-autoops` | Digital workers, apps and agents that take routine work off colleagues, so time goes on decisions and customers. |
| Lab | Communication, hub joined to CCS | Colleague Tooling Lab | `/sites/ccs-tooling` | The tools colleagues use every day: case and claims workspaces, knowledge, and the desktop that joins them up. |
| Lab | Communication, hub joined to CCS | Data & Insights Lab | `/sites/ccs-insights` | One trusted set of numbers behind every decision on the platform, from the estate model to every dashboard. |
| Forum | Communication, associated with CCS | Frontier | `/sites/ccs-frontier` | Bring us a problem. We test new ways to solve it with you, check what CCS already runs, and share what we learn. |
| Forum | Team (Teams-connected), associated with CCS | Frontier Team | `/sites/ccs-frontier-team` | Where Frontier experiments are worked on: one channel per experiment, drafts and sandbox notes. |
| Team | Communication, joined to its Lab | Automated Services | `/sites/ccs-autoops-services` | Digital workers and Power Platform that take routine work off your teams. What we run, what it delivers, how to ask. |
| Team | Team (Teams-connected), joined to its Lab | Automated Services Team | `/sites/ccs-autoops-services-team` | The Automated Services team's working site: delivery, service, cost and value, capability and ways of working. |

Every other team follows the Automated Services pattern: title is the team name (private site adds "Team"), address `ccs-{lab}-{team}` and `ccs-{lab}-{team}-team` (see `03-sites-urls-and-folders.md` for each code), and the description says what the team does for the people it serves in one sentence, then what the site holds.

| Team | Business site description |
|---|---|
| Monitoring | Watches every CCS service and automation, raises the alarm early, and shows how each one is performing. |
| Incident Response | On call around the clock for anything stopping work. How to reach us, what happens next and what we learned. |
| Resilience | Recovery plans and testing for critical services, so a failure costs minutes, not days. |
| Release Management | Safe changes into production: what is releasing when, and how to get a change on the calendar. |
| Agent Engineering | Builds and shadow-tests the Lab's agents. Agents prepare, people decide. |
| Process Intelligence | Finds the next work worth automating, from how work is really done today. |
| Case Tools | The case and claims workspaces colleagues work in, and the changes coming to them. |
| Knowledge | Answers and guidance at the point of need, kept right and easy to find. |
| Desktop | The colleague desktop and its integrations, so the right screen is one click away. |
| Reporting | The CCS estate model and every dashboard built on it. |
| Data Engineering | The pipelines that feed every CCS report, on time and checked. |

Where to set them: the title and description go in the create-site panel (or Settings, Site information afterwards); the address is set at creation and changed only by a SharePoint admin.
