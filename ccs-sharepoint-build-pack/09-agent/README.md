# The CCS agent

One agent for the whole platform, built in Copilot Studio and published to every CCS site, Teams and Microsoft 365 Copilot. Colleagues don't need to know which Lab or team owns something: the agent works it out from the catalogue.

## Why one agent

- Customers don't know the org chart; one agent routes by subject.
- One Responsible AI review, one evaluation set, one shadow test, one set of instructions to keep current.
- Team context comes from data: every catalogue row, team, page and request carries Lab and Team, so routing improves by keeping lists current, not by rewriting the agent.
- If a team later needs deep specialist answers, add it as a child agent the CCS agent hands off to. Don't start there.
- Staff questions about a team's own documents are already covered by each SharePoint site's built-in agent.

## Build steps

1. Environment: `CCS Agents` (see `02-access-and-permissions.md`).
2. Create the agent "CCS agent". Paste `instructions.md` into Instructions.
3. Knowledge: add the sources in `knowledge-and-actions.md`.
4. Actions: import the three flows as tools (create a request, my requests, find similar solutions). Routing is explained in `knowledge-and-actions.md`.
5. Conversation starters: "Can you automate my process?", "Something has stopped working", "What runs in my area?", "Is there already something that does this?"
6. Test with `evaluation-set.csv` in the Copilot Studio test pane and evaluation tool. Target: the route matches the Product Owner's expected route in at least 90% of cases, and the agent never invents a solution.
7. Shadow mode for four weeks: publish to the Product Owners only; they compare the agent's suggested route and sizing with their own on real requests and log differences.
8. Responsible AI review, then register the agent in Agent 365 (included in E7) for inventory and governance.
9. Publish to Teams and Microsoft 365 Copilot, share with `CCS-AllColleagues`, and add the agent to every CCS site (CCS, the four Lab hubs, Frontier and every team business site) as the site's Copilot entry point and behind every "Ask the CCS agent" button. The buttons say "Ask the CCS agent" everywhere, because it is one agent for the whole platform.
10. Every six months: rerun the evaluation set and review instructions and knowledge.
