# Access and permissions

Access goes wrong when people are added one by one. Everything here is granted to groups, and every group has a named owner. Use Entra security groups for read access and Microsoft 365 groups only where a site is connected to Teams.

## Groups

| Group | Type | Members | Owner |
|---|---|---|---|
| `CCS-AllColleagues` | Entra security group, dynamic (department or company attribute = Wealth & Insurance) | Every colleague who should read CCS sites and reports | Business Platform Lead |
| `CCS-Platform-Owners` | Security | Business Platform Lead, Technology Platform Lead and one deputy | Business Platform Lead |
| `CCS-Platform-Editors` | Security | People who edit CCS pages and the shared lists | Business Platform Lead |
| `CCS-ProductOwners` | Security | Every Lab Product Owner and team Product Owner who triages requests | Business Platform Lead |
| `CCS-{lab}-Owners` (`CCS-247-Owners`, `CCS-AutoOps-Owners`, `CCS-Tooling-Owners`, `CCS-Insights-Owners`) | Security | The Lab Product Owner and Lab Engineering Lead | Lab Product Owner |
| `CCS-{lab}-Editors` | Security | Lab page editors | Lab Product Owner |
| `CCS-Frontier-Owners` | Security | Frontier Product Owner and Frontier Engineering Lead | Frontier Product Owner |
| `CCS-Frontier-Editors` | Security | Frontier champions who edit pages and experiments | Frontier Product Owner |
| `CCS-AutoOps-Services-Owners` | Security | 2 owners of the team business site | Team Product Owner |
| `CCS-AutoOps-Services-Editors` | Security | Team members who edit the business site | Team Product Owner |
| `Automated Services Team` | Microsoft 365 group (Teams-connected) | Everyone in the team | Team Product Owner |
| `CCS-Area-Insurance`, `-Pensions`, `-Investments`, `-SharedServices` | Security, dynamic by department | Colleagues in each business area, for Power BI row-level security and audience targeting | Business Platform Lead |
| `CCS-PowerBI-Builders` | Security | People who build reports and the semantic model (mostly Data & Insights) | Lab Product Owner, Data & Insights |
| `CCS-Agent-Makers` | Security | People who edit the agent in Copilot Studio | Technology Platform Lead |

Every other team copies the pattern: `CCS-{lab}-{team}-Owners`, `CCS-{lab}-{team}-Editors`, and one Microsoft 365 group per private team site.

## Site permissions

| Site | Owners | Members (edit) | Visitors (read) |
|---|---|---|---|
| `/sites/ccs` | `CCS-Platform-Owners` | `CCS-Platform-Editors` | `CCS-AllColleagues` |
| `/sites/ccs-{lab}` (each of the four Lab hubs) | `CCS-{lab}-Owners` | `CCS-{lab}-Editors` | `CCS-AllColleagues` |
| `/sites/ccs-frontier` | `CCS-Frontier-Owners` | `CCS-Frontier-Editors` | `CCS-AllColleagues` (plus Contribute on the Ideas list only) |
| `/sites/ccs-autoops-services` | `CCS-AutoOps-Services-Owners` | `CCS-AutoOps-Services-Editors` | `CCS-AllColleagues` |
| `/sites/ccs-autoops-services-team` | Team Product Owner and Engineering Lead | `Automated Services Team` | Nobody else |

Every site has at least two owners, so access requests never wait for one person.

## Lists and libraries with their own rules

| List | Location | Rule |
|---|---|---|
| Solutions catalogue | `/sites/ccs/Lists/Solutions` | Readable by `CCS-AllColleagues` (the agent and the team sites depend on it). Editable by `CCS-ProductOwners` and Lab editors. |
| Requests | `/sites/ccs/Lists/Requests` | Item-level permissions: read and edit own items only. `CCS-ProductOwners` get Edit on the list and see everything. Set with the provisioning script; check in List settings, Advanced settings. |
| Teams, Tools, Labs | `/sites/ccs/Lists/...` | Readable by `CCS-AllColleagues` (every Lab hub embeds them). Editable by `CCS-Platform-Editors`; each Lab Product Owner keeps their Lab's rows current. |
| Ideas | `/sites/ccs-frontier/Lists/Ideas` | Break inheritance on this list only: `CCS-AllColleagues` Contribute, so anyone can raise an idea and like others. Frontier editors manage Status. |
| Experiments, Radar | `/sites/ccs-frontier/Lists/...` | Readable by all; editable by `CCS-Frontier-Editors`. |
| Controls evidence | each team business site, `Evidence` library | Readable by all colleagues; editable by team editors. Retention label applied (see `10-governance-and-maintenance.md`). |

## Power BI

| Item | Setting |
|---|---|
| Workspaces | `CCS Estate (Dev)`, `CCS Estate (Test)`, `CCS Estate` (production), linked by a deployment pipeline |
| Workspace roles | Admin: `CCS-Platform-Owners`. Member: `CCS-PowerBI-Builders`. Nobody else. |
| Apps | One app per report (CCS, each Lab, Frontier, each team) from the production workspace, audience `CCS-AllColleagues` |
| Row-level security | Roles by business area mapped to the `CCS-Area-*` groups, plus an "All areas" role for `CCS-AllColleagues` on pages that show every area |
| Embedding | Power BI web part (secure embed). Viewers need access through the app or a workspace role; a link alone is not enough. |

Microsoft 365 E7 includes Power BI Pro for everyone, so viewing works without capacity, provided each viewer has access to the report through the app.

## Agent

| Item | Setting |
|---|---|
| Environment | `CCS Agents` Power Platform environment, makers: `CCS-Agent-Makers` |
| Sharing | Share the published agent with `CCS-AllColleagues` |
| Knowledge permissions | The agent only answers from content the person asking can open, so the Solutions catalogue and platform pages must stay readable by everyone |
| Flows | Run in the `CCS Agents` environment, owned by the service account `svc-ccs-automation`, using connection references |

## What to ask for, and from whom

Copy these requests into your service desk tool. Each names exactly what is needed so it isn't bounced back.

**SharePoint admin**
> Please register /sites/ccs (Colleague & Customer Service) as a hub site, and register /sites/ccs-247, /sites/ccs-autoops, /sites/ccs-tooling and /sites/ccs-insights as hub sites joined to it. Please associate /sites/ccs-frontier with the CCS hub. Please register /sites/ccs/BrandAssets as an organisation assets library (image type) and add the six tenant themes in the attached JSON files, named as the files are ("CCS platform-navy" and so on). Please add app.powerbi.com to HTML Field Security on these sites so the Embed web part can show Power BI. Owners as in the attached table.

> Please run the oversharing report for the CCS sites and enable Restricted Content Discovery on any site that should not appear in Copilot answers, before we publish our agent.

**Entra (identity) admin**
> Please create the security groups in the attached table, including CCS-AllColleagues and the CCS-Area groups as dynamic groups using the department attribute, with the named owners.

**Power BI admin**
> Please allow the certified custom visual Deneb (AppSource) for CCS-PowerBI-Builders, create the three CCS Estate workspaces with a deployment pipeline, and confirm secure embed in SharePoint is enabled for the tenant.

**Power Platform admin**
> Please create the CCS Agents environment, add CCS-Agent-Makers as makers, allow the SharePoint, Teams and Approvals connectors under the environment's data policy, and allow publishing the agent to Microsoft 365 Copilot, Teams and SharePoint. Please register the agent in Agent 365 when it is ready for review.

**Teams admin**
> Please allow the Workflows app to post adaptive cards to colleagues for the CCS request update flow, and allow the CCS agent app once it is published.

**Compliance (Purview) admin**
> Please confirm the sensitivity label for the CCS sites (Internal) and the retention label for controls evidence (keep for 7 years after the solution is retired).

## When access goes wrong

| Symptom | Usual cause | Fix |
|---|---|---|
| Power BI web part shows "You don't have access" | Viewer is not in the app audience | Add the group to the app audience, then republish the app |
| Power BI web part shows the wrong area's figures | RLS role mapping or group membership | Check the person's `CCS-Area-*` membership and the role mapping in the semantic model |
| Power BI web part is blank for everyone | Report moved or the embed link points at Dev | Re-pick the report from the production workspace in the web part |
| An Embed web part showing a CCS list is empty or asks to sign in | The viewer can't read the CCS list, or the address lacks `env=WebViewList` | Check `CCS-AllColleagues` has Read on the list; re-copy the view address and add `?env=WebViewList` |
| An Embed web part showing Power BI says the content can't be shown | `app.powerbi.com` isn't allowed on that site | Site settings, HTML Field Security, add `app.powerbi.com` |
| Someone sees other people's requests | Item-level permission was reset | List settings, Advanced settings: Read access "Read items that were created by the user" |
| The agent says it has no information | The source isn't readable by that person, or isn't indexed yet | Check permissions; allow up to 24 hours after adding new content |
| A flow stopped | It was owned by a person who left | Move it to the service account with connection references |
| An access request goes nowhere | Site access requests go to a person who left | Site settings, Access requests: send to the owners group's email |
