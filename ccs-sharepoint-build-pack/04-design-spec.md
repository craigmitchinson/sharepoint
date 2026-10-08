# Design spec

Everything needed to match the designs exactly. SharePoint controls some sizes itself (title area heights, section padding, navigation); where it does, the spec names the setting to use rather than a pixel value.

## Canvas and grid

| Item | Value |
|---|---|
| Design viewport | 1366 × 768 desktop, 390 wide mobile |
| Site header | Compact layout: one 64 px row (logo 36 px, site title 18 px semibold, navigation 14 px) |
| Hub bar | 40 px, above the header, set by SharePoint |
| Content width (full-width sections excluded) | 1204 px at 1366 wide (SharePoint's 1252 px canvas less 24 px padding each side) |
| One column | 1204 px |
| Two columns | 586 + 586 px, 32 px gap |
| Three columns | 380 × 3, 32 px gaps |
| One-third left or right | 380 + 790 px |
| Team private site content | 1020 px (left navigation takes the rest): two columns 494 + 494 |
| Section padding | SharePoint default; sections alternate white (#FFFFFF) and neutral (#F3F2F1) backgrounds |

## Type

Font: Segoe UI throughout (SharePoint default). No custom fonts are needed.

| Role | Size | Weight | Colour | SharePoint setting |
|---|---|---|---|---|
| Page title (title area) | 36 px | Semibold | #252423 on white, #FFFFFF on image | Title area, Plain or Image layout |
| Topic header above title | 13 px | Semibold | Site primary (white areas), site step 2 (image areas) | Title area, topic header on |
| Section heading | 24 px | Semibold | #252423 | Text web part, Heading 1 |
| Sub-heading | 20 px | Semibold | #252423 | Text web part, Heading 2 |
| Lead paragraph | 18 px | Regular | #323130 | Text web part, font size 18 |
| Body | 15 px | Regular | #323130 | Text web part, Normal |
| Card title | 15 to 17 px | Semibold | #252423 | Set by list formatting JSON |
| Card body, captions | 13 to 14 px | Regular | #605E5C | Set by list formatting JSON |
| Data note under charts | 13 px | Regular | #605E5C | Text web part, font size 13 |

Power BI (set by the theme and Deneb config):

| Role | Size | Weight | Colour |
|---|---|---|---|
| Visual title | 15 px | Bold | #15223E |
| Visual subtitle | 12 px | Regular | #605E5C |
| KPI value | 30 px | Bold | #15223E |
| KPI label | 12 px | Semibold | #605E5C |
| Comparison pill | 11.5 px | Semibold | #39682E on #E3F1DF (good), #605E5C otherwise |
| Axis labels | 11 px | Regular | #605E5C |
| Data labels | 12 px | Semibold | #15223E |
| Legend | 12 px | Regular | #3B3A39, circle symbols |

## Colour

LBG theme colours and tonal steps. Steps run 1 (lightest) to 6 (darkest); step 4 is each site's primary colour (buttons, links, active navigation, route tiles, Soft and Strong section backgrounds through the theme).

| Family | 1 | 2 | 3 | 4 | 5 | 6 | Used for |
|---|---|---|---|---|---|---|---|
| Navy | #D8DCE4 | #ACB5C7 | #7C89A6 | #243B6B | #1C2E53 | #15223E | CCS platform; structure everywhere: the Cs of the mark, footer, suite bar, secondary chart series |
| Crimson | #F6D5DC | #ECA6B5 | #E2728B | #CE143D | #A11030 | #770C23 | Automated Operations Lab and its teams (title image ground #470C1E) |
| Burnt orange | #FBE3D5 | #F2BC9C | #E58A5A | #B84C14 | #8F3A0E | #5C260A | 24x7 Services Lab and its teams |
| Blue | #D5E0ED | #A7BDDA | #7497C4 | #18519D | #133F7A | #0E2F5B | Colleague Tooling Lab and its teams |
| Teal | #D1E9EB | #9ED0D4 | #66B5BC | #00838F | #006670 | #004C53 | Data & Insights Lab and its teams |
| Purple | #EDE6F7 | #D3C3EE | #7A4CC4 | #4F2391 | #2E1458 | #1E0D3D | Frontier (mark on dark: #9370DB and #BBA3EA; radar rings #D9C9EE, #E5DAF3, #EFE8F8, #F7F4FC) |
| Gold | #F5EAD1 | #EAD29E | #DFB866 | #C98900 | #9D6B00 | #754F00 | Single highlight on every site: "Next" and "Building" |

Text 4.5:1 or better on white: every step 4 passes (burnt orange 5.1:1, teal 4.6:1).

Status pills (light fill, dark text, the same on every site): Live or done #E3F1DF / #39682E; in progress or Pilot #DDE3EF / #273860; long-build #F6DFD5 / #6B3415; problem #F6D5DC / #A11030; next or Building #F5EAD1 / #754F00. Lab pills (Tools list "Used by"): 24x7 Services #FBE3D5 / #5C260A, Automated Operations #D8DCE4 / #1C2E53, Colleague Tooling #D5E0ED / #133F7A, Data & Insights #D1E9EB / #006670. Frontier stage pills: Explore #EDE6F7 / #4F2391, Test #DDE3EF / #273860, Decide #F5EAD1 / #754F00, Handed over #E3F1DF / #39682E, Stopped #F3F2F1 / #605E5C.

Neutrals: headings #252423, body #323130, secondary #605E5C, lines #EDEBE9 and #E1DFDD, Neutral section background #F3F2F1.

## Site themes and title images

| Site | SharePoint theme (`theme/`) | Power BI theme | Deneb config | Site logo | Title image (Image layout pages) |
|---|---|---|---|---|---|
| CCS | `sharepoint-theme-platform-navy.json` | `powerbi-theme-platform-navy.json` | `ccs-config-platform-navy.json` | `footer-logo-ccs-platform-light_300x300.png` | `title-area-platform-navy_2560x1440.png` |
| Automated Operations Lab and teams | `sharepoint-theme-automated-operations.json` | `powerbi-theme-automated-operations.json` | `ccs-config-automated-operations.json` | `lab-mark-automated-operations_300x300.png` | `title-area-lab-automated-operations_2560x1440.png`; team Home `title-area-hero-navy_2560x1440.png` |
| 24x7 Services Lab and teams | `sharepoint-theme-24x7-services.json` | `powerbi-theme-24x7-services.json` | `ccs-config-24x7-services.json` | `lab-mark-24x7-services_300x300.png` | `title-area-lab-24x7-services_2560x1440.png` |
| Colleague Tooling Lab and teams | `sharepoint-theme-colleague-tooling.json` | `powerbi-theme-colleague-tooling.json` | `ccs-config-colleague-tooling.json` | `lab-mark-colleague-tooling_300x300.png` | `title-area-lab-colleague-tooling_2560x1440.png` |
| Data & Insights Lab and teams | `sharepoint-theme-data-and-insights.json` | `powerbi-theme-data-and-insights.json` | `ccs-config-data-and-insights.json` | `lab-mark-data-and-insights_300x300.png` | `title-area-lab-data-and-insights_2560x1440.png` |
| Frontier | `sharepoint-theme-frontier.json` | `powerbi-theme-frontier.json` | `ccs-config-frontier.json` | `site-logo-frontier_300x300.png` | `title-area-frontier_2560x1440.png` |

Team sites inherit their Lab hub's theme. News thumbnails: `news-thumb-lab-{lab}_1200x675.png` for Lab news, `news-thumb-navy` and `news-thumb-light` for CCS, `news-thumb-frontier` and `news-thumb-frontier-light` for Frontier.

## Components

| Component | Spec |
|---|---|
| Cards (galleries, KPI cards, tiles) | White, 1 px #EDEBE9 border, 6 px radius, 14 to 18 px padding, 16 px gaps |
| Route tiles | 40 px square in the site's primary colour (white 22 px icon), title 15 px semibold, description 13 px, time promise 12 px semibold in the primary colour |
| Pills | 999 px radius, 2 px × 8 px padding, 11 to 12 px semibold |
| Buttons | Site primary colour, white 14 px semibold text, 10 × 16 px padding, 4 px radius (set by the theme) |
| Charts | Bars 18 px thick with 9 px rounded ends on a #F3F2F1 track; columns with 4 px rounded tops; dashed #EDEBE9 gridlines; #C8C6C4 baseline; direct value labels instead of axes where possible |
| Sparklines | 84 × 30 px, #7C89A6 1.6 px line, #ACB5C7 area at 28%, end dot 2.6 px radius in the site's primary colour |
| Board cards (Programme, Experiments) | White on a #F3F2F1 bucket, 4 px radius, 0 1px 2px shadow, 10 × 12 px padding, title 14 px semibold, description 12.5 px, state pill bottom right |

## Power BI page sizes

| Use | Page size | Embedded with | Height on the page |
|---|---|---|---|
| Charts side by side (two columns) | 640 × 360 (16:9, custom), so text keeps its designed size in a column | Power BI web part, 16:9 | 330 px at 586 wide; 278 px at 494 wide |
| Full-width chart or table | 1280 × 720 (16:9) | Power BI web part, 16:9 | 677 px at 1204 wide |
| KPI strip (four cards) | 1280 × 220 (custom) | Embed web part, secure embed URL, fixed height | 220 px |
| Gate pipeline | 1280 × 180 (custom) | Embed web part, fixed height | 180 px |

## The mark

The CCS mark has five panels inside an S: two Cs (Colleague, Customer) in navy, three S panels in the site's colour (outer panels step 5, middle panel step 4 on light backgrounds; step 4 and step 3 with white Cs on navy). Frontier uses its own mark (`frontier-mark--for-light` and `--for-dark`). Masters are in `assets/marks/full` (transparent SVG, 256 × 256 viewBox) with PNGs at 512 and 64 px. Rules:

- Clear space: at least one panel width on every side.
- Minimum size: 48 px for the full mark. Below that use `assets/marks/small` (the three-panel S, gaps widened), at 16 and 32 px.
- Light backgrounds use the `for-light` files; navy backgrounds use `for-dark`.
- Never recolour, outline, rotate or add effects.

## Assets

Every file in `assets/`, with its size and use. The Deneb previews are in `06-power-bi/deneb/previews/`. Placeholder PNGs are drawn at twice their report page size.

| File | Format | Pixels (w × h) | Where it is used |
|---|---|---|---|
| `assets/backgrounds/news-thumb-frontier-light_1200x675.png` | PNG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-frontier-light_1200x675.svg` | SVG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-frontier_1200x675.png` | PNG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-frontier_1200x675.svg` | SVG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-lab-24x7-services_1200x675.png` | PNG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-lab-24x7-services_1200x675.svg` | SVG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-lab-automated-operations_1200x675.png` | PNG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-lab-automated-operations_1200x675.svg` | SVG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-lab-colleague-tooling_1200x675.png` | PNG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-lab-colleague-tooling_1200x675.svg` | SVG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-lab-data-and-insights_1200x675.png` | PNG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-lab-data-and-insights_1200x675.svg` | SVG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-light_1200x675.png` | PNG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-light_1200x675.svg` | SVG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-navy_1200x675.png` | PNG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/news-thumb-navy_1200x675.svg` | SVG | 1200 × 675 | News thumbnails |
| `assets/backgrounds/section-light_2560x1440.png` | PNG | 2560 × 1440 | Optional section background |
| `assets/backgrounds/section-light_2560x1440.svg` | SVG | 2560 × 1440 | Optional section background |
| `assets/backgrounds/title-area-frontier_2560x1440.png` | PNG | 2560 × 1440 | Title area, Image layout: Frontier Home and Showcase |
| `assets/backgrounds/title-area-frontier_2560x1440.svg` | SVG | 2560 × 1440 | Title area, Image layout: Frontier Home and Showcase |
| `assets/backgrounds/title-area-hero-navy_2560x1440.png` | PNG | 2560 × 1440 | Title area, Image layout: team Home |
| `assets/backgrounds/title-area-hero-navy_2560x1440.svg` | SVG | 2560 × 1440 | Title area, Image layout: team Home |
| `assets/backgrounds/title-area-lab-24x7-services_2560x1440.png` | PNG | 2560 × 1440 | Title area, Image layout: that Lab's Home and its teams' Our Lab work |
| `assets/backgrounds/title-area-lab-24x7-services_2560x1440.svg` | SVG | 2560 × 1440 | Title area, Image layout: that Lab's Home and its teams' Our Lab work |
| `assets/backgrounds/title-area-lab-automated-operations_2560x1440.png` | PNG | 2560 × 1440 | Title area, Image layout: that Lab's Home and its teams' Our Lab work |
| `assets/backgrounds/title-area-lab-automated-operations_2560x1440.svg` | SVG | 2560 × 1440 | Title area, Image layout: that Lab's Home and its teams' Our Lab work |
| `assets/backgrounds/title-area-lab-colleague-tooling_2560x1440.png` | PNG | 2560 × 1440 | Title area, Image layout: that Lab's Home and its teams' Our Lab work |
| `assets/backgrounds/title-area-lab-colleague-tooling_2560x1440.svg` | SVG | 2560 × 1440 | Title area, Image layout: that Lab's Home and its teams' Our Lab work |
| `assets/backgrounds/title-area-lab-data-and-insights_2560x1440.png` | PNG | 2560 × 1440 | Title area, Image layout: that Lab's Home and its teams' Our Lab work |
| `assets/backgrounds/title-area-lab-data-and-insights_2560x1440.svg` | SVG | 2560 × 1440 | Title area, Image layout: that Lab's Home and its teams' Our Lab work |
| `assets/backgrounds/title-area-platform-navy_2560x1440.png` | PNG | 2560 × 1440 | Title area, Image layout: CCS Home |
| `assets/backgrounds/title-area-platform-navy_2560x1440.svg` | SVG | 2560 × 1440 | Title area, Image layout: CCS Home |
| `assets/icons/icon-copilot-sparkle.svg` | SVG | 24 × 24 | Interface icon |
| `assets/icons/icon-copilot-sparkle_96x96.png` | PNG | 96 × 96 | Interface icon |
| `assets/icons/icon-external-link.svg` | SVG | 24 × 24 | Interface icon |
| `assets/icons/icon-external-link_96x96.png` | PNG | 96 × 96 | Interface icon |
| `assets/icons/icon-following-star.svg` | SVG | 24 × 24 | Interface icon |
| `assets/icons/icon-following-star_96x96.png` | PNG | 96 × 96 | Interface icon |
| `assets/icons/icon-incident.svg` | SVG | 24 × 24 | Interface icon |
| `assets/icons/icon-incident_96x96.png` | PNG | 96 × 96 | Interface icon |
| `assets/icons/icon-like--purple.svg` | SVG | 24 × 24 | Frontier interface icon |
| `assets/icons/icon-like--purple_96x96.png` | PNG | 96 × 96 | Frontier interface icon |
| `assets/icons/icon-like--white.svg` | SVG | 24 × 24 | Frontier interface icon |
| `assets/icons/icon-like--white_96x96.png` | PNG | 96 × 96 | Frontier interface icon |
| `assets/icons/icon-play--purple.svg` | SVG | 24 × 24 | Frontier interface icon |
| `assets/icons/icon-play--purple_96x96.png` | PNG | 96 × 96 | Frontier interface icon |
| `assets/icons/icon-play--white.svg` | SVG | 24 × 24 | Frontier interface icon |
| `assets/icons/icon-play--white_96x96.png` | PNG | 96 × 96 | Frontier interface icon |
| `assets/icons/icon-route-ask-a-question.svg` | SVG | 24 × 24 | Route tiles (white, 22 px on a 40 px square) |
| `assets/icons/icon-route-ask-a-question_96x96.png` | PNG | 96 × 96 | Route tiles (white, 22 px on a 40 px square) |
| `assets/icons/icon-route-bring-a-problem--purple.svg` | SVG | 24 × 24 | Frontier route icon |
| `assets/icons/icon-route-bring-a-problem--purple_96x96.png` | PNG | 96 × 96 | Frontier route icon |
| `assets/icons/icon-route-bring-a-problem--white.svg` | SVG | 24 × 24 | Frontier route icon |
| `assets/icons/icon-route-bring-a-problem--white_96x96.png` | PNG | 96 × 96 | Frontier route icon |
| `assets/icons/icon-route-bring-us-something-new.svg` | SVG | 24 × 24 | Frontier route icon |
| `assets/icons/icon-route-bring-us-something-new_96x96.png` | PNG | 96 × 96 | Frontier route icon |
| `assets/icons/icon-route-change-something.svg` | SVG | 24 × 24 | Route tiles (white, 22 px on a 40 px square) |
| `assets/icons/icon-route-change-something_96x96.png` | PNG | 96 × 96 | Route tiles (white, 22 px on a 40 px square) |
| `assets/icons/icon-route-join-an-experiment--purple.svg` | SVG | 24 × 24 | Frontier route icon |
| `assets/icons/icon-route-join-an-experiment--purple_96x96.png` | PNG | 96 × 96 | Frontier route icon |
| `assets/icons/icon-route-join-an-experiment--white.svg` | SVG | 24 × 24 | Frontier route icon |
| `assets/icons/icon-route-join-an-experiment--white_96x96.png` | PNG | 96 × 96 | Frontier route icon |
| `assets/icons/icon-route-raise-an-idea--purple.svg` | SVG | 24 × 24 | Frontier route icon |
| `assets/icons/icon-route-raise-an-idea--purple_96x96.png` | PNG | 96 × 96 | Frontier route icon |
| `assets/icons/icon-route-raise-an-idea--white.svg` | SVG | 24 × 24 | Frontier route icon |
| `assets/icons/icon-route-raise-an-idea--white_96x96.png` | PNG | 96 × 96 | Frontier route icon |
| `assets/icons/icon-route-report-a-problem.svg` | SVG | 24 × 24 | Route tiles (white, 22 px on a 40 px square) |
| `assets/icons/icon-route-report-a-problem_96x96.png` | PNG | 96 × 96 | Route tiles (white, 22 px on a 40 px square) |
| `assets/icons/icon-route-see-what-we-have-learned--purple.svg` | SVG | 24 × 24 | Frontier route icon |
| `assets/icons/icon-route-see-what-we-have-learned--purple_96x96.png` | PNG | 96 × 96 | Frontier route icon |
| `assets/icons/icon-route-see-what-we-have-learned--white.svg` | SVG | 24 × 24 | Frontier route icon |
| `assets/icons/icon-route-see-what-we-have-learned--white_96x96.png` | PNG | 96 × 96 | Frontier route icon |
| `assets/icons/icon-search.svg` | SVG | 24 × 24 | Interface icon |
| `assets/icons/icon-search_96x96.png` | PNG | 96 × 96 | Interface icon |
| `assets/icons/icon-settings.svg` | SVG | 24 × 24 | Interface icon |
| `assets/icons/icon-settings_96x96.png` | PNG | 96 × 96 | Interface icon |
| `assets/icons/icon-share.svg` | SVG | 24 × 24 | Interface icon |
| `assets/icons/icon-share_96x96.png` | PNG | 96 × 96 | Interface icon |
| `assets/icons/tile-like_160x160.png` | PNG | 160 × 160 | Frontier Quick links custom image (40 px square on the page) |
| `assets/icons/tile-like_160x160.svg` | SVG | 160 × 160 | Frontier Quick links custom image (40 px square on the page) |
| `assets/icons/tile-play_160x160.png` | PNG | 160 × 160 | Frontier Quick links custom image (40 px square on the page) |
| `assets/icons/tile-play_160x160.svg` | SVG | 160 × 160 | Frontier Quick links custom image (40 px square on the page) |
| `assets/icons/tile-route-bring-a-problem_160x160.png` | PNG | 160 × 160 | Frontier Quick links custom image (40 px square on the page) |
| `assets/icons/tile-route-bring-a-problem_160x160.svg` | SVG | 160 × 160 | Frontier Quick links custom image (40 px square on the page) |
| `assets/icons/tile-route-join-an-experiment_160x160.png` | PNG | 160 × 160 | Frontier Quick links custom image (40 px square on the page) |
| `assets/icons/tile-route-join-an-experiment_160x160.svg` | SVG | 160 × 160 | Frontier Quick links custom image (40 px square on the page) |
| `assets/icons/tile-route-raise-an-idea_160x160.png` | PNG | 160 × 160 | Frontier Quick links custom image (40 px square on the page) |
| `assets/icons/tile-route-raise-an-idea_160x160.svg` | SVG | 160 × 160 | Frontier Quick links custom image (40 px square on the page) |
| `assets/icons/tile-route-see-what-we-have-learned_160x160.png` | PNG | 160 × 160 | Frontier Quick links custom image (40 px square on the page) |
| `assets/icons/tile-route-see-what-we-have-learned_160x160.svg` | SVG | 160 × 160 | Frontier Quick links custom image (40 px square on the page) |
| `assets/images/lab-family-strip_2408x240.png` | PNG | 2408 × 240 | Image web part: Our people |
| `assets/images/lab-family-strip_2408x240.svg` | SVG | 2408 × 240 | Image web part: Our people |
| `assets/images/where-we-fit_2408x940.png` | PNG | 2408 × 940 | Image web part: What we can do |
| `assets/logos/footer-logo-ccs-platform-dark_300x300.png` | PNG | 300 × 300 | Footer logo, navy footer |
| `assets/logos/footer-logo-ccs-platform-dark_300x300.svg` | SVG | 300 × 300 | Footer logo, navy footer |
| `assets/logos/footer-logo-ccs-platform-light_300x300.png` | PNG | 300 × 300 | CCS site logo; footer on light backgrounds |
| `assets/logos/footer-logo-ccs-platform-light_300x300.svg` | SVG | 300 × 300 | CCS site logo; footer on light backgrounds |
| `assets/logos/lab-mark-24x7-services_300x300.png` | PNG | 300 × 300 | Lab site logo; Lab mark in Text and list cards |
| `assets/logos/lab-mark-24x7-services_300x300.svg` | SVG | 300 × 300 | Lab site logo; Lab mark in Text and list cards |
| `assets/logos/lab-mark-automated-operations_300x300.png` | PNG | 300 × 300 | Lab site logo; Lab mark in Text and list cards |
| `assets/logos/lab-mark-automated-operations_300x300.svg` | SVG | 300 × 300 | Lab site logo; Lab mark in Text and list cards |
| `assets/logos/lab-mark-colleague-tooling_300x300.png` | PNG | 300 × 300 | Lab site logo; Lab mark in Text and list cards |
| `assets/logos/lab-mark-colleague-tooling_300x300.svg` | SVG | 300 × 300 | Lab site logo; Lab mark in Text and list cards |
| `assets/logos/lab-mark-data-and-insights_300x300.png` | PNG | 300 × 300 | Lab site logo; Lab mark in Text and list cards |
| `assets/logos/lab-mark-data-and-insights_300x300.svg` | SVG | 300 × 300 | Lab site logo; Lab mark in Text and list cards |
| `assets/logos/site-logo-external_300x300.png` | PNG | 300 × 300 | Spare: business site logo with no Lab |
| `assets/logos/site-logo-external_300x300.svg` | SVG | 300 × 300 | Spare: business site logo with no Lab |
| `assets/logos/site-logo-external_64x64.png` | PNG | 64 × 64 | Spare: business site logo with no Lab |
| `assets/logos/site-logo-frontier_300x300.png` | PNG | 300 × 300 | Frontier site logo |
| `assets/logos/site-logo-frontier_300x300.svg` | SVG | 300 × 300 | Frontier site logo |
| `assets/logos/site-logo-frontier_64x64.png` | PNG | 64 × 64 | Frontier site logo |
| `assets/logos/site-logo-internal_300x300.png` | PNG | 300 × 300 | Spare: private site logo |
| `assets/logos/site-logo-internal_300x300.svg` | SVG | 300 × 300 | Spare: private site logo |
| `assets/logos/site-logo-internal_64x64.png` | PNG | 64 × 64 | Spare: private site logo |
| `assets/marks/full/ccs-mark--24x7-services--for-dark.svg` | SVG | 256 × 256 | CCS mark, 24x7 services |
| `assets/marks/full/ccs-mark--24x7-services--for-dark_512x512.png` | PNG | 512 × 512 | CCS mark, 24x7 services |
| `assets/marks/full/ccs-mark--24x7-services--for-dark_64x64.png` | PNG | 64 × 64 | CCS mark, 24x7 services |
| `assets/marks/full/ccs-mark--24x7-services--for-light.svg` | SVG | 256 × 256 | CCS mark, 24x7 services |
| `assets/marks/full/ccs-mark--24x7-services--for-light_512x512.png` | PNG | 512 × 512 | CCS mark, 24x7 services |
| `assets/marks/full/ccs-mark--24x7-services--for-light_64x64.png` | PNG | 64 × 64 | CCS mark, 24x7 services |
| `assets/marks/full/ccs-mark--automated-operations--for-dark.svg` | SVG | 256 × 256 | CCS mark, automated operations |
| `assets/marks/full/ccs-mark--automated-operations--for-dark_512x512.png` | PNG | 512 × 512 | CCS mark, automated operations |
| `assets/marks/full/ccs-mark--automated-operations--for-dark_64x64.png` | PNG | 64 × 64 | CCS mark, automated operations |
| `assets/marks/full/ccs-mark--automated-operations--for-light.svg` | SVG | 256 × 256 | CCS mark, automated operations |
| `assets/marks/full/ccs-mark--automated-operations--for-light_512x512.png` | PNG | 512 × 512 | CCS mark, automated operations |
| `assets/marks/full/ccs-mark--automated-operations--for-light_64x64.png` | PNG | 64 × 64 | CCS mark, automated operations |
| `assets/marks/full/ccs-mark--colleague-tooling--for-dark.svg` | SVG | 256 × 256 | CCS mark, colleague tooling |
| `assets/marks/full/ccs-mark--colleague-tooling--for-dark_512x512.png` | PNG | 512 × 512 | CCS mark, colleague tooling |
| `assets/marks/full/ccs-mark--colleague-tooling--for-dark_64x64.png` | PNG | 64 × 64 | CCS mark, colleague tooling |
| `assets/marks/full/ccs-mark--colleague-tooling--for-light.svg` | SVG | 256 × 256 | CCS mark, colleague tooling |
| `assets/marks/full/ccs-mark--colleague-tooling--for-light_512x512.png` | PNG | 512 × 512 | CCS mark, colleague tooling |
| `assets/marks/full/ccs-mark--colleague-tooling--for-light_64x64.png` | PNG | 64 × 64 | CCS mark, colleague tooling |
| `assets/marks/full/ccs-mark--data-and-insights--for-dark.svg` | SVG | 256 × 256 | CCS mark, data and insights |
| `assets/marks/full/ccs-mark--data-and-insights--for-dark_512x512.png` | PNG | 512 × 512 | CCS mark, data and insights |
| `assets/marks/full/ccs-mark--data-and-insights--for-dark_64x64.png` | PNG | 64 × 64 | CCS mark, data and insights |
| `assets/marks/full/ccs-mark--data-and-insights--for-light.svg` | SVG | 256 × 256 | CCS mark, data and insights |
| `assets/marks/full/ccs-mark--data-and-insights--for-light_512x512.png` | PNG | 512 × 512 | CCS mark, data and insights |
| `assets/marks/full/ccs-mark--data-and-insights--for-light_64x64.png` | PNG | 64 × 64 | CCS mark, data and insights |
| `assets/marks/full/ccs-mark--mono--for-dark.svg` | SVG | 256 × 256 | CCS mark, mono |
| `assets/marks/full/ccs-mark--mono--for-dark_512x512.png` | PNG | 512 × 512 | CCS mark, mono |
| `assets/marks/full/ccs-mark--mono--for-dark_64x64.png` | PNG | 64 × 64 | CCS mark, mono |
| `assets/marks/full/ccs-mark--mono--for-light.svg` | SVG | 256 × 256 | CCS mark, mono |
| `assets/marks/full/ccs-mark--mono--for-light_512x512.png` | PNG | 512 × 512 | CCS mark, mono |
| `assets/marks/full/ccs-mark--mono--for-light_64x64.png` | PNG | 64 × 64 | CCS mark, mono |
| `assets/marks/full/ccs-mark--platform--for-dark.svg` | SVG | 256 × 256 | CCS mark, platform |
| `assets/marks/full/ccs-mark--platform--for-dark_512x512.png` | PNG | 512 × 512 | CCS mark, platform |
| `assets/marks/full/ccs-mark--platform--for-dark_64x64.png` | PNG | 64 × 64 | CCS mark, platform |
| `assets/marks/full/ccs-mark--platform--for-light.svg` | SVG | 256 × 256 | CCS mark, platform |
| `assets/marks/full/ccs-mark--platform--for-light_512x512.png` | PNG | 512 × 512 | CCS mark, platform |
| `assets/marks/full/ccs-mark--platform--for-light_64x64.png` | PNG | 64 × 64 | CCS mark, platform |
| `assets/marks/full/frontier-mark--for-dark.svg` | SVG | 256 × 256 | Frontier mark |
| `assets/marks/full/frontier-mark--for-dark_32x32.png` | PNG | 32 × 32 | Frontier mark |
| `assets/marks/full/frontier-mark--for-dark_512x512.png` | PNG | 512 × 512 | Frontier mark |
| `assets/marks/full/frontier-mark--for-dark_64x64.png` | PNG | 64 × 64 | Frontier mark |
| `assets/marks/full/frontier-mark--for-light.svg` | SVG | 256 × 256 | Frontier mark |
| `assets/marks/full/frontier-mark--for-light_32x32.png` | PNG | 32 × 32 | Frontier mark |
| `assets/marks/full/frontier-mark--for-light_512x512.png` | PNG | 512 × 512 | Frontier mark |
| `assets/marks/full/frontier-mark--for-light_64x64.png` | PNG | 64 × 64 | Frontier mark |
| `assets/marks/small/ccs-mark--24x7-services--favicon--16.png` | PNG | 16 × 16 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--24x7-services--favicon--16.svg` | SVG | 16 × 16 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--24x7-services--favicon--32.png` | PNG | 32 × 32 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--24x7-services--favicon--32.svg` | SVG | 32 × 32 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--automated-operations--favicon--16.png` | PNG | 16 × 16 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--automated-operations--favicon--16.svg` | SVG | 16 × 16 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--automated-operations--favicon--32.png` | PNG | 32 × 32 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--automated-operations--favicon--32.svg` | SVG | 32 × 32 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--colleague-tooling--favicon--16.png` | PNG | 16 × 16 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--colleague-tooling--favicon--16.svg` | SVG | 16 × 16 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--colleague-tooling--favicon--32.png` | PNG | 32 × 32 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--colleague-tooling--favicon--32.svg` | SVG | 32 × 32 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--data-and-insights--favicon--16.png` | PNG | 16 × 16 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--data-and-insights--favicon--16.svg` | SVG | 16 × 16 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--data-and-insights--favicon--32.png` | PNG | 32 × 32 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--data-and-insights--favicon--32.svg` | SVG | 32 × 32 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--platform-mono--favicon--16.png` | PNG | 16 × 16 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--platform-mono--favicon--16.svg` | SVG | 16 × 16 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--platform-mono--favicon--32.png` | PNG | 32 × 32 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--platform-mono--favicon--32.svg` | SVG | 32 × 32 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--platform-navy--favicon--16.png` | PNG | 16 × 16 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--platform-navy--favicon--16.svg` | SVG | 16 × 16 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--platform-navy--favicon--32.png` | PNG | 32 × 32 | Below 48 px: favicons, list icons |
| `assets/marks/small/ccs-mark--platform-navy--favicon--32.svg` | SVG | 32 × 32 | Below 48 px: favicons, list icons |
| `assets/motion/ccs-mark-construct--automated-operations--for-light.gif` | GIF | 380 × 380 | Teams posts and slides; "-once" files play once (Our Lab work) |
| `assets/motion/ccs-mark-construct--automated-operations--for-light.mp4` | MP4 | 760 × 760 | Teams posts and slides; "-once" files play once (Our Lab work) |
| `assets/motion/ccs-mark-construct--automated-operations--for-light.svg` | SVG | 512 × 512 | Teams posts and slides; "-once" files play once (Our Lab work) |
| `assets/motion/ccs-mark-construct--platform--for-dark.gif` | GIF | 380 × 380 | Teams posts and slides; "-once" files play once (Our Lab work) |
| `assets/motion/ccs-mark-construct--platform--for-dark.mp4` | MP4 | 760 × 760 | Teams posts and slides; "-once" files play once (Our Lab work) |
| `assets/motion/ccs-mark-construct--platform--for-dark.svg` | SVG | 512 × 512 | Teams posts and slides; "-once" files play once (Our Lab work) |
| `assets/motion/ccs-mark-construct--platform--for-light.gif` | GIF | 380 × 380 | Teams posts and slides; "-once" files play once (Our Lab work) |
| `assets/motion/ccs-mark-construct--platform--for-light.mp4` | MP4 | 760 × 760 | Teams posts and slides; "-once" files play once (Our Lab work) |
| `assets/motion/ccs-mark-construct--platform--for-light.svg` | SVG | 512 × 512 | Teams posts and slides; "-once" files play once (Our Lab work) |
| `assets/motion/ccs-mark-construct-once--automated-operations--for-light.gif` | GIF | 380 × 380 | Teams posts and slides; "-once" files play once (Our Lab work) |
| `assets/motion/ccs-mark-construct-once--platform--for-dark.gif` | GIF | 380 × 380 | Teams posts and slides; "-once" files play once (Our Lab work) |
| `assets/motion/ccs-mark-construct-once--platform--for-light.gif` | GIF | 380 × 380 | Teams posts and slides; "-once" files play once (Our Lab work) |
| `assets/placeholders/PLACEHOLDER_frontier-experiment-accepted-by-week_640x360@2x.png` | PNG | 1280 × 720 | Placeholder for a Frontier Power BI visual, in an Image web part until the report is live |
| `assets/placeholders/PLACEHOLDER_frontier-experiment-minutes-per-summary_640x360@2x.png` | PNG | 1280 × 720 | Placeholder for a Frontier Power BI visual, in an Image web part until the report is live |
| `assets/placeholders/PLACEHOLDER_frontier-home-kpi-strip_1280x220@2x.png` | PNG | 2560 × 440 | Placeholder for a Frontier Power BI visual, in an Image web part until the report is live |
| `assets/placeholders/PLACEHOLDER_frontier-methods-technology-radar_1280x720@2x.png` | PNG | 2560 × 1440 | Placeholder for a Frontier Power BI visual, in an Image web part until the report is live |
