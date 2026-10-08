# Lists and formatting

`lists.json` defines every list: the site it lives on, its columns (internal names, types, choices), its views and the format each column or view uses. `seed.json` holds the example rows from the designs, all illustrative. `formatting/` holds the JSON.

## Where each list lives

| Site | Lists |
|---|---|
| CCS (`/sites/ccs`), once for the whole platform | Solutions, Requests, Contacts, Stories, Quotes, Labs, Teams, Tools |
| Each Lab hub | Programme |
| Automated Operations Lab hub | LabInvestigations (shown on the team's Our Lab work page) |
| Frontier (`/sites/ccs-frontier`) | Ideas, Experiments, Radar, and the Methods toolkit library |
| Each team business site | Capabilities, Skills, Platforms, and the Evidence library |
| Each team private site | Portfolio, ToilLedger, Learning, CapabilityGaps |

Platform lists carry `Lab` (and `Team` where it matters) so every other site can show only its own rows. Lab hubs and team sites show them through the Embed web part with the view address plus `?env=WebViewList`, because the List web part only shows lists on its own site. There is one Solutions catalogue, one Requests list, one Teams list and one Tools list; nobody keeps a copy.

## Formatting files

| File | Apply to | How |
|---|---|---|
| `tile-labs.json` | Labs, view Cards (gallery) | Format current view, Advanced mode |
| `tile-teams.json` | Teams, views "{Lab} cards" (gallery) | Format current view, Advanced mode |
| `tile-teams-compact.json` | Teams, views "{Lab} compact" (gallery) | Format current view, Advanced mode |
| `tile-programme-board.json` | Programme, view Board (board, grouped by Stage) | Format current view, Advanced mode |
| `tile-labitems.json` | Programme, view Cards (gallery, dark cards) | Format current view, Advanced mode |
| `tile-experiment-board.json` | Experiments, view Board (board, grouped by Stage): outcome chip first, then technology and sponsor | Format current view, Advanced mode |
| `tile-handed-over.json` | Experiments, view Handed over (gallery) | Format current view, Advanced mode |
| `tile-ideas.json` | Ideas, view Most liked (gallery) | Format current view, Advanced mode |
| `tile-capabilities.json`, `tile-skills.json`, `tile-stories.json`, `tile-quotes.json`, `tile-platforms.json` | The gallery view of each list | Format current view, Advanced mode |
| `col-*.json` | The matching column (each list's `format` in `lists.json`) | Column settings, Format this column, Advanced mode |
| `form-requests.json` | Requests form header | Edit form, Configure layout, Header |

Board views: create the view in the browser (+ Add view, Board, Organise by the Stage column), drag the buckets into the order given in `lists.json`, then apply the card format. Board and gallery views can't be laid out by script, so `Provision-Lists.ps1 -ApplyCardFormats` only applies the JSON once the views exist.

The Programme "Working" pill and the team card link use the site's theme colour (`ms-bgColor-themePrimary`, `ms-fontColor-themePrimary`), so the same files work on every Lab. The other status colours are fixed: Live green, In progress blue-grey, Next or Building gold.

Images in cards (Lab marks, team marks) come from Hyperlink columns pointing at `BrandAssets`, so swapping a mark is one file change.

Ideas: turn on Likes in List settings, Rating settings. That adds the `LikesCount` column the cards show and sort by.
