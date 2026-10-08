# Build guide

Work through the steps in order. Each step names who does it and what must be true before moving on. Sizes and settings are in `04-design-spec.md` and the page build sheets; this guide is the sequence.

## Step 0. Decisions and admin requests (before any build)

| Decision or request | Who | Done when |
|---|---|---|
| Site names and addresses (see `03-sites-urls-and-folders.md`) | Business Platform Lead | Signed off |
| Site colours: navy CCS, crimson Automated Operations, burnt orange 24x7 Services, blue Colleague Tooling, teal Data & Insights, purple Frontier | Business Platform Lead | Agreed with brand |
| Front door: one CCS intake with four routes, routed to every Lab and team | Business Platform Lead with each Lab Product Owner | Agreed in writing |
| Definition of value | Finance business partner | "How we count value" signed off |
| Admin requests raised (wording in `02-access-and-permissions.md`) | Technology Platform Lead | All approved |

Microsoft 365 E7 covers the licences: every colleague has Power BI Pro, so they can see Power BI on pages, and Microsoft 365 Copilot, so they can use the agent. Agent actions that call Power Automate flows run under the flow owner's licence; confirm with your Power Platform admin whether the agent's message volume needs Copilot Studio capacity.

## Step 1. Sites and hubs

1. Run `08-provisioning/Provision-Sites.ps1` as a SharePoint admin. It adds the six themes, creates CCS, the four Lab hubs and Frontier, registers the hubs, joins each Lab hub to CCS, associates Frontier with CCS, and creates and joins the Automated Services business site.
2. Create the Automated Services Team private site from Teams (so it has a team and channels), then run the script with `-AssociatePrivateSite`.
3. CCS hub navigation (Site settings, Navigation on the hub): Home, Labs (with the four Labs beneath), Find a solution, Tools and partners, Front door, Trust and controls, How we count value, Frontier, News. Turn CCS's own site navigation off.
4. Each Lab hub's navigation: its team sites and its pages, as in its page build sheet. Frontier's site navigation: Home, Ideas, Experiments, Showcase, Methods, Get involved.
5. Check: a team site shows its Lab's navigation; a Lab hub lists CCS as its parent hub in Site information; Frontier shows the CCS navigation and its own purple header.

## Step 2. Brand and theme

1. Upload `assets/` to `BrandAssets` on CCS, keeping the folders. The script has registered it as an organisation assets library, so every site's image picker shows the same files.
2. The script applies each site's theme and logo. Check Change the look on each site: Header layout Compact, site title shown, logo as in `04-design-spec.md`; Footer on with the platform mark.
3. Allow Power BI in the Embed web part: on every site that embeds a KPI strip, Site settings, HTML Field Security, add `app.powerbi.com`.
4. Check: the header is one 64 px row with the hub bar above it, and each site's buttons and links are its own colour.

## Step 3. Lists

1. Run `Provision-Lists.ps1 -Site Platform` against CCS with `-SeedData`. It builds Solutions, Requests (four content types), Contacts, Stories, Quotes, Labs, Teams and Tools, with views, formats and example rows.
2. Note the four form links it prints. They go into every "How can we help?" Quick links web part on every site.
3. Run it for each Lab hub (`-Site Lab`, Programme), Frontier (`-Site Frontier`: Ideas, Experiments, Radar), the team business site and the team private site.
4. Create the board and gallery views named in `lists.json` in the browser, then rerun with `-ApplyCardFormats`. Turn on Likes for Ideas (List settings, Rating settings).
5. Check: Requests shows people only their own items; the Solutions, Teams and Tools lists are readable by all colleagues; Ideas lets any colleague add an item.

## Step 4. Power BI

1. Create the workspaces and the shared semantic model as `06-power-bi/README.md` describes, with row-level security by business area.
2. Import the site's theme from `theme/powerbi-theme-{site}.json` into each report. Add Deneb from AppSource (certified) once your Power BI admin has allowed it.
3. Build each page at the size listed, with the Deneb spec named for each visual and the site's config from `06-power-bi/deneb/`.
4. Publish an app per report with the audiences in `02-access-and-permissions.md`.
5. Check: a colleague outside the team opens each page and sees only their area where row-level security applies.

## Step 5. Pages

Build every page from `05-page-build-sheets/`: CCS first, then the four Lab hubs, then Frontier, then the team sites. Keep the offline copy (`design/offline/index.html`) open beside SharePoint and turn on Web part labels. Publish nothing until every page on a site is built.

## Step 6. Flows

| Flow | Trigger | Does |
|---|---|---|
| Request routing | Requests item created | Sets Lab and Team from the matched solution or the Teams list, notifies that team's Product Owner (Lab Product Owner if no team is clear) |
| Request update card | Requests item status changed | Posts the adaptive card to the requester in Teams |
| Solution page | Solutions item set to Live | Creates the solution page from the template and fills its page properties |
| Solution retirement | Solutions item set to Retired | Marks the page retired and moves it to `SitePages/solutions/retired` |
| Experiment page | Experiments item created | Creates the experiment page and its document folder on Frontier |
| Idea to experiment | Ideas item set to Chosen | Creates the Experiments item at Explore, linked to the idea, and tells the person who raised it |
| Experiment handover | Experiments item set to Handed over | Raises a "Bring us something new" request on CCS for the receiving Lab with the evidence folder attached |
| Page review reminder | Weekly | Emails page owners whose Review by date has passed |
| Agent: create request | Called by the agent | Creates a Requests item as the person asking and returns its link |
| Agent: my requests | Called by the agent | Returns the person's open requests |
| Agent: find similar | Called by the agent | Searches Solutions and returns the top three |

Every flow runs from a solution in the CCS Power Platform environment with connection references, owned by a service account, never by an individual.

## Step 7. The agent

Follow `09-agent/README.md`: build in Copilot Studio, add knowledge and actions, run the evaluation set, shadow-test, then publish to Teams, Microsoft 365 Copilot and every CCS site.

## Step 8. Search

Microsoft Search bookmarks: "automate", "automation", "front door", "Blue Prism", "digital worker", "bot" go to the front door; "innovation", "idea", "Frontier" go to Frontier. Acronyms: DW (digital worker), PO (Product Owner), RAI (Responsible AI), FTE (full-time equivalent).

## Step 9. Launch checks

- Every page passes the accessibility checker; every image has alt text or is marked decorative.
- Every Power BI visual has alt text and "show as table" on.
- No page carries more than three Power BI visuals.
- Every page has an owner and a Review by date.
- The four form links open the right content types from every site.
- A request raised by a colleague outside CCS reaches the right Product Owner and returns a Teams card on status change.
- An idea marked Chosen on Frontier creates its experiment.
- The mock data is gone.
