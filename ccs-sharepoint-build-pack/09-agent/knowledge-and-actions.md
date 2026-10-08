# Knowledge and actions

## Knowledge sources (Copilot Studio)

| Source | Type | Address | Why |
|---|---|---|---|
| Solutions catalogue | SharePoint list | `/sites/ccs/Lists/Solutions` | Find existing solutions by what they do, owner, area, journey |
| Contacts | SharePoint list | `/sites/ccs/Lists/Contacts` | Name the right person when the agent can't help |
| Teams | SharePoint list | `/sites/ccs/Lists/Teams` | What every team does, so a need with no matching solution still lands with the right team |
| Tools | SharePoint list | `/sites/ccs/Lists/Tools` | Which tools CCS runs and who owns them |
| Platform pages | SharePoint site | `/sites/ccs` (Front door, Trust and controls, How we count value, Find a solution, Labs, Tools and partners) | Routes, time promises, controls, value rules |
| Frontier | SharePoint site | `/sites/ccs-frontier` (pages, Ideas, Experiments) | Whether an idea is already being tested, and how to raise one |
| Lab programmes | SharePoint sites | `/sites/ccs-autoops`, `/sites/ccs-247`, `/sites/ccs-tooling`, `/sites/ccs-insights` | What each Lab is working on |
| Team business sites | SharePoint sites | `/sites/ccs-*-*` (business sites only, never `-team` private sites) | Capabilities, platforms, solution pages, stories |

Never add the Requests list as knowledge: requests are private to the person who raised them. The agent reads requests only through the "My requests" action, which runs as the person asking.

Answers respect permissions: the agent only uses content the person can open.

## Actions (Power Automate flows as tools)

| Action | Inputs | Does | Returns |
|---|---|---|---|
| Create a request | Route (Question, Problem, Change, New idea), Title, Details, Solution (optional), Suggested team (optional), Volume, Minutes per case (optional) | Creates a Requests item as the person asking. Lab and Team come from the matched solution; otherwise from the suggested team in the Teams list; otherwise they stay "Routing" for the Lab Product Owners to assign | Request ID and link |
| My requests | none | Reads the person's own open Requests items | Title, Type, Status, Team, Raised |
| Find similar solutions | Description | Searches the Solutions list (title, description, hero journey) | Top 3 with Lab, Team, area, link |

Each flow runs in the `CCS Agents` environment with connection references, owned by `svc-ccs-automation`, and acts as the signed-in person for Requests so item-level permissions hold.

## How routing works

The colleague never chooses a Lab or team. The agent works it out in this order, and a person always confirms:

1. A matching solution in the Solutions catalogue: its Lab and Team take the request (a problem with Claims triage goes to Automated Services).
2. No solution, but a team whose description in the Teams list fits: the agent suggests that team (a slow Pega screen goes to Case Tools in Colleague Tooling).
3. Neither: the request is created with Lab and Team set to "Routing", and the Request routing flow tells the Lab Product Owners, who assign it within one working day.

The Request routing flow notifies the team's Product Owner, who can pass it to another team in one step. Every change of team is kept in the item's history, so the routing improves from real cases, and the evaluation set grows from them.
