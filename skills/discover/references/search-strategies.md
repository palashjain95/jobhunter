# Search Strategies for Role Discovery

Platform-specific query patterns and search logic. Load this when
running `/discover` to build effective searches.

## Phase 1: Build Search Queries from Profile

Read knowledge/profile.md and extract:
- **Target titles** → primary search terms
- **Target companies** → direct career page searches
- **Skills/domain** → keyword filters
- **Location preferences** → geographic filters
- **Current situation** → timing filters (immediate vs future start)

### Title Expansion
Don't search only the exact target title. Expand to adjacent roles:

| Target | Also search |
|--------|-------------|
| Product Manager | Technical PM, Product Lead, Product Strategy, Group PM, Product Owner |
| Strategy Consultant | Strategy Associate, Business Strategy, Corporate Strategy, Chief of Staff |
| Data Scientist | ML Engineer, Applied Scientist, Analytics Lead, Research Scientist |
| Operations | Business Operations, Strategy & Ops, RevOps, Growth Operations |
| Finance | FP&A, Corporate Development, Strategic Finance, Investor Relations |
| General Management | GM, Business Unit Lead, P&L Owner, Managing Director |

### Seniority Mapping
MBA candidates typically target:
- **Post-MBA entry:** Associate, Senior Associate, Manager, Product Manager L5-L6
- **With prior experience:** Senior Manager, Principal, Director (if 8+ years)
- **Career switchers:** May need to go one level lower in new function

## Phase 2: Search Across Sources

### Source 1: Company Careers Pages (for target companies)
If profile lists specific target companies, search their careers pages directly:
- `[company].com/careers` or `[company].com/jobs`
- Search with title keywords
- Check "MBA" or "Early Career" or "University" program pages
- Many companies have dedicated MBA hiring pages (Goldman Sachs, McKinsey, Google, Amazon)

### Source 2: Web Search (broad discovery)
Construct queries combining:
```
"[title]" "[location/remote]" "[industry keyword]" site:linkedin.com/jobs
"[title]" "[company]" careers
"MBA" "[function]" "[industry]" hiring 2026
"[title]" "[domain keyword]" remote OR "[city]"
```

### Source 3: Job Board Patterns
Different industries use different boards:

| Industry | Primary boards |
|----------|---------------|
| Tech (PM, Eng, Data) | LinkedIn, levels.fyi/jobs, Greenhouse boards, company careers |
| Consulting (MBB, boutique) | Firm careers pages, LinkedIn, MBA career services |
| Finance (IB, PE, AM) | LinkedIn, WSO, company careers, Heidrick & Struggles |
| Startups | LinkedIn, YC Work at a Startup (workatastartup.com), AngelList/Wellfound |
| Corporate Strategy/Ops | LinkedIn, company careers |

### Source 4: MBA-Specific Channels
- Check if companies are listed as recruiting at major MBA programs
- Look for "MBA Leadership Programs" or "rotational programs"
- Companies like Google, Amazon, Meta, Microsoft have dedicated MBA pipelines

## Phase 3: Evaluate Each Role

For each discovered role, assess:

1. **Quick fit** (High/Medium/Low) based on:
   - Title match to target roles
   - Seniority alignment
   - Location/remote match
   - Industry/domain alignment

2. **Fetch JD if possible** — use WebFetch to pull the full JD text from the posting URL. Include key requirements in the output so user can evaluate without clicking through.

3. **Flag logistics** — visa sponsorship, relocation required, start date constraints

## Phase 4: Deduplicate and Prioritize

- Remove duplicate postings across sources
- Rank by fit level (High first)
- Group by company if multiple roles at same company
- Separate into: Role Matches (searched for) vs Hidden Gems (discovered adjacent)

## Search Tips

- **Recency matters:** Filter to last 30 days when possible. Stale postings waste time.
- **Don't over-search:** 5-10 strong matches beats 30 mediocre ones.
- **Check posting date:** If a role has been open 60+ days, it may be filled or have issues.
- **Company size signals:** Series A-C startups may not post on LinkedIn — check their websites directly.
- **Referral advantage:** If discover finds a role at a company where the user has a contact (from pipeline-data.md or coffee-chat history), flag it as "referral possible."
