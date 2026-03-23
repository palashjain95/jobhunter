---
name: fit-analysis
description: >
  This skill should be used when the user asks to "score this JD",
  "should I apply", "analyze this role", "optimize my resume",
  "ATS scan", or "tailor my resume". Scores resume-to-JD fit (0-100),
  identifies gaps, and optimizes resume for ATS. Decides if the user
  should apply AND tailors resume if yes.
argument-hint: "<JD text, file, or URL>"
user-invocable: true
context: fork
agent: general-purpose
allowed-tools: [Read, Grep, Glob, WebFetch]
---

# /fit-analysis

> If you see unfamiliar `~~` placeholders, see [CONNECTORS.md](../../CONNECTORS.md).

## Usage

```
/fit-analysis <paste JD, drop file, or provide URL>
```

## How It Works

```
┌─────────────────────────────────────────────────────────┐
│                   FIT ANALYSIS                            │
├─────────────────────────────────────────────────────────┤
│  Step 1: FIT SCORE (should you apply?)                   │
│  - Score 0-100 across 4 dimensions                      │
│  - Must-have / nice-to-have requirements check           │
│  - Strengths + gaps + recommendation                     │
│                                                          │
│  Step 2: RESUME OPTIMIZATION (if applying)               │
│  - ATS compatibility check                               │
│  - Keyword gap analysis                                  │
│  - Rewritten bullet points with missing keywords         │
│  - Summary/headline rewrite for this role                │
└─────────────────────────────────────────────────────────┘
```

## Inputs
- Job description (file, URL, or pasted text)
- Candidate resume from knowledge/resume/
- Candidate profile from knowledge/profile.md

If URL provided, fetch the full JD text first.

## Produce

### Part 1: Fit Score

#### 1. Overall Fit Score (0-100)
Score across 4 dimensions (0-25 each):
- Technical skills match
- Domain experience match
- Seniority/scope match
- Culture/values signals

#### 2. Requirements Check
List every must-have and nice-to-have from the JD.
For each: **Met** / **Partial** / **Missing** — with specific evidence from the resume.

#### 3. Strengths + Gaps
- Top strengths to highlight for THIS role
- Top gaps to address — and how to mitigate each

#### 4. Recommendation
Strong Apply / Apply / Apply with Modifications / Skip — with one sentence of reasoning.

### Part 2: Resume Optimization (if recommendation is Apply or above)

If recommendation is Skip, skip this section entirely.

#### 5. ATS Compatibility Check
Flag formatting issues, missing section headers, or problematic elements (tables, columns, graphics).

#### 6. Keyword Gap Analysis

| Keyword | Importance | Where to Add |
|---------|------------|--------------|
| [term from JD] | High/Medium/Low | [which section] |

#### 7. Rewritten Bullet Points
For each relevant experience, rewrite bullets to embed missing keywords naturally:

**Original:** [original bullet]
**Rewritten:** [new bullet]
**Why:** [what changed and why]

#### 8. Summary/Headline Rewrite
Rewrite the resume summary specifically for this role.

### Output Format

```markdown
## Fit Score: 73/100
Technical: 20/25 | Domain: 18/25 | Seniority: 22/25 | Culture: 13/25

### Recommendation: Apply with Modifications
[One sentence reasoning]

### Requirements Check
| Requirement | Type | Status | Evidence |
|-------------|------|--------|----------|
| ... | Must-have | Met | [from resume] |

### Strengths
1. [strength with evidence]

### Gaps
1. [gap — mitigation strategy]

---

## Resume Optimization

### Keywords to Add
| Keyword | Importance | Where to Add |
| ... | ... | ... |

### Bullet Rewrites
**Original:** ...
**Rewritten:** ...
**Why:** ...
```

## If Something Goes Wrong
- **JD is too vague:** Flag what's missing and score conservatively. Note: "This JD lacks specifics — score may shift with more detail."
- **No resume found:** Ask the user to run `/personalize` first.
- **Role is clearly a mismatch:** Say so directly. Don't soften a Skip.

## After Output
Suggest next steps based on the score:
- Score 70+: "Ready to apply? `/write-application` for cover letter and outreach"
- Score < 50: "Want to find better-fit roles? `/discover`"
- Any score: "Want company intel? `/company-research [company]`"
- If resume was optimized: "Want me to apply these changes? Just say 'yes, update it'"

## Rules
- Be brutally honest, not encouraging
- Ground every point in specific resume evidence
- Never give generic advice or fabricate experience
- Flag if role is a reach vs a fit
- Note where founder/entrepreneurial experience helps vs hurts
- Note where education angle is an asset
- Only add keywords the candidate actually has — no keyword-stuffing
