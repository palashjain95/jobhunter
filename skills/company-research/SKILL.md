---
name: company-research
description: >
  This skill should be used when the user asks to "research [company]",
  "tell me about [company]", "company research", or "what should I know
  about [company]". Produces a deep company intel brief: business model,
  recent news, culture signals, competitive landscape, and smart
  questions to ask.
argument-hint: "<company name; optionally include role title>"
user-invocable: true
context: fork
agent: general-purpose
allowed-tools: [Read, Grep, Glob, WebSearch, WebFetch]
---

# /company-research

## Usage

```
/company-research <company name>
/company-research <company name> <role title>
```

## Inputs
- Company name and role title (from user)
- Optional: interview type (recruiter-screen / technical / HM / final)
- knowledge/profile.md — to map company priorities to candidate
- knowledge/stories/ — to identify relevant stories

If URL provided, fetch the company website and careers page.

## Produce

### 1. Company Snapshot
What they do (one sentence), business model, stage (headcount, revenue, funding), key customers, founding team.

### 2. Recent News + Signals (last 90 days)
Product launches, funding, leadership changes, press, controversies. What is the company focused on RIGHT NOW?

### 3. The Role in Context
Why is this role open? What problem does this hire solve? What does year 1 success look like?

### 4. Candidate's Angle
Which stories from knowledge/stories/ map to their priorities? What unique insight can the candidate bring?

### 5. Competitive Landscape
Main competitors, differentiation, biggest threat, industry tailwinds vs headwinds.

### 6. Culture + Values Intel
Public messaging, Glassdoor/Blind/LinkedIn signals, what the interview process signals about values.

### 7. Smart Questions to Ask (8-10)
Grounded in actual research:

**Q:** [question]
**Why ask it:** [what it signals about you]
**Best moment:** [which interview stage / interviewer]

### 8. "What Do You Know About Us?" Answer
One paragraph. Grounded in research. Ends with why the candidate is excited about THIS moment in the company's journey.

### Output Format

```markdown
## [Company Name] — Intel Brief

### Snapshot
[One paragraph: what they do, business model, stage]

### Recent News (last 90 days)
- [news item — date]
- [news item — date]
**Right now they're focused on:** [key theme]

### This Role
**Why it's open:** [growth/replacement/new initiative]
**Year 1 success:** [what great looks like]

### Your Angle
- Story: "[story name]" maps to their priority of [X]
- Unique insight: [observation about their space]

### Competitive Landscape
| Competitor | Differentiation | Threat Level |
|------------|----------------|--------------|
| [name] | [how they differ] | High/Med/Low |

### Culture Intel
**Green flags:** [positive signals]
**Watch for:** [concerns or unknowns]

### Questions to Ask
1. [question] — *signals [what]*

### "What Do You Know About Us?"
> [One paragraph answer — ready to use]
```

## If Something Goes Wrong
- **Company is too small/new for public info:** Note what's missing. Suggest: "Can you share anything they sent you? Internal docs help fill gaps."
- **News is stale (nothing in 90 days):** Widen to 6 months but flag: "Limited recent activity — could signal stability or stagnation."
- **Can't determine why role is open:** Say so. Suggest asking in the interview.

## After Output
- "Ready to prep for the interview? `/interview-prep`"
- "Want to practice? `/mock-interview` for a simulated interview"

## Rules
- Use web search for current info — never rely on stale data
- Flag anything that changed recently
- Be specific: "they launched X in February" beats "they're growing"
- Connect every insight to interview strategy
