# Route cards ("Raise an idea", "Join an experiment", "See what we have learned")

Quick links can't draw the purple square icons with descriptions, so the cards are a small list shown in a gallery view with `formatting/tile-routes.json`. Every look in the design is then exact, and editing a card is editing a list row.

1. New, List, Blank list, name `Routes`.
2. Columns: `Description` (Multiple lines of text, plain), `Link` (Hyperlink), `IconImage` (Hyperlink: the address of the white icon PNG, e.g. `icon-route-raise-an-idea--white_96x96.png` uploaded to Site Assets), `SortOrder` (Number). Add every column to the Gallery view (Edit current view). Leave IconImage empty to fall back to a built-in icon.
3. Rows:

| Title | Description | Link | Icon | SortOrder |
|---|---|---|---|---|
| Raise an idea | A problem worth solving, or a way to solve one. We reply within 10 working days. | the Ideas new item form | Lightbulb | 1 |
| Join an experiment | Test something new with us for a few hours a week, alongside your day job. | the Get involved page | TestBeaker | 2 |
| See what we have learned | Demos, results and what happened next, including the ideas we stopped. | the Showcase page | Video | 3 |

4. + Add view, name `Cards`, Gallery, sorted by SortOrder. Then Format current view, Advanced mode, paste `tile-routes.json`, Save.
5. On the page: List web part, list Routes, view Cards. In its settings turn off the title and choose "Hide command bar".

The Get involved page uses the same list idea with its three cards (Raise an idea `Lightbulb`, Be a tester `TestBeaker`, Bring a problem to Frontier Friday `Chat`): either a second list `JoinRoutes`, or a `Page` column with a filtered view.

`Icon` takes any Fluent UI icon name, for example Lightbulb, TestBeaker, Video, Chat, Like.
