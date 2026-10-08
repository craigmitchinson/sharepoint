# Frontier: the CCS innovation forum (`/sites/ccs-frontier`)

Theme: CCS frontier (purple). Header: Compact layout · site title shown · logo site-logo-frontier_300x300.png · theme: CCS Frontier (purple).
Hub navigation: from the CCS hub (Frontier is associated with the CCS hub, so it shows the CCS navigation; Frontier is added to it as a link). Links: Home, Labs, Find a solution, Tools and partners, Front door, Trust and controls, How we count value, Frontier, News.
Site navigation: Home, Ideas, Experiments, Showcase, Methods, Get involved.
Footer: Colleague & Customer Service Back to CCS Front door Trust and controls How we count value.

Each table lists the page top to bottom. "Web part and settings" is exactly what to add; "Content" is the opening of the copy as designed (open the page from index.html for every word). Background: None is white, Neutral is the grey section background, Soft and Strong are the theme section backgrounds.

## Home

Address: `/sites/ccs-frontier` · Design: `design/pages/FrontierHome.html` and `design/screens/FrontierHome_full.png`.

| # | Background | Layout | Web part and settings | Content |
|---|---|---|---|---|
| Title | Image `title-area-frontier_2560x1440.png` | Full width | Title area · Image layout · topic header on · image title-area-frontier_2560x1440.png | Frontier · the CCS innovation forum Bring us a problem. We will test new ways to solve it, with you. |
| 1 | None | One column | Text web part · lead paragraph | Frontier starts with the problem, not the technology. We look at it fresh, check what CCS already runs so nothing is built twice, and test the way most likely to make the service better, quicker or safer, with the eviden |
|  |  |  | Quick links web part · Button layout, descriptions on | Raise an idea A problem worth solving, or a way to solve one. We reply within 10 working days. Join an experiment Test something new with us for a few hours a week, alongside your day job. See what we have learned Demos, |
| 2 | Neutral | One column | Embed web part · Power BI secure embed, 1280 × 220 report page, height 220 | Ideas raised 64 ▲ 22 since June Experiments run 23 11 running now Handed to a Lab 6 Now in build or live Colleagues taken part 214 ▲ from 9 business teams |
| 3 | None | One column | List web part · Experiments list · view: Board, grouped by Stage · board card format tile-experiment-board.json | Explore 3 Letters customers can read Better service Language model · Pensions Operations Explore Spot a struggling customer sooner Better service Speech analytics · Customer Care Explore Test data that looks real Lower r |
| 4 | Strong | One column | Section background: Strong (theme primary) · three Text web parts | How we work at Frontier |
| 5 | None | Two columns | News web part · List layout · source: this site | Voice notes cut case summaries from 9 minutes to 2 in testing Frontier · 2 Oct What we learned stopping the chatbot for pension transfers Frontier · 19 Sep Complaint preparation agent moves to Automated Operations Fronti |
|  |  |  | Events web part · Compact layout · next 3 | OCT 17 Frontier Friday: demos from four experiments 12:00 · Teams and Room 4.12 |
| 6 | Neutral | One column | People web part · from the Contacts list | PO [Name] Frontier Product Owner · ideas, choices and what happens next EL [Name] Frontier Engineering Lead · sandboxes, safety and technology CH [Name] Frontier champions · one in every Lab, your first contact |

## Ideas

Address: `SitePages/ideas.aspx` · Design: `design/pages/FrontierIdeas.html` and `design/screens/FrontierIdeas_full.png`.

| # | Background | Layout | Web part and settings | Content |
|---|---|---|---|---|
| Title | Plain | Full width | Title area · Plain layout · topic header on | Ideas Got an idea? Raise it here. |
| 1 | None | One column | Text web part · lead paragraph | Ideas come from the people closest to the work. Tell us the problem in your own words; you do not need to know which technology might solve it. |
| 2 | None | Two columns | Text web part | What makes a good Frontier idea |
|  |  |  | Text web part and Button web part | What happens next |
| 3 | Neutral | One column | List web part · Ideas list · gallery view, sorted by Number of likes · Likes switched on in Rating settings · card format tile-ideas.json | Customer letters Chosen Letters customers can read first time Pensions 41 Customer contact Shortlisted Know why a customer is calling before we answer Insurance 37 Colleague time Shortlisted Draft the file note from the |
| 4 | None | One column | Collapsible sections | Do I need to be technical? No. You bring the problem and what good would look like. Frontier brings the technology and the people to build and test it. |

## Experiments

Address: `SitePages/experiments.aspx` · Design: `design/pages/FrontierExperiments.html` and `design/screens/FrontierExperiments_full.png`.

| # | Background | Layout | Web part and settings | Content |
|---|---|---|---|---|
| Title | Plain | Full width | Title area · Plain layout · topic header on | Experiments Everything we are testing, and what we decided. |
| 1 | None | One column | Text web part · lead paragraph | Every experiment moves left to right. Most take six to eight weeks from first look to a decision. Select a card to see the problem, what we tested and what we found. |
| 2 | None | One column | List web part · Experiments list · view: Board, grouped by Stage · board card format tile-experiment-board.json | Explore 3 Letters customers can read Better service Language model · Pensions Operations Explore Spot a struggling customer sooner Better service Speech analytics · Customer Care Explore Test data that looks real Lower r |
| 3 | Neutral | Three columns | Text web part | 1 TO 2 WEEKS |
|  |  |  | Text web part | UP TO 6 WEEKS |
|  |  |  | Text web part | 1 WEEK |
| 4 | None | Two columns | Text web part | Safe to try |
|  |  |  | Text web part · table, style: subtle | What a decision means |

## Experiment page (template)

Address: `SitePages/experiments/{experiment}.aspx, one per experiment` · Design: `design/pages/FrontierExperiment.html` and `design/screens/FrontierExperiment_full.png`.

| # | Background | Layout | Web part and settings | Content |
|---|---|---|---|---|
| Title | Plain | Full width | Title area · Plain layout · topic header on | Experiment · Test Voice notes to case summaries |
| 1 | None | One column | Text web part · lead paragraph | Claims handlers dictate a short voice note after each call, and a language model drafts the case summary for them to check and save. |
| 2 | None | One-third left | Page properties web part | About this experiment Stage Test Started 8 September 2026 Decision due 24 October 2026 Outcome Faster for handlers, and a fuller, consistent record of every claim Measured by Minutes per summary; share of drafts accepted |
|  |  |  | Text web part | The problem |
| 3 | Neutral | Two columns | Power BI web part · 16:9 report page | Minutes to write a case summary Median, by hand against with a voice note By hand 9.1 min Voice note, week 1 3.8 min Voice note, week 4 2.2 min |
|  |  |  | Power BI web part · 16:9 report page | Summaries accepted with small edits Share of drafts, by week · target 80% 61% 72% 79% 84% Wk 1 Wk 2 Wk 3 Wk 4 |
| 4 | None | Two columns | Text web part · dated entries, newest first | What we have learned so far |
|  |  |  | Document library web part · this experiment’s folder | Evidence |

## Showcase

Address: `SitePages/showcase.aspx` · Design: `design/pages/FrontierShowcase.html` and `design/screens/FrontierShowcase_full.png`.

| # | Background | Layout | Web part and settings | Content |
|---|---|---|---|---|
| Title | Plain | Full width | Title area · Plain layout · topic header on | Showcase What we tried, and what happened. |
| 1 | None | One column | Text web part · lead paragraph | Results from every experiment, including the ones we stopped. If something here would help your team, raise it through the CCS front door and the Lab that owns it will pick it up. |
| 2 | None | One column | News web part · Top story layout · source: this site · 5 items | Voice notes cut case summaries from 9 minutes to 2 in testing Six motor claims handlers dictated notes for four weeks. 84% of drafts were accepted with small edits. Frontier · 2 Oct What we learned stopping the chatbot f |
| 3 | Neutral | One column | File and media web part × 3 · Stream videos from the Frontier Demos channel | 4:12 Voice notes to case summaries Frontier Friday demo 3:05 Reading handwritten claim forms Frontier Friday demo 5:40 Map a process from a Teams call Frontier Friday demo |
| 4 | None | One column | List web part · Experiments list · gallery view filtered to Stage = Handed over · card format tile-handed-over.json | Automated Operations Handed over Complaint preparation agent Handlers start every complaint with the facts gathered and checked. Now: In shadow testing Colleague Tooling Handed over Knowledge search that answers Answers |

## Methods

Address: `SitePages/methods.aspx` · Design: `design/pages/FrontierMethods.html` and `design/screens/FrontierMethods_full.png`.

| # | Background | Layout | Web part and settings | Content |
|---|---|---|---|---|
| Title | Plain | Full width | Title area · Plain layout · topic header on | Methods New ways to solve old problems. |
| 1 | None | One column | Text web part · lead paragraph | The methods we use to test ideas quickly and safely. Every one is free to use in your own team; ask a Frontier champion to run one with you the first time. |
| 2 | None | One column | Three-column sections × 2 · a Text web part in each | 1 HOUR Problem framing Before anything else: who has the problem, how often, and what good looks like. 5 DAYS Design sprint A big problem, a cross-team group, a tested prototype by Friday. 1 TO 2 WEEKS Fake it first A pe |
| 3 | Neutral | One column | Power BI web part · 16:9 report page · Deneb visual (Vega), technology-radar spec, data from the Radar list | Technology radar What we use, trial, assess or avoid · reviewed quarterly ADOPT TRIAL ASSESS HOLD 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 Agents and AI Automation Data and insight Colleague experience Agents and |
| 4 | None | Two columns | Document library web part · Methods toolkit | Toolkit |
|  |  |  | Text web part and Button web part | Want help running one? |

## Get involved

Address: `SitePages/get-involved.aspx` · Design: `design/pages/FrontierJoin.html` and `design/screens/FrontierJoin_full.png`.

| # | Background | Layout | Web part and settings | Content |
|---|---|---|---|---|
| Title | Image `title-area-frontier_2560x1440.png` | Full width | Title area · Image layout · topic header on · image title-area-frontier_2560x1440.png | Frontier · Get involved Come and work with us. |
| 1 | None | One column | Text web part · lead paragraph | Most people at Frontier have a day job somewhere else in CCS or the business. You can give an hour, a few hours a week for six weeks, or a whole hack day. |
|  |  |  | Quick links web part · Button layout, descriptions on | Raise an idea Tell us a problem worth solving. Be a tester Try a new tool on safe data and tell us what works. Two to four hours a week for six weeks. Bring a problem to Frontier Friday Fortnightly, 12:00. Ten minutes to |
| 2 | Neutral | One column | Events web part · Filmstrip layout · source: this site · next 4 events | OCT 17 Frontier Friday: demos from four experiments 12:00 · Teams and Room 4.12 NOV 6 Hack day: letters customers can read 09:30 · Halifax, all day NOV 20 Show and tell with Insurance Operations 14:00 · Teams DEC 4 Desig |
| 3 | None | Two columns | People web part · Frontier champions, from the Contacts list | AO [Name] Champion · Automated Operations Lab 24 [Name] Champion · 24x7 Services Lab CT [Name] Champion · Colleague Tooling Lab DI [Name] Champion · Data & Insights Lab |
|  |  |  | Viva Engage web part · Conversations · source: Frontier community | Frontier community |
| 4 | Neutral | One column | Collapsible sections | How much time will it take? A tester gives two to four hours a week for six weeks; a hack day is one day; Frontier Friday is one hour. Agree it with your line manager first; we send them a short note explaining the commi |
