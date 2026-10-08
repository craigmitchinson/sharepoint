# Power BI

One semantic model, thin reports per level, Deneb for every chart, the CCS theme for everything else.

## Workspaces and model

| Item | Setting |
|---|---|
| Workspaces | `CCS Estate (Dev)`, `CCS Estate (Test)`, `CCS Estate`, joined by a deployment pipeline |
| Semantic model | `CCS Estate model`, in the production workspace, refreshed daily at 06:00 |
| Sources | Blue Prism and Power Platform run logs (via the estate database), the platform Solutions, Requests and Teams lists, the Frontier Ideas, Experiments and Radar lists, Finance cost allocations, the HR extract for headcount and skills (Liftoff self-assessments for the Dreyfus levels) |
| Reports | Thin reports connected live to the model: `CCS · Platform`, one per Lab, `CCS · Frontier`, then one per team and one per private team site |
| Apps | One per report, audience `CCS-AllColleagues` (team private report: `Automated Services Team` only) |

Core tables: `Solutions` (catalogue), `Runs` (one row per case processed: solution, date, outcome, minutes), `Costs` (monthly cost to run by solution and category), `Baselines` (minutes per case by hand, per solution), `Requests`, `Dates`.

Core measures (DAX):
```
Cases = COUNTROWS ( Runs )
Minutes saved = SUMX ( Runs, RELATED ( Baselines[MinutesByHand] ) - Runs[Minutes] )
Capacity returned (hours) = DIVIDE ( [Minutes saved], 60 )
Capacity returned (FTE) = DIVIDE ( [Capacity returned (hours)], 1650 )
Value = [Capacity returned (hours)] * 19.60 + SUM ( Costs[CostAvoided] )
Cost to run = SUM ( Costs[Amount] )
Return = DIVIDE ( [Value], [Cost to run] )
Cost per case = DIVIDE ( [Cost to run], [Cases] )
Value label = FORMAT ( [Value], "£#,0.0,,m" )
```
The hourly rate (£19.60 here) and FTE hours (1,650) come from Finance and are stored in a `Parameters` table, not typed into measures.

Row-level security: role `Area` filters `Solutions[BusinessArea]` by the viewer's group (`CCS-Area-*`); role `All areas` has no filter. Pages that compare every area use the All areas role.

## Pages

Every Power BI visual on the designs, with the report it lives in and the Deneb spec that draws it.

| Report | Visual | Page size | Deneb spec | On the page |
|---|---|---|---|---|
| Platform | CCS KPI strip: live solutions, value this year, capacity returned, requests this quarter | 1280 × 220 | 4 × `kpi-card` | CCS Home |
| Lab (one report per Lab) | Lab KPI strip (four measures named on each Lab home) | 1280 × 220 | 4 × `kpi-card` | Each Lab home |
| Lab | People at Proficient or Expert, by skill | 1280 × 720 | `bars-by-category` | Each Lab's Tools and skills |
| Frontier | Frontier KPI strip: ideas raised, experiments run, handed to a Lab, colleagues taken part | 1280 × 220 | 4 × `kpi-card` | Frontier Home |
| Frontier | Minutes to write a case summary (by hand against voice note) | 1280 × 720 | `bar-horizontal-target` | Experiment page |
| Frontier | Summaries accepted with small edits, by week, against target | 1280 × 720 | `weekly-target-columns` | Experiment page |
| Frontier | Technology radar, from the Radar list | 1280 × 720 | `technology-radar` | Methods |
| Team | Team KPI strip (RLS): cases, capacity returned, value, cost per case | 1280 × 220 | 4 × `kpi-card` | Team Home |
| Team | Cases completed by business area | 1280 × 720 | `bars-by-category` | Team Home |
| Team | Value against run cost, by quarter | 1280 × 720 | `column-value-vs-cost` | What we deliver, Value statement |
| Team | Cost per case against by hand | 1280 × 720 | `bar-horizontal-target` | What we deliver |
| Team | Hero journeys table | 1280 × 720 | Table visual (theme) | What we deliver |
| Team | Primary skillsets | 1280 × 720 | `spend-split` | Our people |
| Team | Solution KPI strip, filtered to one solution by URL | 1280 × 220 | 4 × `kpi-card` | Solution pages |
| Team | Claims handled by month | 1280 × 720 | `monthly-columns` | Solution pages |
| Team | Exceptions this quarter, by reason | 1280 × 720 | `bars-by-category` | Solution pages |
| Team | Value statement KPI strip (RLS) | 1280 × 220 | 4 × `kpi-card` | Value statement |
| Team | Your pipeline, by stage | 1280 × 720 | `gate-pipeline` | Value statement |
| Team | Solutions in your area table | 1280 × 720 | Table visual (theme) | Value statement |
| Private | Estate right now KPI strip; front door measures KPI strip | 1280 × 220 | 4 × `kpi-card` each | Private Home |
| Private | Gate pipeline | 1280 × 180 | `gate-pipeline` | Delivery |
| Private | Work in flight by squad | 1280 × 720 | `bars-by-category` | Delivery |
| Private | Time at current gate | 1280 × 720 | `bar-horizontal-target` | Delivery |
| Private | Service KPI strip | 1280 × 220 | 4 × `kpi-card` | Service |
| Private | Incidents by digital worker | 1280 × 720 | `bars-by-category` | Service |
| Private | Failure cause | 1280 × 720 | `spend-split` | Service |
| Private | Requests waiting table (from the Requests list) | 1280 × 720 | Table visual (theme) | Service |
| Private | Cost KPI strip | 1280 × 220 | 4 × `kpi-card` | Cost and value |
| Private | Where the money goes | 1280 × 720 | `spend-split` | Cost and value |
| Private | Licence use against capacity paid for | 1280 × 720 | `bar-horizontal-target` (Track = capacity) | Cost and value |
| Private | Cost per case by process table | 1280 × 720 | Table visual (theme) | Cost and value |
| Private | Headcount and output, indexed | 1280 × 720 | `trend-line` | Cost and value |
| Private | Team capability by domain | 1280 × 720 | Matrix visual with conditional formatting (theme); `heatmap-capability` if you prefer Deneb | Capability |
| Private | Primary skillsets by squad | 1280 × 720 | `stacked-bars` | Capability |
| Private | Certifications held | 1280 × 720 | `bars-by-category` | Capability |

Where a chart sits in a Two columns section on its page build sheet, build its page at 640 × 360 rather than 1280 × 720 (see Page sizes below). Frontier's own specs, already in purple, and placeholder images for every Frontier visual are in the separate Frontier build pack.

Reports: `CCS · Platform`, one per Lab (`CCS · 24x7 Services Lab` and so on), `CCS · Frontier`, `CCS · Automated Services` and `CCS · Automated Services Team`. Each uses the Power BI theme for its site from `theme/` (`powerbi-theme-{site}.json`).

KPI strips sit on a custom-size page and are embedded with the Embed web part at a fixed height, because the Power BI web part only offers 16:9 and 4:3. Everything else uses the Power BI web part at 16:9.

Page sizes: a chart that sits in a half-width column (two-column section) is built on a 640 × 360 page (Canvas settings, Custom), so its text is still the designed size when SharePoint fits it into 586 px. A full-width chart uses 1280 × 720. Margins 20 px on every side. Visual container: title off (Deneb draws its own title), background off, border off, padding 0; the page background is white.

## Deneb

1. Add Deneb from AppSource (certified). Your Power BI admin must allow it (see `02-access-and-permissions.md`).
2. Add a Deneb visual, add the fields named in the spec's `description`, open the editor, choose Vega-Lite, and paste the spec from `deneb/specs/`.
3. In the Config tab, paste the config for the report's site: `deneb/ccs-config-{site}.json` (platform-navy, automated-operations, 24x7-services, colleague-tooling, data-and-insights, frontier). It holds every colour, font and style.
4. The specs are drawn in Automated Operations crimson. For another site, replace the five accent values in the spec before pasting:

| Crimson in the spec | Platform navy | 24x7 Services | Colleague Tooling | Data & Insights | Frontier |
|---|---|---|---|---|---|
| #CE143D | #243B6B | #B84C14 | #18519D | #00838F | #4F2391 |
| #A11030 | #1C2E53 | #8F3A0E | #133F7A | #006670 | #2E1458 |
| #E2728B | #7C89A6 | #E58A5A | #7497C4 | #66B5BC | #7A4CC4 |
| #ECA6B5 | #ACB5C7 | #F2BC9C | #A7BDDA | #9ED0D4 | #D3C3EE |
| #F6D5DC | #D8DCE4 | #FBE3D5 | #D5E0ED | #D1E9EB | #EDE6F7 |

   The technology radar is already in Frontier purple.
5. Settings: enable Power BI tooltips, enable cross-filtering where the page has more than one visual, and set "Show as table" on in the visual's options.
6. Set alt text on every visual (Format, General, Alt text): one sentence saying what the chart shows and its main figure.

Field names in the specs match the measure and column display names in the model. If you rename a field, update the spec.

Currency in Deneb uses Power BI format strings through `"formatType": "pbiFormat"` (for example `£#,0`), which Deneb provides; the config sets `customFormatTypes` on for this.

`deneb/previews/` shows each of the 13 specs rendered with the data in `deneb/sample-data/`, so you can see the target look before connecting real data. `deneb/render.mjs` regenerates the previews (Node.js, `npm i vega vega-lite`, then `node render.mjs`, or `node render.mjs ccs-config-frontier.json` for another site's config).

## Accessibility

Custom visuals are less accessible than native ones. For every Deneb visual: alt text set, "Show as table" on, and never rely on colour alone (each chart has direct labels). Tables stay as native table visuals.
