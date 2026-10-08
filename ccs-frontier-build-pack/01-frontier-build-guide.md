# Frontier build guide

Frontier is the CCS innovation forum: colleagues bring a problem, Frontier looks at it without a technology in mind, checks what CCS already runs, and tests the way most likely to improve the service, the speed or the risk, with evidence. What proves out is handed to a Lab through the CCS front door.

No admin rights? Follow `01a-build-without-admin.md` for the site, theme (Purple), navigation and lists, then come back here for the pages and Power BI.

Open `index.html` first. It links every page, asset, chart and placeholder in this pack. Build in the order below.

## 1. The sites

| Site | Type | Address | Purpose | Who can see it |
|---|---|---|---|---|
| Frontier | Communication site, associated with the CCS hub | `/sites/ccs-frontier` | The front of Frontier: ideas, experiments, showcase, methods, how to join | Everyone in `CCS-AllColleagues`; anyone can add ideas |
| Frontier Team | Team site connected to Microsoft Teams, associated with the CCS hub | `/sites/ccs-frontier-team` | Where experiments are worked on: a channel per experiment, drafts, sandbox notes, meeting recordings | Frontier members and each experiment's testers, by channel |

Frontier is a communication site because most visitors come to read, raise an idea or watch a demo, and it should look and navigate like the rest of CCS. Day-to-day experiment work needs co-authoring, chat and channels, which is what a Teams-connected site is for. Finished evidence moves from the team site to the communication site when it is ready to publish, so the public pages only ever show what has been checked.

Setup on the communication site:
1. Create it (or run `Provision-Sites.ps1` from the full kit): Communication site, Blank template, title "Frontier", address `ccs-frontier`.
2. Associate it with the CCS hub (Site information, Hub site association). It is not a hub itself, so it shows the CCS hub navigation; add "Frontier" to the CCS hub navigation, between "How we count value" and "News".
3. Change the look: theme "CCS frontier" (`theme/sharepoint-theme-frontier.json`, added as a tenant theme by your SharePoint admin). Header: Compact, site title shown, logo `assets/logos/site-logo-frontier_300x300.png`, thumbnail `site-logo-frontier_64x64.png`. Footer: on, logo `footer-logo-ccs-platform-dark_300x300.png`, links Back to CCS, Front door, Trust and controls, How we count value.
4. Site navigation (horizontal): Home, Ideas, Experiments, Showcase, Methods, Get involved.
5. Site settings, HTML Field Security: add `app.powerbi.com` (the KPI strip uses the Embed web part).
6. Permissions: Owners `CCS-Frontier-Owners` (Frontier Product Owner, Frontier Engineering Lead), Members `CCS-Frontier-Editors` (champions), Visitors `CCS-AllColleagues`. On the Ideas list only, break inheritance and give `CCS-AllColleagues` Contribute.

Setup on the team site: create the team "Frontier" in Teams, rename the site address to `ccs-frontier-team`, associate it with CCS, apply the same theme. One standard channel per experiment, named as on the Experiments list. Use a shared channel when testers come from outside the Frontier team.

## 2. Brand assets

Upload `assets/` to `/sites/ccs/BrandAssets/frontier/` (the CCS organisation assets library), keeping the folders, so the files appear in every image picker.

| Folder | Files | Use |
|---|---|---|
| `marks/` | `frontier-mark--for-light` and `--for-dark` (SVG, 512, 64, 32 px); `ccs-mark--platform--for-light` and `--for-dark` | Frontier mark on light and dark grounds; the CCS mark for the hub bar and footer |
| `logos/` | `site-logo-frontier_300x300` (SVG, PNG), `site-logo-frontier_64x64.png`, `footer-logo-ccs-platform-dark_300x300` | Site logo, logo thumbnail, footer |
| `backgrounds/` | `title-area-frontier_2560x1440` (SVG, PNG) | Title area, Image layout: Home and Showcase |
| `backgrounds/` | `news-thumb-frontier_1200x675`, `news-thumb-frontier-light_1200x675` (SVG, PNG) | News post thumbnails: dark for results and handovers, light for events and how-tos |
| `icons/` | `tile-route-*_160x160.png` | Quick links, Button layout, custom image: Raise an idea, Join an experiment (also Be a tester), See what we have learned, Bring a problem to Frontier Friday |
| `icons/` | `icon-*--purple.svg`, `--white.svg`, `_96x96.png` | The same icons, plus like and play, for Text, Image or Call to action web parts |
| `placeholders/` | `PLACEHOLDER_*.png` | Image web parts that stand in for the Power BI visuals until the reports are published (section 5) |

Colours (set by the theme; listed for anything you make by hand):

| Step | 1 | 2 | 3 | 4 (primary) | 5 | 6 (ground) |
|---|---|---|---|---|---|---|
| Purple | #EDE6F7 | #D3C3EE | #7A4CC4 | #4F2391 | #2E1458 | #1E0D3D |

Mark on dark grounds: #9370DB and #BBA3EA. Navy for the CCS mark and text: #15223E. Status pills: Explore #EDE6F7 / #4F2391, Test #DDE3EF / #273860, Decide #F5EAD1 / #754F00, Handed over #E3F1DF / #39682E, Stopped #F3F2F1 / #605E5C. Outcome chips: #F7F4FC fill, #D3C3EE border, #4F2391 text.

## 3. Lists and libraries

All on the communication site. Definitions in `lists-and-formatting/lists-frontier.json`, sample rows in `seed-frontier.json`, formats in `lists-and-formatting/formatting/`.

| List or library | Columns | Views and formats |
|---|---|---|
| Ideas | Title, Outcome, Theme, Business area, The problem, Status (New, Shortlisted, Chosen, Parked) | Gallery "Most liked" sorted by likes, format `tile-ideas.json`; Status column `col-ideastatus.json`, Outcome `col-outcome.json`. Rating settings: Likes on |
| Experiments | Title, Stage (Explore, Test, Decide, Handed over, Stopped), Outcome, Technology, Sponsor, Handed to, Outcome achieved (the measured result), Now, Experiment page, From idea | Board "Board" grouped by Stage, buckets in that order, format `tile-experiment-board.json` (outcome first, then technology and sponsor); gallery "Handed over", format `tile-handed-over.json`; Stage column `col-experimentstage.json` |
| Radar | Title, Number, Quadrant (Agents and AI, Automation, Data and insight, Colleague experience), Ring (Adopt, Trial, Assess, Hold), Why | Source for the technology radar |
| Methods (library) | Name, Method, Time needed | Templates: problem framing canvas, design sprint plan, experiment brief, shadow test results, synthetic data request |
| Documents (library) | | One folder per experiment holding the published evidence |

Outcome values, used on Ideas and Experiments so every card leads with what it improves: Better service, Faster, Lower risk, Evidence.

## 4. Pages

Build from `02-page-build-sheets.md`, top to bottom, with the page open from `index.html` and Web part labels on.

| Page | Address | Notes |
|---|---|---|
| Home | `/sites/ccs-frontier` | Title area Image layout with `title-area-frontier_2560x1440.png`. KPI strip, experiments board, How we work (Strong section), showcase news, events, people |
| Ideas | `SitePages/ideas.aspx` | Raise-an-idea button opens the Ideas new item form |
| Experiments | `SitePages/experiments.aspx` | The board, the three stages, safe to try, what a decision means |
| Experiment page | `SitePages/experiments/{experiment}.aspx` | Page template: save the designed page as a template; the Experiment page flow copies it for each new experiment |
| Showcase | `SitePages/showcase.aspx` | Title area Image layout. News, Stream demos, Handed over gallery |
| Methods | `SitePages/methods.aspx` | Methods, technology radar, toolkit library |
| Get involved | `SitePages/get-involved.aspx` | Ways in, events, champions, Viva Engage community |

Page properties on the experiment template: Stage, Outcome, Started, Decision due, Problem owner, Frontier lead, Technology, Data, Likely home. The About table on the page is the Page properties web part showing them.

## 5. Power BI and the placeholders

One report, `CCS · Frontier`, on the CCS semantic model plus the Ideas, Experiments and Radar lists. Theme `theme/powerbi-theme-frontier.json`; Deneb config `power-bi/deneb/ccs-config-frontier.json`.

| Visual | Report page size | Deneb spec | Placeholder until it is live | On the page |
|---|---|---|---|---|
| KPI strip: ideas raised, experiments run, handed to a Lab, colleagues taken part | 1280 × 220 | `frontier-kpi-card.json`, one visual per card, four cards | `PLACEHOLDER_frontier-home-kpi-strip_1280x220@2x.png` | Home (Embed web part, height 220) |
| Minutes to write a case summary | 640 × 360 | `frontier-minutes-per-summary.json` | `PLACEHOLDER_frontier-experiment-minutes-per-summary_640x360@2x.png` | Experiment page, left column |
| Summaries accepted with small edits, against target | 640 × 360 | `frontier-accepted-by-week.json` | `PLACEHOLDER_frontier-experiment-accepted-by-week_640x360@2x.png` | Experiment page, right column |
| Technology radar | 1280 × 720 | `frontier-technology-radar.json` | `PLACEHOLDER_frontier-methods-technology-radar_1280x720@2x.png` | Methods, full width |

Charts that sit in a half-width column use a 640 × 360 report page (Format, Canvas settings, Custom), so the text stays the size it was designed at when SharePoint fits the page into a 586 px column. Full-width charts use 1280 × 720.

Placeholders: until the report is published, add an Image web part where the visual goes, pick the placeholder from BrandAssets, set alt text "Placeholder: {visual name} goes here", and keep the section exactly as the sheet says. Each placeholder is drawn at twice its page size so it stays sharp, and is marked PLACEHOLDER in its file name and on the image. When the report is live, delete the Image web part and add the Power BI web part (16:9) or Embed web part (KPI strip) in its place.

Deneb: add the certified Deneb visual, add the fields named in the spec's `description`, open the editor, choose Vega-Lite, paste the spec, paste the config, set alt text and turn on "Show as table". `power-bi/deneb/previews/` shows each spec rendered with the sample data; `render.mjs` regenerates them (Node.js, `npm i vega vega-lite`, `node render.mjs`).

## 6. Flows

| Flow | Trigger | Does |
|---|---|---|
| Idea received | Ideas item created | Thanks the person in Teams and tells them they will hear back within 10 working days |
| Idea decision | Ideas Status changed | Tells the person the decision and the reason; on Chosen, creates the Experiments item at Explore, linked to the idea |
| Experiment page | Experiments item created | Copies the experiment page template, fills its page properties, creates the evidence folder and the Teams channel |
| Experiment handover | Experiments Stage set to Handed over | Raises a "Bring us something new" request on CCS for the receiving Lab, with the evidence folder linked |
| Radar review | Quarterly | Reminds the Frontier Engineering Lead to review the Radar list |

Run them from a solution in the CCS Power Platform environment, with connection references, owned by the service account.

## 7. Writing for Frontier

- Lead with the problem and who it affects, then the outcome, then the technology. A card, a page title and a news headline should make sense without the technology name.
- Use the four outcomes: better service, faster, lower risk, evidence of the improvement. Say how it will be measured.
- Say what was checked in CCS already, and which Lab would own it.
- Report stopped experiments in the same tone as successful ones.
- Agents prepare, people decide, in tests as in live work.

## 8. Folder structures

BrandAssets on CCS:
```
BrandAssets/frontier/
  marks/  logos/  backgrounds/  icons/  placeholders/
```

Frontier communication site, Documents:
```
Documents/
  {experiment}/            e.g. voice-notes-to-case-summaries
    plan/                  the one-page brief and success measure
    evidence/              published results, data notes, the Responsible AI review
    handover/              what the Lab receives through the front door
```

Frontier communication site, Methods library:
```
Methods/
  problem-framing-canvas.pptx
  design-sprint-plan.docx
  experiment-brief-template.docx
  shadow-test-results-template.xlsx
  synthetic-data-request.docx
```

Frontier Team site (one channel per experiment, each with its own folder):
```
Documents/
  General/
  {experiment}/            working drafts, sandbox notes, recordings
```

This pack:
```
ccs-frontier-build-pack/
  index.html                   start here: every page, asset and chart
  01-frontier-build-guide.md   this guide
  02-page-build-sheets.md      every page, block by block
  assets/                      marks, logos, backgrounds, icons, placeholders
  design/pages/                the seven pages, clickable
  design/screens/              full-page PNG of each page
  design/frontier.pdf          every page in one PDF
  lists-and-formatting/        list definitions, sample rows, card and column formats
  power-bi/deneb/              specs, sample data, config, previews, render script
  theme/                       SharePoint and Power BI themes
```

## 9. Launch checks

- Every page passes the accessibility checker; every image has alt text or is marked decorative.
- Any colleague can raise and like an idea, and cannot edit anyone else's.
- An idea marked Chosen creates its experiment, page and channel.
- An experiment marked Handed over reaches the receiving Lab's Product Owner through the CCS front door.
- Placeholders replaced, or still clearly marked as placeholders.
- Sample ideas, experiments and figures removed.
