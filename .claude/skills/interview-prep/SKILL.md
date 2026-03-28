---
name: interview-prep
description: >
  This skill should be used when the user asks to "prep me for [company]
  interview", "interview prep", "I have an interview", or "help me
  prepare for [company]". Full interview preparation: likely questions
  with STAR frameworks, power stories, company-specific format, follow-up
  questions, and questions to ask.
argument-hint: "<company name and role; optionally specify round type>"
user-invocable: true
context: fork
agent: general-purpose
allowed-tools: [Read, Grep, Glob, WebSearch, WebFetch]
---

# /interview-prep

## Usage

```
/interview-prep <company name + role>
/interview-prep <company name + role> recruiter-screen
```

## How It Works

```
┌─────────────────────────────────────────────────────────┐
│                    INTERVIEW PREP                        │
├─────────────────────────────────────────────────────────┤
│  Step 1: CONTEXT                                         │
│  - Read JD + candidate profile + stories                │
│  - Detect company → load matching framework              │
│    (e.g., amazon.md for LPs, mckinsey-bain-bcg.md)      │
│                                                          │
│  Step 2: PREP PACKAGE                                    │
│  - Likely questions with STAR frameworks                 │
│  - Power stories mapped to question types                │
│  - Smart questions to ask                                │
│  - Red flags + compensation notes                        │
│                                                          │
│  Step 3: FOLLOW-UP QUESTIONS                             │
│  - Scenario questions from JD responsibilities           │
│  - Deep-dive follow-ups for later rounds                 │
│  - Culture + motivation probes                           │
└─────────────────────────────────────────────────────────┘
```

## Inputs
- Job description (provided by user)
- knowledge/profile.md — candidate context
- knowledge/stories/ — STAR story bank
- knowledge/frameworks/writing-framework.md — for structuring verbal answers
- knowledge/values/personal.md — for culture fit and motivation questions
- If available: output/[company]/company-brief.md — use company intel to tailor
- interview-type (if specified): recruiter-screen / technical / hiring-manager / final
- ${CLAUDE_PLUGIN_ROOT}/.claude/resources/ — detect the company or career path and load
  the matching framework. Search companies/ first (e.g. amazon.md, google.md), then
  paths/ (e.g. consulting.md, pe.md, marketplace.md), then fall back to general.md.

## Produce

### 1. Interview Format Prediction
Based on role and company: likely stages, who you'll meet, what each round focuses on.

### 2. Likely Questions (8-12)
For each:

**Q:** [question]
**Why they ask it:** [what they're really evaluating]
**STAR Framework:**
- Situation: [what context to set]
- Task: [your responsibility]
- Action: [specific steps you took]
- Result: [quantified outcome]
**Best story:** [which story from knowledge/stories/ and why]

### 3. Power Stories (3)
From knowledge/stories/, identify the 3 that answer the widest range:
- The story in ~2 minutes
- What it proves about you
- Which questions it can answer

### 4. Questions to Ask the Interviewer (8-10)
Smart questions that signal deep research, strategic thinking, and genuine curiosity.

### 5. Red Flags to Prepare For
Based on profile gaps — how to address proactively.

### 6. Anticipated Follow-Up Questions

**First-Round Follow-Ups:**
**Q:** [question]
**What they're really testing:** [underlying concern]
**What a strong answer looks like:** [framework, not script]

**Scenario Questions:**
**Scenario:** "Imagine you're 3 months in and..."
**What they want to see:** [decision framework]
**Candidate's best angle:** [which story to draw from]

**Culture + Motivation Probes:**
Why this company, why now, why you — specific to this JD.

### 7. Compensation Notes
Expected range for role/level, when to bring it up, how to phrase it.

### Output Format

```markdown
## Interview Format: [Company] — [Role]
**Likely stages:** [stages]
**This round focuses on:** [focus]

---

## Top Questions

### Q1: [question]
**Why they ask:** [evaluation target]
**STAR:**
- **S:** [situation]
- **T:** [task]
- **A:** [action]
- **R:** [result — with numbers]
**Use story:** [story name]

...

## Power Stories
| Story | Proves | Answers |
|-------|--------|---------|
| [name] | [trait] | [question types] |

## Questions to Ask
1. [question] — *signals [what]*

## Red Flags
| Gap | How to Address |
|-----|----------------|
| [gap] | [proactive framing] |

## Follow-Up Questions to Prepare
...

## Compensation
Range: $X-Y | Bring up: [when] | Phrasing: [how]
```

## If Something Goes Wrong
- **No company framework found:** Use general.md as fallback. Note: "Using general behavioral framework — tell me the company for more specific prep."
- **No stories match a likely question:** Flag it: "You don't have a prepared story for [topic]. Run `/personalize stories` to add one."
- **No knowledge base at all:** Stop and say: "Run `/personalize` first — I need your profile and stories to prep effectively."
- **Candidate appears underqualified:** Say so directly. Focus on reframing strengths, not hiding gaps.

## After Output
- "Want to practice? `/mock-interview` for a simulated interview"
- "Track this in your pipeline? `/pipeline-status add [company] [role]`"

## Rules
- Ground every story in actual stories from knowledge/stories/
- Be specific to THIS role and company
- Flag if candidate is underqualified and needs to reframe
- Note where founder experience helps vs needs framing
- Note where education/MBA angle is an asset
- Structure verbal answers using the candidate's writing framework
