# Connectors

## How tool references work

Skills use `~~category` as a placeholder for whatever tool the user connects in that category. For example, `~~email` might mean Gmail, Outlook, or any other email client with an MCP server.

This plugin is **tool-agnostic** — skills describe workflows in terms of categories (email, calendar, transcription, jobs) rather than specific products. Everything works without connectors; they just make it better.

## Connectors for this plugin

| Category | Placeholder | Included in .mcp.json | Alternatives |
|----------|-------------|----------------------|-------------|
| Email | `~~email` | Gmail, Microsoft 365 | Any email MCP server |
| Calendar | `~~calendar` | Google Calendar, Microsoft 365 | Any calendar MCP server |
| Transcription | `~~transcription` | Granola, Fireflies | Otter.ai, Gong, or any meeting transcript MCP server |
| Job Search | `~~jobs` | JobSpy (aggregates Indeed, LinkedIn, Glassdoor, ZipRecruiter) | Dice, Indeed MCP, or any job board MCP server |
| Web Search | `~~search` | Tavily (semantic search API) | Brave Search, or rely on built-in WebSearch |

## Which skills use connectors

| Skill | ~~email | ~~calendar | ~~transcription | ~~jobs | ~~search |
|-------|---------|------------|-----------------|--------|----------|
| `/discover` | | | | ✓ Multi-platform job search | ✓ Career page discovery |
| `/interview-debrief` | ✓ Create draft | | ✓ Auto-analyze transcript | | |
| `/follow-up` | ✓ Create draft | | | | |
| `/coffee-chat` | ✓ Create draft | ✓ Detect scheduled chats | ✓ Pull chat transcript | | |
| `/pipeline-status` | | ✓ Show upcoming interviews | | | |

## Server configuration

MCP servers are configured in `.mcp.json` at the plugin root. Most servers use HTTP transport. JobSpy uses stdio (runs locally via `uvx`). Tavily requires a `TAVILY_API_KEY` environment variable.

Users can add, remove, or replace servers to match their tooling.

## No connectors?

Everything works without them. `/discover` falls back to built-in WebSearch + WebFetch for job discovery. Other skills ask you for information directly and output text for copy-paste.
