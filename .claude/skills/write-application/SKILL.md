---
name: write-application
description: >
  This skill should be used when the user asks to "write a cover letter",
  "draft outreach", "LinkedIn message", "referral ask", "write my essay",
  "answer this application question", or "help me apply to [company]".
  Produces all written application materials in one flow.
argument-hint: "<JD text or company name; for essays, include prompts and word limits>"
user-invocable: true
allowed-tools: [Read, Grep, Glob]
---

# /write-application

## Usage

```
/write-application <paste JD or company name>
/write-application <essay prompt with word limit>
```

## Inputs
- Job description (provided by user)
- knowledge/profile.md — candidate context
- knowledge/frameworks/writing-framework.md — apply to every paragraph
- knowledge/voice/samples.md — match this tone
- If available: output/[company]/fit-analysis.md — what to emphasize
- For essays: the question(s) and word limits

## Produce

### 1. Cover Letter (~250-300 words, 3 paragraphs max)
- **Para 1: Hook** — specific to THIS company. Reference something real. No generic openers.
- **Para 2: Evidence** — specific achievements that map to the role's biggest needs. Use numbers.
- **Para 3: Forward** — what you'll bring, confident close.

### 2. LinkedIn DM
- **Connection note** (max 300 characters)
- **Follow-up message** (concise, ~150 words)
- Hook with something specific about their work. Clear ask, easy to respond to.

### 3. Referral Ask Message (if mutual connection exists)
Warm, specific, not transactional. Give them everything they need to refer in 2 sentences.

### 4. Email Subject Lines
3 options, ranked by open-rate likelihood.

### 5. Application Essays (if essay questions provided)
For each essay question:
- **Draft** — within word limit, ready to submit
- **Word count** — confirm it's within limits (aim for 90-100% of limit)
- **Key choices** — why you emphasized what you did
- **Alternative angle** — a different approach if user wants options

### Output Format

```markdown
## Cover Letter

[Full cover letter text — ready to copy/paste]

---

## LinkedIn

**Connection note (≤300 chars):**
[text]

**Follow-up message:**
[text]

---

## Referral Ask
[text — or "No mutual connection identified"]

---

## Email Subject Lines
1. [option — why it works]
2. [option]
3. [option]

---

## Essay: "[Question]" (word limit: X)
**Word count:** X/Y

[Full essay text]

**Why this angle:** [brief explanation]
**Alternative angle:** [one-sentence alternative if they want a different approach]
```

## If Something Goes Wrong
- **No JD provided:** Ask for it — "Paste the JD or tell me the company and role."
- **No writing framework set up:** Use defaults (direct, confident, evidence-based) and note: "Run `/personalize framework` to set up your voice for better results."
- **No knowledge base at all:** Stop and say: "Run `/personalize` first — I need your profile and stories to write compelling materials."
- **Essay exceeds word limit:** Cut ruthlessly. Every sentence must earn its place.

## After Output
- "Want to adjust the tone? Tell me what to change"
- "Have essay prompts? Paste them and I'll draft responses"
- "Ready to track this? `/pipeline-status add [company] [role]`"
- "Need interview prep? `/interview-prep`"

## Rules
- Apply writing framework to every paragraph — no exceptions
- Match candidate's voice from samples
- Never use: "I am writing to express my interest"
- Never use: "I am passionate about"
- Tone: confident, specific, human — not corporate, not desperate
- Never fabricate stories or metrics — reference specific stories from knowledge/stories/
- "Why company" must reference something only TRUE of that company
