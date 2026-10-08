# Team private site: Automated Services Team (`/sites/ccs-autoops-services-team`)

Theme: CCS automated-operations (crimson (inherited from the Lab hub)). Header: Compact layout.
Hub navigation: Automated Operations Lab hub (associated with the CCS platform hub). Links: About the Lab, Automated Services, Agent Engineering, Process Intelligence, Front door, CCS platform.
Site navigation: Home, Delivery, Service, Cost and value, Capability, Ways of working, Documents, Conversations, Recycle bin, Edit.
Footer: none.

Each table lists the page top to bottom. "Web part and settings" is exactly what to add; "Content" is the opening of the copy as designed (open the page in the offline copy for every word). Background: None is white, Neutral is the grey section background, Soft and Strong are the theme section backgrounds.

## Home

Address: `/sites/ccs-autoops-services-team` · Design: `TeamHome` in the offline copy and on the canvas.

| # | Background | Layout | Web part and settings | Content |
|---|---|---|---|---|
| Title | Plain | Full width | Title area · Plain layout | Automated Services Team |
| 1 | None | One column | Text web part | Everything the team needs day to day: what is live, what is moving, and where things are. |
| 2 | None | One column | Embed web part · Power BI secure embed, iframe height 220 | Availability, last 7 days 99.2% Target 99.5% Failed cases today 37 ▼ 12 vs yesterday Open incidents 2 0 priority 1 Requests waiting 14 Oldest 9 days |
| 3 | Neutral | One column | Embed web part · Power BI, site and front door measures, height 220 | Requests through the front door 84% ▲ from 41% by email Median time to qualify 6 days Target 10 days Solution pages read by Risk and Audit 212 This quarter Agent answers needing no person 41% Shadow testing, 312 question |
| 4 | None | Two columns | News web part · list layout | WorkHQ migration: what changes for build and run Platform team · 3 Oct New standard: Python services and versioning Engineering Lead · 26 Sep Lab update: first agent enters shadow replay Lab · 19 Sep |
|  |  |  | Events web part · compact layout | OCT 14 Showcase: Wealth & Insurance takeover 14:00 · Auditorium and Teams |
| 5 | Neutral | One column | Quick links web part · tiles layout, custom images | Intake triage Delivery board Flightdeck Liftoff Controls Centre Estate dashboard Dynatrace Blue Prism Control Room |
| 6 | None | One column | Document library web part | Recent documents |

## Delivery

Address: `SitePages/delivery.aspx` · Design: `TeamDelivery` in the offline copy and on the canvas.

| # | Background | Layout | Web part and settings | Content |
|---|---|---|---|---|
| Title | Plain | Full width | Title area · Plain layout | Delivery |
| 1 | None | One column | Text web part | Every piece of work, the gate it is at, and who has it. The delivery board is the source; this page is the view. |
| 2 | None | One column | Embed web part · Power BI secure embed, iframe height 180 | Gate 1 Qualified 18 Gate 2 Viable 11 Gate 3 Ready to build 7 Gate 4 Ready to test 5 Gate 5 Ready to release 3 Gate 6 Sustained 142 |
| 3 | None | Two columns | Power BI web part · 16:9 report page | Work in flight by squad Items at any gate before Sustained Squad 1 6 Squad 2 5 Squad 3 7 Squad 4 4 |
|  |  |  | Power BI web part · 16:9 report page | Time at current gate Over 20 days highlighted Viable 12 days Ready to build 31 days Ready to test 9 days Ready to release 6 days |
| 4 | Neutral | One column | List web part · Portfolio (shape, size and gate columns formatted) | Portfolio |
| 5 | None | One column | List web part · LabInvestigations · grouped by Stage, State formatted | Lab investigations |

## Service

Address: `SitePages/service.aspx` · Design: `TeamService` in the offline copy and on the canvas.

| # | Background | Layout | Web part and settings | Content |
|---|---|---|---|---|
| Title | Plain | Full width | Title area · Plain layout | Service |
| 1 | None | One column | Text web part | Keeping the estate live, and turning the work that drains us into automation of its own. |
| 2 | None | One column | Embed web part · Power BI secure embed, iframe height 220 | Availability, this month 99.2% Target 99.5% Cases failed and reworked 3.6% ▼ 0.8 pts Mean time to fix 3.4 hrs ▼ 1.1 hrs Toil, hours a month 101 ▼ 46 since baseline |
| 3 | None | Two columns | Power BI web part · 16:9 report page | Incidents by digital worker Last 30 days, top four DW-Claims-01 23 DW-KYC-03 15 DW-Transfers-02 11 DW-Policy-05 7 |
|  |  |  | Power BI web part · 16:9 report page | Failure cause Last 30 days Target system change 46% Bad input data 31% Infrastructure 14% Our defect or other 9% |
| 4 | Neutral | One column | List web part · ToilLedger (Effort and Status formatted, sorted by Rank) | Toil ledger |
| 5 | None | One column | Power BI web part · table visual on the Requests list | Request Type Solution Squad Waiting Claims bot skipped cases with a missing policy number Problem DW-Claims-01 Service 2 days Run the KYC refresh overnight instead of 9am Change DW-KYC-03 Service 5 days Death claim notif |

## Cost and value

Address: `SitePages/cost-and-value.aspx` · Design: `Costs` in the offline copy and on the canvas.

| # | Background | Layout | Web part and settings | Content |
|---|---|---|---|---|
| Title | Plain | Full width | Title area · Plain layout | Cost and value |
| 1 | None | One column | Text web part | The full commercial picture. The business site shows the return; the breakdown stays here. |
| 2 | None | One column | Embed web part · Power BI secure embed, iframe height 220 | Run cost, this year £2.9m 96% of budget Value, this year £8.4m ▲ 12% vs last year Return on run cost 2.9x Value ÷ run cost Cost per case £0.31 By hand: £4.80 |
| 3 | None | Two columns | Power BI web part · 16:9 report page | Where the money goes Share of run cost, this year People · 58% Onshore and offshore Licences · 22% Blue Prism, Power Platform, Google Cloud Infrastructure · 12% Runtime machines, cloud, monitoring Hub recharge · 8% Stand |
|  |  |  | Power BI web part · 16:9 report page | Licence use Capacity used against capacity paid for Blue Prism runtimes 52 of 72 Power Automate 24 of 50 Google Cloud spend £61k of £100k Copilot Studio 23k of 100k |
| 4 | Neutral | One column | Power BI web part · table visual | Process Cases this year Our cost per case By hand Saving per case Value this year Claims triage 186,400 £0.18 £4.10 £3.92 £731k Investment KYC refresh 121,600 £0.27 £6.30 £6.03 £733k Pension transfers 42,900 £0.42 £9.80 |
| 5 | None | Two columns | Power BI web part · 16:9 report page | Headcount and output Indexed to 2023 = 100 ━ Headcount (flat) ━ Cases completed |
|  |  |  | Text web part | Rules for these numbers |

## Capability

Address: `SitePages/capability.aspx` · Design: `TeamCapability` in the offline copy and on the canvas.

| # | Background | Layout | Web part and settings | Content |
|---|---|---|---|---|
| Title | Plain | Full width | Title area · Plain layout | Capability |
| 1 | None | One column | Text web part | Where our skills sit on the Dreyfus scale, and what each of us is working on next. Competent is the baseline for anything you work in regularly. |
| 2 | None | One column | Power BI web part · matrix with conditional formatting | Team capability by domain People at each level, from Liftoff self-assessments Domain Novice Adv. beginner Competent Proficient Expert Blue Prism 1 3 8 12 5 Power Platform 3 5 8 3 1 Agents and workflows 5 8 5 3 1 Python s |
| 3 | None | Two columns | Power BI web part · 16:9 report page | Primary skillsets by squad Lead included Service 6 4 Squad 1 3 2 Squad 2 2 3 Squad 3 1 4 Squad 4 3 2 ■ Digital Worker ■ AI engineering ■ Power Platform |
|  |  |  | List web part · Learning (filtered to open items) | Learning in flight Update in Liftoff |
| 4 | Neutral | Two columns | List web part · CapabilityGaps | Gaps to close |
|  |  |  | Power BI web part · 16:9 report page | Certifications held Current, by certification Blue Prism Developer 21 Power Platform PL-400 9 Google Cloud Associate 4 Dynatrace Associate 3 |

## Ways of working

Address: `SitePages/ways-of-working.aspx` · Design: `TeamWays` in the offline copy and on the canvas.

| # | Background | Layout | Web part and settings | Content |
|---|---|---|---|---|
| Title | Plain | Full width | Title area · Plain layout | Ways of working |
| 1 | None | One column | Text web part | The standards we hold each other to. If it is not here, ask before you invent it. |
| 2 | None | One column | Text web part · table | Gates and the evidence each one needs |
| 3 | Neutral | Two columns | Text web part · table | Sizing |
|  |  |  | Text web part | Delivery shapes |
| 4 | None | Two columns | Text web part | AI and decisions |
|  |  |  | Document library web part | Standards library |
