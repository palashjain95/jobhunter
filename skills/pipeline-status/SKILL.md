---
name: pipeline-status
description: >
  This skill should be used when the user asks about "pipeline",
  "what's my status", "what should I be doing", "track [company]",
  or "what's next". Shows the application pipeline dashboard, adds
  roles, updates status, and surfaces prioritized next actions.
  Supercharged with ~~calendar for upcoming interviews.
argument-hint: "<optional: 'add [company] [role]' or 'update [company] [status]'>"
user-invocable: true
---

# /pipeline-status

> If you see unfamiliar `~~` placeholders, see [CONNECTORS.md](../../CONNECTORS.md).

## Usage

```
/pipeline-status
/pipeline-status add Stripe Senior PM
/pipeline-status update Google technical
/pipeline-status followup Stripe
```

## How It Works

```
┌─────────────────────────────────────────────────────────┐
│                   PIPELINE STATUS                        │
├─────────────────────────────────────────────────────────┤
│  /pipeline-status           → Full dashboard             │
│  /pipeline-status add       → Add new application        │
│  /pipeline-status update    → Update status              │
│  /pipeline-status followup  → Draft follow-up message    │
│                                                          │
│  + ~~calendar: show upcoming interviews, flag unprepped  │
├─────────────────────────────────────────────────────────┤
│  🔴 Needs Action Today                                   │
│  🟡 Watch List                                           │
│  🟢 Active — Waiting                                     │
│  ⚫ Closed                                               │
└─────────────────────────────────────────────────────────┘
```

## Inputs
- pipeline-data.md at project root — source of truth
- knowledge/profile.md — for follow-up tone
- Arguments: none (full status), or "add/update/followup [company] [details]"

## Commands

### /pipeline-status (no args) — Full Dashboard

| Company | Role | Status | Last Action | Next Action | Due |
|---------|------|--------|-------------|-------------|-----|

Grouped by priority:
- **Needs Action Today** — overdue for follow-up or pending tasks
- **Watch List** — something happening or due soon
- **Active — Waiting** — in progress, no action needed
- **Closed** — rejected, withdrawn, declined

Plus:
- **This Week's Priority** — single most important action
- **Risk Flags** — going cold or needs urgent attention
- **Pattern Observations** — if consistently failing at a stage, flag it

### /pipeline-status add [company] [role]
Add new application to pipeline-data.md with date applied, source, contact.

### /pipeline-status update [company] [status]
Status options: applied | recruiter-screen | technical | hiring-manager | final | offer | negotiating | accepted | rejected | withdrawn | cold

### /pipeline-status followup [company]
Draft follow-up using timing rules (5-7 days, then 5 more, then stop).

### Output Format

```markdown
## Pipeline Dashboard
*Last updated: [date]*

### 🔴 Needs Action Today
| Company | Role | Status | Next Action | Due |
|---------|------|--------|-------------|-----|
| Stripe | Senior PM | Applied | Follow up | Today |

### 🟡 Watch List
| ... |

### 🟢 Active — Waiting
| ... |

### ⚫ Closed (last 30 days)
| ... |

---

**This week's priority:** Follow up with Stripe — it's been 7 days.
**Risk flag:** Google application going cold — no response in 12 days.
**Pattern:** 3 rejections at screen stage — consider refining your pitch.
```

## If Connectors Available

If **~~calendar** is connected:
- Check next 7 days for interview-like events
- Add **Upcoming Interviews** section to dashboard
- Flag any interview without a corresponding interview-prep.md

## If Something Goes Wrong
- **No pipeline-data.md exists:** Create it. "Starting your pipeline tracker now."
- **Pipeline is empty:** Suggest `/discover` to find roles.
- **Application status is unclear:** Ask the user to clarify.

## After Output
Contextual next steps based on pipeline state:
- No response 5+ days → "Follow up? `/follow-up [company]`"
- Interview scheduled, no prep → "Prep for [company]? `/interview-prep`"
- Post-interview, no thank-you → "Send a thank-you? `/interview-debrief [company]`"
- Offer received → "Evaluate this? `/offer-analysis [company]`"
- Pipeline empty → "Find new roles? `/discover`"
- Application looks dead → Be honest and suggest moving on
- Pattern detected (e.g., 3+ rejections at same stage) → "Looks like a pattern — want to talk through what's happening and adjust your approach?"

## Rules
- pipeline-data.md is the source of truth — update it after every change
- Always suggest the exact next action
- Be honest if an application looks dead
- Flag patterns across the pipeline
