---
name: follow-up
description: >
  This skill should be used when the user says "follow up on [company]",
  "I haven't heard back", "I got rejected", "didn't get the role",
  "nudge [company]", or "rejection from [company]". Handles stalled
  applications and rejections: draft follow-up messages, process
  rejections gracefully, keep doors open. Supercharged with ~~email.
  For post-interview thank-yous, use /interview-debrief. For networking
  follow-ups, use /coffee-chat.
argument-hint: "<company name; or describe the situation>"
user-invocable: true
---

# /follow-up

> If you see unfamiliar `~~` placeholders, see [CONNECTORS.md](../../CONNECTORS.md).

## Usage

```
/follow-up <company name>
/follow-up I haven't heard back from Stripe
/follow-up I got rejected from Google
```

Two modes: nudge stalled applications, or process a rejection gracefully.

## Inputs
- Which company/role
- Whether this is a FOLLOW-UP (no response) or REJECTION (got a no)
- pipeline-data.md — current status and timeline
- knowledge/profile.md — candidate context
- knowledge/frameworks/writing-framework.md — communication style
- For rejection: what they said, how far you got
- If available: output/[company]/fit-analysis.md, interview-prep.md

## Mode 1: Follow-Up (stalled application)

### Timing Rules
- After applying, no response: follow up after 5-7 business days
- After no response to first follow-up: one more nudge after ~5 days
- After two follow-ups with no response: stop. Application is cold.

### Produce

**Follow-Up Message** (concise, ~75-100 words)
- Lead with something real — new context, relevant news, additional insight
- Restate interest briefly
- Make it easy to respond (yes/no question or clear next step)

Two versions: Email (with subject line) + LinkedIn message (shorter).

**Context Note** — why this follow-up is appropriate now, what risk exists, when to give up.

## Mode 2: Handle Rejection

### Ask the user (if details not provided)
One at a time:
1. "Which company and role?"
2. "What stage were you at? (applied / screened / interviewed / final)"
3. "What did they say?"

### Produce

**1. What This Rejection Tells You**
- Stage signal (what rejection at this stage typically means)
- Pattern check (is this repeated? what's emerging?)
- What was in your control vs not

**2. Gracious Response** (send within 24-48 hours, concise ~50-75 words)
- Thank them genuinely, express continued interest, leave the door open
- DO NOT ask why you were rejected or push back

Two versions: Email + LinkedIn message.

**3. Lessons Extracted**
Stage-specific analysis: what to improve for next time.

**4. Pipeline Update**
Move to Closed with date, stage, key lesson.

**5. What's Next**
Redirect energy to active applications. Flag patterns if emerging.

### Output Format

```markdown
## Follow-Up: [Company]

**Context:** [Why following up now — days since last contact, what stage]
**Risk:** [What happens if you don't follow up]

### Email

**Subject:** [subject line]

[Full email text — ready to send]

### LinkedIn

[Shorter message text]

---

**Next move if no response:** [when to nudge again, or when to stop]
```

## If Connectors Available

If **~~email** is connected:
- Create as email draft (don't send — user reviews first)
- Tell user: "Draft created — review and send when ready."

## If Something Goes Wrong
- **Application is clearly dead:** Say so honestly. Don't waste the user's time crafting messages for a cold lead.
- **User wants to follow up a third time:** Advise against it. Explain why.
- **Rejection with no details:** Work with what you have; note that patterns are hard to read without specifics.

## After Output
For follow-up mode:
- "Check all your pending applications? `/pipeline-status`"
- "If no response after this, one more nudge then move on"
- "Want to find new roles? `/discover`"

For rejection mode:
- "See your active applications? `/pipeline-status`"
- "Want to find new roles? `/discover`"
- "Need to recalibrate? Paste a JD and I'll score your fit"

For withdraw/decline mode:
- "Pipeline updated. `/pipeline-status` to see your active applications"
- "Want to stay connected? I'll draft a LinkedIn note to keep the relationship warm"

## Mode 3: Withdraw / Decline (after accepting another offer)

When the user has accepted an offer and needs to exit other processes gracefully.

Ask: "Which companies do you need to withdraw from?"

### Produce

**Withdrawal Message** (concise, ~50-75 words per company)
- Thank them for their time and the opportunity
- Note you've accepted another position (don't name the company)
- Express genuine interest in staying connected
- Leave the door open for the future

Two versions: Email + LinkedIn message.

**Pipeline Update** — move each company to Closed with status: withdrawn.

## Rules
- Never: "I just wanted to check in" or "I hope this finds you well"
- Always lead with value or new information in follow-ups
- If application is likely dead, say so honestly
- For rejections: be honest but not brutal — respect that rejection hurts
- Never say "it wasn't meant to be" or "everything happens for a reason"
- Focus on what's actionable, not what's done
- Always end with forward momentum
