# Governance and maintenance

The estate stays current because facts live in lists, Power BI and Entra profiles, and pages only hold words that rarely change. Each team site ends up with about six pages of prose.

## Who owns what

| Owner | Owns |
|---|---|
| Business Platform Lead | The CCS hub pages, the front door and its routes, How we count value, the Labs list, brand and themes, the CCS agent's instructions |
| Technology Platform Lead | Provisioning scripts and templates, Trust and controls, the Tools list, the agent's environment, flows and knowledge sources, access groups |
| Lab Product Owner (each Lab) | The Lab hub pages, the Programme list, the Lab rules, the Lab's rows in the Teams list, the Lab's KPI strip |
| Lab Engineering Lead (each Lab) | The Lab's tools and skills page, the Lab's rows in the Tools list, the Lab's licences |
| Lab Product Owner, Data & Insights | The semantic model, every report and the Deneb specs |
| Frontier Product Owner and Engineering Lead | Frontier pages, the Ideas, Experiments and Radar lists, the methods toolkit, handovers to Labs |
| Team Product Owner | The team's rows in shared lists, its business-site pages, its private site, its Evidence library |
| Every page | One named owner and a Review by date in page details |

## Rules

1. Pages hold words; lists and Power BI hold facts. Numbers, solutions, requests, people and stories are never typed into a page.
2. No new pages without a request through the front door. Each site has its fixed page set (see `03-sites-urls-and-folders.md`).
3. Structure lives in code. Change the template or script in Git and redeploy; never fix 30 sites by hand.
4. Solution pages create and retire themselves from the catalogue.
5. News expires after 90 days (news pages get an expiry date; a flow moves expired posts to an archive folder).
6. Brand assets come only from the organisation assets library.
7. Frontier never runs live service. When an experiment proves out it is handed to a Lab through the front door, with its evidence; the Lab builds and runs it.

## Cycles

| When | What | Who |
|---|---|---|
| Weekly | Page review reminder flow emails owners whose review date has passed | Automatic |
| Monthly | News digest to stakeholders (SharePoint news digest from CCS, rolling up every Lab and Frontier) | Business Platform Lead |
| Monthly | Ideas review: shortlist, choose or park every New idea; tell each person who raised one | Frontier Product Owner |
| Quarterly | One hour per site: page analytics, cut pages nobody reads, check Review by dates, check the catalogue for solutions with no page | Service Team |
| Quarterly | Value statements sent to each area's leadership | Automatic (Power BI subscription) |
| Quarterly | Technology radar review (Radar list) and Tools list review | Frontier Engineering Lead with the Technology Platform Lead |
| Twice a year | Agent evaluation set rerun; instructions and knowledge reviewed | Business Platform Lead |
| Yearly | Access review of every owners and editors group | Group owners |

## Lifecycle and compliance

- Sensitivity label "Internal" on every CCS site.
- Retention label on the Evidence library: keep for 7 years after the solution is retired.
- Inactive site policy (SharePoint Advanced Management): owners are asked to confirm sites with no activity for 6 months.
- Restricted Content Discovery on any site that should not surface in Copilot answers.
- Accessibility: every page checked with the accessibility checker before publishing; a short accessibility statement on the platform site.

## Making a new Lab or team

1. Request through the front door.
2. The Technology Platform Lead runs the provisioning script with the new codes (`ccs-{lab}` or `ccs-{lab}-{team}`); it applies the templates, theme, navigation and groups.
3. The team adds its row to the Teams list on CCS (it then appears on the Labs page and its Lab's pages), fills its pages and its rows in the shared lists. Nothing else is needed.

A new Lab copies a Lab hub: a code, a colour ramp in `04-design-spec.md`, a theme, a mark, a title image, a row in the Labs list, and its Programme list.
