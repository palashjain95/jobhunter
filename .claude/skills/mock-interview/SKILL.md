---
name: mock-interview
description: >
  This skill should be used when the user asks for a "mock interview",
  "practice interview", "let's do a mock", or "quiz me". Runs a
  simulated interview with realistic questions, then critiques each
  answer with ratings and improvement suggestions. Only runs when
  explicitly requested.
argument-hint: "<company name and role; optionally specify behavioral/technical/case>"
user-invocable: true
disable-model-invocation: true
allowed-tools: [Read, Grep, Glob]
---

# /mock-interview

## Usage

```
/mock-interview <company name + role>
/mock-interview <company name + role> behavioral
```

## Inputs
- Which company and role (to tailor questions)
- Interview type: behavioral / technical / case / mixed
- knowledge/profile.md — candidate context
- knowledge/stories/ — to evaluate if stories are used well
- knowledge/frameworks/writing-framework.md — to evaluate structure
- If available: output/[company]/interview-prep.md — prepared questions
- ${CLAUDE_PLUGIN_ROOT}/.claude/resources/ — detect the company or career path and load
  the matching framework. Search companies/ (e.g. amazon.md), then paths/ (e.g.
  consulting.md for case + PEI, pe.md for deal discussion), then general.md as fallback.

## How to Run

### Setup
Tell the user:
"I'll ask you questions one at a time. Answer as if you're in the
real interview. After each answer, I'll give brief feedback. At the
end, I'll give a full assessment."

### During the Interview
- Ask 5-7 questions, one at a time
- Mix behavioral + role-specific + curveball
- Start easy, escalate difficulty
- Include at least one question the candidate is likely weak on
- Ask follow-ups like a real interviewer would

### After Each Answer
Give brief feedback (2-3 sentences):
- What worked
- What to adjust
- Rating: **Strong** / **Good** / **Needs Work**

### Output Format (Final Assessment)

```markdown
## Mock Interview Assessment: [Company] — [Role]

**Overall:** Ready / Almost Ready / Needs More Practice

### Strongest Answer
[Which question and why it worked]

### Weakest Answer
[Which question, why it fell short, suggested rewrite]

### Patterns
[Recurring strengths or issues across answers]

### Story Usage
[Did they use prepared stories effectively? Missed opportunities?]

### Framework Adherence
[Did answers follow their writing/communication framework?]

### Top 3 Fixes Before the Real Interview
1. [specific, actionable fix]
2. [specific, actionable fix]
3. [specific, actionable fix]
```

## If Something Goes Wrong
- **User gives very short answers:** Prompt like a real interviewer — "Can you tell me more about...?" Push for specifics.
- **User goes over 2 minutes on an answer:** Flag it — "That ran long. In a real interview, aim for 90 seconds."
- **No company framework found:** Use general behavioral format. Note it.

## After Output
- "Want another round? Just say 'let's do another mock'"
- "Want to refine a specific answer? 'Help me improve my answer to [question]'"
- "Feeling ready? Review your full prep at `/interview-prep`"

## Rules
- Be a realistic interviewer — not too easy, not hostile
- Follow up when answers are vague (real interviewers do this)
- Give honest feedback — "that was great" only when it actually was
- Reference the candidate's prepared stories when they miss opportunities
