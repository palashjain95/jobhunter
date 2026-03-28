---
name: coffee-chat
description: >
  This skill should be used when the user asks for "coffee chat prep",
  "networking prep", "elevator pitch", "tell me about yourself",
  "I just had a coffee chat", or "I'm meeting [person]". Prepares for
  informal networking: person research, smart questions, elevator pitch,
  talking points, and post-chat follow-up messages. Supercharged with
  ~~calendar and ~~email.
argument-hint: "<person name and/or company; or 'I just had a coffee chat with [name]'>"
user-invocable: true
context: fork
agent: general-purpose
---

# /coffee-chat

> If you see unfamiliar `~~` placeholders, see [CONNECTORS.md](../../CONNECTORS.md).

## Usage

```
/coffee-chat <person name at company>
/coffee-chat I'm meeting someone at Stripe tomorrow
/coffee-chat I just had a coffee chat with Sarah at Google
/coffee-chat elevator pitch
```

This is the most important skill in MBA recruiting. Networking drives
more offers than applications.

## How It Works

```
┌─────────────────────────────────────────────────────────┐
│                    COFFEE CHAT                            │
├─────────────────────────────────────────────────────────┤
│  MODE 1: PREP (before the chat)                          │
│  - Research the person + company                         │
│  - Generate smart questions + talking points             │
│  - Build elevator pitch (3 versions)                     │
│  + ~~calendar: auto-detect scheduled chat                │
│                                                          │
│  MODE 2: FOLLOW-UP (after the chat)                      │
│  - Ask about the conversation (one Q at a time)          │
│  - Draft thank-you (email + LinkedIn versions)           │
│  - Suggest pipeline update + next networking steps       │
│  + ~~transcription: auto-pull chat transcript            │
│  + ~~email: create draft for review                      │
└─────────────────────────────────────────────────────────┘
```

## Inputs
- Who they're meeting (name, role, company — or just company)
- Context (coffee chat, info session, alumni call, recruiter meeting)
- Whether this is PREP (before) or FOLLOW-UP (after)
- knowledge/profile.md — candidate background
- knowledge/stories/ — for relevant anecdotes
- knowledge/frameworks/writing-framework.md — for follow-up tone

## Mode 1: PREP (before the conversation)

### 1. Person Research (if name provided)
LinkedIn background, career path, current role. Anything they've written or spoken about. Mutual connections or shared experiences.

### 2. Company Context (quick, not full research)
What the company does, recent news (2-3 bullets). What the team/division does. Any open roles relevant to the candidate.

### 3. Smart Questions (8-10)
NOT interview questions. Networking questions:
- About their experience: "What surprised you most about [role]?"
- About the team: "How does your team think about [topic from their work]?"
- About the culture: "What's something about [company] that outsiders don't see?"
- About career path: "How did you go from [previous role] to [current]?"
- End with: "Who else should I talk to?"

Rules: show you did homework, be genuinely curious, ask things Google can't answer. Never ask about salary, interview process, or "can you refer me?" on a first conversation.

### 4. Elevator Pitch (your 60-second intro)

Structure — Past → Present → Future:
- **Past** (~15 sec): Where you come from, what shaped you. One sentence.
- **Present** (~25 sec): What you're doing now + one specific proof point.
- **Future** (~20 sec): What you're looking for and why it connects to THEM.

Three versions:
- **Networking** (casual) — lighter on credentials, ends with a question back
- **Interview** (structured) — pillar-driven, ends with why THIS role
- **Quick** (~15 sec) — two sentences max, for mixers

Include a practice script with pause marks.

### 5. Talking Points
Connection points between candidate and this person. One thoughtful observation about their company/industry.

### 6. Logistics Reminder
Confirm time/location/video link. Have LinkedIn open. Prep a one-line follow-up text for right after.

## Mode 2: FOLLOW-UP (after the conversation)

Ask the user one question at a time. Wait for each answer before asking the next.

1. "How did it go? What did you talk about?"
2. "What was the most interesting thing they said?"
3. "Did they suggest anyone else to talk to?"
4. "Any next steps they mentioned?"

After gathering answers, confirm before drafting.

### Produce

**Thank-You Message** (send within 24 hours, concise ~75-100 words)
- Reference ONE specific thing from the conversation
- Not transactional — don't ask for anything
- If they suggested someone: "I'll definitely reach out to [name]"

Two versions: Email (slightly more formal) + LinkedIn message (shorter).

**Pipeline Update** — suggest adding to pipeline-data.md with name, date, key takeaways, follow-up actions, when to circle back.

### Output Format (Prep Mode)

```markdown
## Coffee Chat Prep: [Person] at [Company]

### About [Person]
[Background, career path, mutual connections]

### Company Context
- [2-3 quick bullets]

### Questions to Ask
1. [question] — *shows you know about [their work]*
2. ...

### Your Elevator Pitch

**Networking version:**
> [Full pitch text with // pause marks]

**Interview version:**
> [Full pitch text]

**Quick version (15 sec):**
> [Two sentences]

### Talking Points
- [Connection point 1]
- [Observation about their company]

### Logistics
- Time: [check ~~calendar]
- Remember: Connect on LinkedIn after
```

## If Connectors Available

If **~~calendar** is connected:
- Auto-detect scheduled chat and pull date/time/location

If **~~email** is connected:
- Create follow-up as email draft (don't send — user reviews first)

If **~~transcription** is connected:
- Pull transcript to inform follow-up with specific details

## If Something Goes Wrong
- **Can't find person online:** Work with what you have. Note: "Limited public info — ask about their background during the chat."
- **No name provided (just company):** Skip person research, focus on company context and general networking questions.
- **User wants pitch only:** Jump straight to elevator pitch section.

## After Output
For PREP mode:
- "After the chat, come back and say 'I just had my coffee chat with [name]' and I'll help with follow-up"

For FOLLOW-UP mode:
- "Want to track this contact? `/pipeline-status add [company]`"
- "They mentioned someone to talk to? `/coffee-chat [new person]`"
- "Interested in this company? Paste a JD and I'll score it"

## Rules
- Networking is relationship-building, not information extraction
- Never prep someone to ask for a referral on a first conversation
- Referral asks come after 2-3 genuine interactions
- Follow-up must feel personal — if it could be sent to anyone, rewrite it
- Always end with expanding the network: "who else should I talk to?"
- Elevator pitch must feel natural when spoken — no written-language constructions
- Never start a pitch with "So I grew up in..." — start with the interesting part
