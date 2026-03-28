---
name: discover
description: >
  This skill should be used when the user asks to "find me roles",
  "what should I apply to", "search for jobs", "discover roles",
  or "what's out there". Searches across job boards, company careers
  pages, and the web for roles matching the candidate's profile.
  Surfaces hidden gems and triages by fit. Supercharged with ~~jobs
  for multi-platform search and ~~search for semantic discovery.
argument-hint: "<optional: specific company, role type, or job board URL>"
user-invocable: true
context: fork
agent: general-purpose
allowed-tools: [Read, Grep, Glob, WebFetch, WebSearch]
---

# /discover

> If you see unfamiliar `~~` placeholders, see [CONNECTORS.md](../../CONNECTORS.md).

## Usage

```
/discover
/discover product manager at fintech startups
/discover senior PM roles in NYC
/discover <URL to job board or company careers page>
```

## How It Works

```
┌─────────────────────────────────────────────────────────┐
│                      DISCOVER                            │
├─────────────────────────────────────────────────────────┤
│  Phase 1: Build queries from profile                     │
│  - Expand target titles to adjacent roles               │
│  - Map seniority level to search terms                  │
│                                                          │
│  Phase 2: Search across sources                          │
│  - Target company careers pages (if companies listed)   │
│  - Web search (LinkedIn, job boards, career pages)      │
│  - Industry-specific boards                             │
│                                                          │
│  Phase 3: Evaluate and fetch JDs                         │
│  - Quick fit score (High / Medium / Low)                │
│  - Fetch full JD text when possible                     │
│  - Flag logistics (visa, relocation, start date)        │
│                                                          │
│  Phase 4: Triage and present                             │
│  - Deduplicate, rank by fit, group by company           │
│  - Separate: Role Matches vs Hidden Gems                │
└─────────────────────────────────────────────────────────┘
```

Detailed search strategies are in `references/search-strategies.md`. Load it for
platform-specific query patterns and title expansion tables.

## Inputs
- Candidate profile from knowledge/profile.md (target roles, companies, location, situation)
- Optional: specific company, role type, job board URL, or search criteria from user
- If pipeline-data.md exists: check for existing contacts that could be referral paths

## Produce

### 1. Role Matches
For each discovered role:

| Company | Title | Location | Quick Fit | Posted |
|---------|-------|----------|-----------|--------|
| [name] | [role] | [remote/city] | High/Med/Low | [date or ~age] |

One sentence on why it matches. Link to posting. If JD was fetched, include
top 3 requirements so user can evaluate without clicking through.

### 2. Hidden Gems
Roles the candidate might not think to look for:
- Adjacent titles (e.g., "Chief of Staff" when targeting "Strategy")
- Emerging categories in their domain
- Companies they haven't considered
- MBA leadership programs or rotational programs at target companies

### 3. Triage Recommendations
- **Apply now** — strong fit, don't wait
- **Worth a look** — run `/fit-analysis` for deeper analysis
- **Reach but interesting** — apply if time permits, note what's missing
- **Skip** — poor fit, explain why briefly

### 4. Referral Opportunities
If any discovered roles are at companies where the candidate has existing
contacts (from pipeline-data.md or coffee-chat history), flag: "You have a
contact at [company] — referral path possible."

### Output Format

```markdown
## Role Discovery: [N] roles found

### Apply Now
**Stripe — Senior PM, Payments** (SF / Remote) 🟢 High fit
> Top requirements: payments experience, cross-functional leadership, data-driven
> Why it fits: [one sentence mapping to profile]
> [Link] | Posted ~3 days ago

**Plaid — Product Lead, Developer Platform** (SF) 🟢 High fit
> ...

### Worth a Look
**[Company] — [Role]** ([Location]) 🟡 Medium fit
> Why to look: [reason]. Run `/fit-analysis` for full scoring.

### Hidden Gems
- **[Company] — Chief of Staff** — You wouldn't have searched for this,
  but your ops + strategy background maps well. [Link]

### Referral Paths
- 🤝 **Stripe** — You had coffee with Sarah Chen (PM). Consider reaching out.

### Skip
- **[Company]** — [brief reason: seniority mismatch / location / etc.]
```

## If Connectors Available

If **~~jobs** is connected (JobSpy or similar):
- Use it as the PRIMARY search engine — it aggregates Indeed, LinkedIn, Glassdoor,
  and ZipRecruiter in a single structured query
- Filter by: job type, location, remote status, salary range, posting recency
- This replaces manual web searching for job boards

If **~~search** is connected (Tavily or similar):
- Use for semantic discovery: finding company careers pages, niche industry boards,
  MBA program recruiting pages, and startup job listings that don't appear on
  major boards
- Also useful for finding "hidden gems" — companies hiring for adjacent roles

If neither is connected:
- Fall back to built-in WebSearch + WebFetch
- Search multiple queries across different sources (see references/search-strategies.md)

## If Something Goes Wrong
- **No good matches found:** Say so honestly. Suggest broadening: "Your search is very specific — want me to expand to adjacent titles or new industries?"
- **Candidate's targets seem too narrow:** Flag it with data: "Only 3 results for 'AI PM at Series A climate startups in NYC' — broader search would surface more options."
- **Candidate's targets seem too broad:** Suggest focusing: "50+ results. Want to filter by [industry / location / company size]?"
- **No knowledge base:** Stop and say: "Run `/personalize` first — I need your profile to search effectively."
- **Job board URL provided but can't fetch:** Note the limitation, search the web for the same company instead.

## After Output
- "Interested in one? Paste the JD and I'll score it with `/fit-analysis`"
- "Want deeper intel on a company? `/company-research [company]`"
- "Ready to apply? `/write-application` for cover letter and outreach"
- "Track these? `/pipeline-status add [company] [role]`"

## Rules
- Use web search actively — search multiple sources, not just one query
- Load references/search-strategies.md for platform-specific patterns
- Expand target titles to adjacent roles (see title expansion table in references)
- Only surface roles that genuinely match the candidate's profile
- Don't pad the list — a few strong matches beats many weak ones
- Fetch JD text when possible so user can evaluate without clicking
- Note posting age — stale postings (60+ days) should be flagged
- Note logistics: visa sponsorship, relocation, start date constraints
- Cross-reference with pipeline-data.md for referral opportunities
