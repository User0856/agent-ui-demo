# Agent UI demo pages

Small static demo pages with planted mobile layout bugs, published with GitHub Pages. Used in SnapRender videos where an AI agent
(Claude Code over SnapRender's hosted MCP server) screenshots a page on desktop and iPhone and spots what is wrong on mobile.

- `fieldnote/`: a landing page without a viewport meta tag (phones show a shrunken desktop layout).
- `ledgerly/`: a page whose headline did not wrap on small screens (`white-space: nowrap`). In the recorded session, Claude Code
  changed the headline (commit 5748229), saw the overflow in an iPhone screenshot of this preview, and fixed it (commit 82e482a).
- `deploy.sh`: pushes to GitHub Pages and waits until the new version is live (SnapRender cannot reach localhost, so the agent
  checks the public preview).

The bugs are deliberate. More: https://snap-render.com/claude
