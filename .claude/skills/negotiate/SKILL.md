---
name: negotiate
description: >
  This skill should be used when the user asks to "negotiate this offer",
  "counter-offer", "how do I negotiate", or "negotiation strategy for
  [company]". Crafts counter-offer strategy with scripts for email and
  phone. Only runs when explicitly requested.
argument-hint: "<company name and offer details; or 'negotiate my [company] offer'>"
user-invocable: true
disable-model-invocation: true
allowed-tools: [Read, Grep, Glob, WebSearch, WebFetch]
---

# /negotiate

## Usage

```
/negotiate <company name>
/negotiate my Stripe offer — I want to push on equity
```

## Inputs
- Offer details and evaluation (from /offer-analysis or user)
- knowledge/negotiation/strategy.md — framework and preferences
- knowledge/profile.md — leverage context
- Any competing offers or alternatives

## Produce

### 1. Counter-Offer Strategy
What to ask for (specific numbers/terms), in what order, what to concede if needed, walk-away point.

### 2. BATNA Analysis
Candidate's best alternative, leverage strength, how to reference alternatives without bluffing.

### 3. Counter-Offer Email
Draft the actual email (~150-200 words):
- Structure: appreciation → enthusiasm → specific asks → flexibility signal
- Apply the candidate's writing framework

### 4. Phone Negotiation Script
- Opening line
- Key talking points (3 max)
- How to handle pushback
- Closing (leave door open)

### 5. Timing
When to respond, how to buy time if needed, deadline awareness.

### 6. If They Say No
How to respond to a flat "no", what smaller wins to ask for, when to accept gracefully.

### Output Format

```markdown
## Negotiation Strategy: [Company]

### What to Ask For
1. [Component]: [current] → [target] — [reasoning]
2. ...

**Walk-away point:** [threshold]
**Concession order:** [what to give up first if needed]

### BATNA
**Your best alternative:** [description]
**Leverage:** Strong / Moderate / Limited — [reasoning]

---

### Counter-Offer Email

**Subject:** [subject line]

[Full email text — ready to send]

---

### Phone Script

**Open with:** "[opening line]"

**Key points:**
1. [point with phrasing]
2. [point with phrasing]
3. [point with phrasing]

**If they push back on [X]:** "[response]"
**Close with:** "[closing line]"

---

### Timing
- Respond by: [date/timeframe]
- If you need more time: "[buying time script]"
```

## If Something Goes Wrong
- **No offer details available:** Ask for them — "What's the current offer? I need numbers to negotiate from."
- **Limited leverage (no competing offers, no special skills):** Be honest about it. Focus on other negotiable elements (start date, title, remote flexibility).
- **User wants to negotiate aggressively beyond market:** Flag the risk. "Pushing past $X could signal misalignment with their band."

## After Output
- "After the conversation, tell me how it went and I'll help with next moves"
- "Have other offers? `/offer-analysis` to compare side-by-side"
- "Track the offer status? `/pipeline-status update [company] negotiating`"

## Rules
- Apply the candidate's negotiation framework from knowledge/
- Never bluff about competing offers
- Never be adversarial — this is a partnership negotiation
- Be honest if there's limited leverage
- Flag if negotiating could risk the offer
