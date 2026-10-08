# Page build sheets

One file per site, generated from the designs so every block on every page is covered. Each page lists its sections top to bottom: background, layout, the web part and its settings, and the opening of the copy. The full copy for each page is in the offline copy (`design/offline/index.html`): open the page and turn on Web part labels to see each block next to its web part.

| File | Site | Pages |
|---|---|---|
| `platform.md` | CCS hub, `/sites/ccs` | Home, Labs, Find a solution, Tools and partners, Front door, Trust and controls, How we count value, News, and the agent pane |
| `lab-automated-operations.md` | `/sites/ccs-autoops` | Home, Teams, Programme, Tools and skills, Rules, News |
| `lab-24x7-services.md` | `/sites/ccs-247` | The same six pages |
| `lab-colleague-tooling.md` | `/sites/ccs-tooling` | The same six pages |
| `lab-data-and-insights.md` | `/sites/ccs-insights` | The same six pages |
| `frontier.md` | `/sites/ccs-frontier` | Home, Ideas, Experiments, Experiment page template, Showcase, Methods, Get involved |
| `team-business.md` | `/sites/ccs-autoops-services` | Home, What we deliver, Our people, What we can do, Our Lab work, Contact us, Solution page template, Value statement, News post template, plus the agent pane, the phone view and the Teams card |
| `team-private.md` | `/sites/ccs-autoops-services-team` | Home, Delivery, Service, Cost and value, Capability, Ways of working |

Every other team copies the Automated Services sheets with its own names, Lab and figures.

## How to read the tables

| Term in a sheet | What to do in SharePoint |
|---|---|
| Background None / Neutral / Soft / Strong | Section, Background: None, Neutral, Soft or Strong. Soft and Strong take the site's theme colour |
| Layout One column / Two columns / Three columns / One-third left | Section layout of the same name |
| Title area · Image layout | Page title area, Layout: Image, with the image named in the Background column. Topic header on where stated |
| Title area · Plain layout | Page title area, Layout: Plain |
| List web part · {list} | The List web part on the same site as the list, with the named view and format |
| Embed web part · {list} … ?env=WebViewList | The list lives on another site (usually CCS). Open the list, choose the view, copy the address, add `?env=WebViewList` (or `&env=WebViewList` if the address already has a `?`) and paste it into the Embed web part. The List web part can't show a list from another site |
| Embed web part · Power BI secure embed | In Power BI, File, Embed report, SharePoint Online, copy the link; in the Embed web part paste `<iframe src="{link}&pageName={page}&navContentPaneEnabled=false&filterPaneEnabled=false" width="100%" height="{height}" frameborder="0"></iframe>` with the height stated |
| Power BI web part · 16:9 report page | Power BI web part, pick the report and page, 16:9, navigation and filter panes off |
| People web part · from the Contacts list | People web part with the people in the Contacts list for that role or Lab (People web part picks people directly; the Contacts list is where the names are kept and what the agent reads) |
| Labs register, Teams register | The `Labs` and `Teams` lists on CCS |
| card format `tile-*.json` | The view's format: Format current view, Advanced mode, paste the file from `07-lists-and-formatting/formatting` |

Common to every page:
- Header: Compact layout, site title shown, logo per the site (see `04-design-spec.md`).
- Footer: on, CCS platform mark (`footer-logo-ccs-platform-dark_300x300.png`), links Front door, Trust and controls, How we count value (Frontier adds Back to CCS).
- Page details: owner and Review by date before publishing.
- Comments on for news posts only.
- No more than three Power BI visuals per page.
