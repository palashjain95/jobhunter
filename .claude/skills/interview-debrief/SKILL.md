---
name: interview-debrief
description: >
  This skill should be used when the user says "I just interviewed",
  "debrief", "thank-you email", "how did my interview go", or
  "post-interview". Analyzes interview performance, reads signals,
  extracts lessons, and drafts a personalized thank-you — all in one
  flow. Supercharged with ~~transcription and ~~email.
argument-hint: "<company name; or just describe what happened>"
user-invocable: true
---

# /interview-debrief

> If you see unfamiliar `~~` placeholders, see [CONNECTORS.md](../../CONNECTORS.md).

## Usage

```
/interview-debrief <company name>
/interview-debrief I just finished my Google PM interview
```

One skill for everything after a formal interview: analyze performance,
extract lessons, and draft the thank-you.

## Inputs

### Auto-detect from ~~transcription (if available)
Before asking the user anything, check if ~~transcription is connected.
If yes: query recent meetings for interviews at the target company.
If a transcript exists, pull it — this replaces most of the questions below.
Tell the user: "I found your interview transcript. Let me analyze it."

### Ask the user (if no transcript found)
Ask these one at a time. Wait for each answer before asking the next.
After gathering context, briefly confirm what you heard before analyzing.

1. "Which company and role was this for?"
2. "What round? (phone screen, technical, HM, final)"
3. "Who did you interview with? (name and role if known)"
4. "What went well? What moment felt strongest?"
5. "What stumbled? Any question that caught you off guard?"
6. "Did they mention next steps or timeline?"

### Also load
- output/[company]/interview-prep.md — what was prepared
- knowledge/stories/ — check if prepared stories were used effectively
- knowledge/frameworks/writing-framework.md — for thank-you tone

## Produce

### 1. Performance Analysis
- **Strong moments:** what worked and why
- **Weak moments:** what didn't land and why
- **Missed opportunities:** stories or points you should have made

### 2. Signal Reading
- What their questions reveal about their concerns
- What their reactions suggest about your fit
- Likelihood of advancing (be honest)

### 3. Gap Analysis
- Questions you weren't prepared for → note for future prep
- Stories that didn't land → refine or replace
- Topics they probed deeply → they care about this

### 4. Next Round Prep
- What to expect in the next stage
- What to emphasize based on what resonated
- What to address based on concerns

### 5. Thank-You Email
- Subject line: specific, not generic
- Concise (~100-150 words)
- Reference one specific moment from the conversation
- Reinforce the strongest point from the interview
- If something went poorly: address briefly with additional context
- Close with enthusiasm for next steps

Two versions:
1. **Email** (slightly more formal)
2. **LinkedIn message** (shorter, if you connected)

### Output Format

```markdown
## Interview Debrief: [Company] — [Round]

### Performance
**Strong:** [what worked]
**Weak:** [what didn't land]
**Missed:** [stories you should have used]

### Signal Reading
**Their concerns:** [what their questions revealed]
**Your fit:** [honest assessment]
**Likelihood of advancing:** [High/Medium/Low — with reasoning]

### For Next Round
- Emphasize: [what resonated]
- Address: [concerns to get ahead of]

---

## Thank-You Email

**Subject:** [specific subject line]

[Full email text — ready to send]

---

**LinkedIn version:**

[Shorter message text]
```

## If Connectors Available

If **~~transcription** is connected:
- Auto-pull transcript for moment-by-moment analysis
- Reference specific things discussed in the thank-you

If **~~email** is connected:
- Create email draft (don't send — user reviews first)
- Tell user: "Draft created — review and send when ready."

## If Something Goes Wrong
- **User can't remember details:** Work with what they have. Note: "Your debrief will be more useful with specifics — jot notes right after interviews."
- **Interview clearly went badly:** Be honest but constructive. Focus on what's actionable for next time.
- **No interview-prep.md exists:** Analyze without comparing to prepared material.

## After Output
- "Track this interview? `/pipeline-status update [company] [round]`"
- "Have another interviewer to thank? Tell me their name"
- "Expecting another round? `/interview-prep` to prep for it"

## Rules
- Be honest, not reassuring — if it went badly, say so
- Focus on actionable improvements, not dwelling on mistakes
- Thank-you must feel personal, not templated
- Never sycophantic — confident gratitude, not gushing
- Reference specific conversation moments, not generic pleasantries
