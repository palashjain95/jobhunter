---
name: personalize
description: >
  This skill should be used when the user asks to "personalize",
  "set up", "get started", "configure my profile", "add a story",
  "update my targets", or "change my writing framework". First-time
  setup or incremental updates to the knowledge base. Detects whether
  this is a new setup or a returning user. Only runs when explicitly
  requested.
argument-hint: "<optional: 'quick', 'full', or a section name like 'stories', 'profile', 'negotiation'>"
disable-model-invocation: true
user-invocable: true
allowed-tools: [Read, Write, Glob, Grep, WebFetch, Bash]
---

# /personalize

## Usage

```
/personalize                    # Auto-detect: new setup or update menu
/personalize quick              # First-time: fast setup from resume
/personalize full               # First-time: complete 9-step walkthrough
/personalize stories            # Update: add or edit stories only
/personalize profile            # Update: change targets, pillars, situation
/personalize negotiation        # Update: adjust comp targets or priorities
/personalize framework          # Update: revise writing framework
```

## Before Anything Else: Detect State

Check if `knowledge/profile.md` exists.

**If it does NOT exist → First-Time Setup** (quick or full mode below).

**If it DOES exist → Returning User.** Read `knowledge/profile.md` and show:

```markdown
Welcome back, [Name]! Here's your current setup:

knowledge/
├── profile.md              ✅ [pillars summary]
├── resume/                 ✅ / ❌
├── stories/                ✅ [N] stories
├── frameworks/             ✅ [framework name]
├── voice/                  ✅ / ⏭️ Not set up
├── negotiation/            ✅ / ⏭️ Not set up
└── values/                 ✅ / ⏭️ Not set up

What would you like to update?
- "Add a new story" → I'll walk you through STAR format
- "Update my targets" → Change target roles or companies
- "Change my comp range" → Update negotiation preferences
- "Redo everything" → Full setup from scratch
- Or tell me what's changed and I'll figure out which section to update
```

If the user specified a section in their command (e.g., `/personalize stories`), skip the menu and go directly to that section.

When updating an existing section, read the current file first, show what's there, then ask what to change. **Never overwrite without showing current state.**

---

## How It Works (First-Time Setup)

```
┌─────────────────────────────────────────────────────────┐
│                    PERSONALIZE                            │
├─────────────────────────────────────────────────────────┤
│  QUICK (5 min): Resume → auto-generate everything        │
│  FULL (20 min): Walk through 9 steps conversationally    │
│                                                          │
│  Step 1: Resume         → knowledge/resume/              │
│  Step 2: Profile        → knowledge/profile.md           │
│  Step 3: Stories (STAR) → knowledge/stories/             │
│  Step 4: Writing style  → knowledge/frameworks/          │
│  Step 5: Voice samples  → knowledge/voice/ (optional)    │
│  Step 6: Negotiation    → knowledge/negotiation/         │
│  Step 7: Values         → knowledge/values/ (optional)   │
│  Step 8: Pipeline setup → pipeline-data.md               │
│  Step 9: Daily check-in → scheduled tasks (optional)     │
│                                                          │
│  Result: Fully personalized recruitment team              │
└─────────────────────────────────────────────────────────┘
```

File templates for each step are in `references/templates.md`. Load them when generating files.

## Quick Start (under 5 minutes)
If the user says "quick setup", "fast", or seems pressed for time:
1. Ask for resume only
2. Auto-generate profile.md from resume (pillars, targets, situation)
3. Auto-extract 3 stories from resume achievements (best-guess STAR)
4. Create sensible defaults for writing framework and negotiation
5. Skip voice samples and personal values
6. Create pipeline-data.md skeleton
7. Tell user: "Quick setup done. You can refine anytime with `/personalize full`"

## Full Setup (20-30 minutes)
Walk through all 9 steps below. Be conversational — ask one section at a time.
After each step, confirm what was saved before moving to the next.

---

## Step 1: Resume

Ask: "Drop your resume here (PDF, or paste the text)."
- If PDF: read and extract key facts
- If text: parse directly
- Save to knowledge/resume/base-resume.pdf (or .md if text)
- Extract: name, current role, education, years of experience, key achievements, technical skills

---

## Step 2: Profile

Ask these one at a time:
1. "What are the 3 things that make you different from other candidates?"
   (e.g., "deep technical skills + MBA + sold a startup")
2. "What roles are you targeting?"
3. "Any specific companies you're focused on?"
4. "What's your current situation?" (e.g., "MBA student graduating in June")

Generate knowledge/profile.md using the template from references/templates.md.

---

## Step 3: Stories (STAR Format)

Extract 3-5 stories from the resume. For each major achievement, ask:
"Tell me more about [achievement]. What was the situation, your role, what you did, and what happened?"

Save each to knowledge/stories/[descriptive-name].md using the STAR template.

If the user has more stories later: `/personalize stories` to add more.

---

## Step 4: Writing Framework

Ask: "Do you have a communication framework or writing style you follow?"

- **If they name one** (Foley, Minto Pyramid, BLUF): generate a structured version, ask for customizations
- **If they describe principles** ("I like being direct"): ask about tone, banned phrases, signature moves
- **If they say "I don't have one"**: ask for a writing sample and reverse-engineer their style

Save to knowledge/frameworks/writing-framework.md using the template.

---

## Step 5: Voice Samples (Optional)

Ask: "Share 1-2 pieces of writing you're proud of — or say 'skip' and I'll work from your writing framework."

If provided: save to knowledge/voice/samples.md with a voice profile analysis at the top.
If skipped: note "No voice samples yet."

---

## Step 6: Negotiation Preferences

Ask one at a time:
1. "What's your target compensation range?"
2. "What matters most — base, equity, remote, title, team quality?"
3. "Is there a number below which you'd walk away?"
4. "Have you negotiated offers before, or is this new territory?"

Save to knowledge/negotiation/strategy.md using the template. If they're new to negotiation, generate a beginner-friendly strategy with scripts.

---

## Step 7: Personal Values (Optional)

Ask: "Is there a personal story, value, or motivation that drives your career? Say 'skip' if you'd rather not share."

If shared: save to knowledge/values/personal.md with guidance on when to use each element.
If skipped: create a minimal file.

---

## Step 8: Pipeline Setup

If pipeline-data.md doesn't exist, create it using the template.
If it already exists, skip this step.

---

## Step 9: Daily Check-In (Optional)

Ask: "Want daily check-ins? Options: pipeline review (morning), role discovery (ongoing), both, or neither."

If yes: create scheduled tasks with CronCreate. If no: skip.

---

## Output Format (When Done)

Show a summary of what was created or updated:

```markdown
Your recruitment team is ready!

knowledge/
├── profile.md              ✅ [Name], [X] years exp
├── resume/                 ✅ Uploaded
├── stories/                ✅ [N] stories extracted
├── frameworks/             ✅ Writing framework: [source]
├── voice/                  ✅ / ⏭️ Skipped
├── negotiation/            ✅ Target: [range]
└── values/                 ✅ / ⏭️ Skipped

pipeline-data.md            ✅ Ready to track
Daily check-ins             ✅ [time] / ⏭️ Skipped
```

## If Something Goes Wrong
- **Resume won't parse:** Ask the user to paste the text directly instead of uploading a file.
- **User gives very short answers:** Ask follow-ups — "Can you give me a specific example?"
- **User wants to skip required steps (resume/profile):** Explain these are needed for all other skills to work. Offer quick mode as compromise.
- **User gets fatigued mid-setup:** Save progress and tell them: "We've saved everything so far. Come back anytime with `/personalize` to continue."
- **User runs personalize but everything already exists:** Show current state and offer update menu. Never overwrite without confirmation.

## After Output
For first-time setup:
- "Have a job in mind? Paste the JD and I'll analyze it"
- "Exploring? `/discover` to find matching roles"
- "Interview coming up? Tell me the company and I'll prep you"

For updates:
- "Updated. Your changes will apply to all future outputs."
- "Want to update anything else? Just tell me what's changed."

## Rules
- Be conversational, not clinical — helpful career coach, not a form
- Ask follow-ups if answers are too short; extract structure if too long
- Never skip profile.md or resume — these are required for first-time setup
- Everything else is optional but recommended
- Create all directories that don't exist yet
- Confirm each file was saved before moving on
- When updating, always show current state before asking what to change
- Never overwrite existing files without showing the user what will change
