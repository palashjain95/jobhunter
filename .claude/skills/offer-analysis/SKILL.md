---
name: offer-analysis
description: >
  This skill should be used when the user says "evaluate this offer",
  "I got an offer from [company]", "compare my offers", "which offer
  should I take", or "is this offer good". Evaluates single offers
  against market data and compares multiple offers side-by-side with
  weighted scoring. Recommends accept/negotiate/walk.
argument-hint: "<offer details: company, base, equity, bonus, etc.>"
user-invocable: true
context: fork
agent: general-purpose
allowed-tools: [Read, Grep, Glob, WebSearch, WebFetch]
---

# /offer-analysis

## Usage

```
/offer-analysis <paste offer details>
/offer-analysis I got an offer from Stripe: $180k base, 50k RSUs...
/offer-analysis compare Stripe vs Google offers
```

## How It Works

```
┌─────────────────────────────────────────────────────────┐
│                   OFFER ANALYSIS                          │
├─────────────────────────────────────────────────────────┤
│  SINGLE OFFER → Evaluate                                 │
│  - Break down total comp (Y1, Y2, 4-year)               │
│  - Compare to market data                                │
│  - Recommend: accept / negotiate / walk                  │
│                                                          │
│  MULTIPLE OFFERS → Compare                               │
│  - Side-by-side table + weighted scoring                 │
│  - Best/risk/ceiling analysis per offer                  │
│  - "What you'll regret" for each option                  │
└─────────────────────────────────────────────────────────┘
```

## Inputs
- Offer details (from user — base, equity, sign-on, benefits, etc.)
- Company and role (one or more)
- knowledge/profile.md — seniority context
- knowledge/negotiation/strategy.md — comp preferences and priorities
- If available: output/[company]/offer-analysis.md for prior evaluations

## Part 1: Single Offer Evaluation

### 1. Offer Breakdown

| Component | Amount | Notes |
|-----------|--------|-------|
| Base salary | | |
| Equity/RSUs | | Vesting schedule |
| Sign-on bonus | | |
| Annual bonus | | Target % |
| Benefits | | Health, 401k match, etc. |
| PTO | | |
| Remote/hybrid | | |

**Total comp:** Year 1 | Year 2 | 4-year total

### 2. Market Comparison
How this compares to market for role/level/location. Cite sources (levels.fyi, Glassdoor, Blind). Verdict: Below / At / Above Market.

### 3. Candidate Alignment
How this maps to priorities from knowledge/negotiation/strategy.md. Does it meet the walk-away threshold?

### 4. What's Negotiable
What to push on, what to accept, in what order.

### 5. Recommendation
Accept as-is / Negotiate specific items / Strong negotiate / Walk away — with reasoning.

## Part 2: Multi-Offer Comparison (if 2+ offers)

### 6. Side-by-Side Comparison

| Factor | Offer A | Offer B |
|--------|---------|---------|
| Total comp (Y1) | | |
| Growth trajectory | | |
| Role scope | | |
| ... | | |

### 7. Weighted Score (using candidate priorities)

### 8. Qualitative Analysis
For each: best case, risk case, growth ceiling.

### 9. Decision Framework
Recommendation by priority lens (comp vs growth vs balance).

### 10. What You'll Regret
For each option — the thing you might regret in a year.

### Output Format

```markdown
## Offer Analysis: [Company] — [Role]

### Breakdown
| Component | Amount | Notes |
|-----------|--------|-------|
| Base | $X | |
| Equity | $X | 4yr vest, 1yr cliff |
| ... | | |
| **Total Y1** | **$X** | |

### Market Comparison
**Verdict:** At Market
[Reasoning with data sources]

### Alignment with Your Priorities
1. [Priority]: ✅ Met / ⚠️ Partial / ❌ Missing
2. ...

### What's Negotiable
1. [Component] — [typical room at this company]

### Recommendation: **Negotiate specific items**
[One paragraph reasoning]
```

## If Something Goes Wrong
- **Incomplete offer details:** Ask for what's missing — "What's the equity/bonus structure?"
- **Can't find market data:** Note the limitation. Provide ranges based on available data.
- **User has unrealistic expectations:** Flag it honestly — "Market for this role/level is $X-Y."
- **Exploding offer (short deadline):** Flag the deadline prominently. Draft a time-extension request: grateful tone, specific reason ("finalizing another process"), propose a concrete new date. Note: most deadlines are negotiable by 3-7 days.

## After Output
- "Track this offer? `/pipeline-status update [company] offer`"
- "Want to negotiate? `/negotiate` for counter-offer strategy and scripts"
- "Need more company context? `/company-research [company]`"
- "Ready to decide? Tell me which one and I'll help you respond"
- "Ready to accept? Tell me and I'll draft your acceptance message"

## Rules
- Don't just compare numbers — compare trajectories
- Never fabricate market data — cite sources
- Respect the candidate's stated priorities, don't impose your own
- Be honest if an offer is genuinely strong — or genuinely weak
- Flag if expectations are unrealistic for the market
