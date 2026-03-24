# Jobhunter

<!-- [![GitHub Repo stars](https://img.shields.io/github/stars/palashjain95/jobhunter?style=social)](https://github.com/palashjain95/jobhunter) -->
[![License](https://img.shields.io/github/license/palashjain95/jobhunter)](https://github.com/palashjain95/jobhunter/blob/main/LICENSE)
[![GitHub Issues](https://img.shields.io/github/issues/palashjain95/jobhunter)](https://github.com/palashjain95/jobhunter/issues)
![GitHub Release](https://img.shields.io/github/v/release/palashjain95/jobhunter)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-palashjain-blue?style=social&logo=linkedin)](https://linkedin.com/in/palashjain)

Your AI Career Management Center. An analyst, a writer, and a coach — recruiting support available anytime.

Paste a job description and the team scores your fit, tailors your resume, writes your cover letter, preps you for interviews, and tracks your pipeline — all grounded in your actual experience.

Built for [Claude Code](https://code.claude.com) and [Cowork](https://claude.com/cowork).

---

## What It Does

Tell it what you need. The team handles the rest.

| You say | What happens |
|---------|-------------|
| "Here's a job I'm interested in" | Scores your fit, tailors your resume, writes your cover letter, preps interview questions — one package |
| "Find me roles" | Searches Indeed, LinkedIn, Glassdoor, and company career pages for matches |
| "I have an interview at Google" | Company intel brief + likely questions with STAR stories + mock practice |
| "I just finished my interview" | Debriefs your performance honestly, drafts a personalized thank-you |
| "I got an offer — is it good?" | Comp breakdown vs market data, negotiation strategy with scripts |
| "What should I be doing?" | Pipeline dashboard showing every application, what's next, what's urgent |

No memorizing commands. Just describe your situation.

---

## Your Team

Three specialists, each with a clear role:

**The Researcher** analyzes every job description against your actual background. Scores your fit honestly (0-100), identifies what's missing, optimizes your resume for ATS systems, and builds deep intel briefs on companies before you interview.

**The Writer** crafts everything in your voice — cover letters, LinkedIn outreach, application essays, follow-up messages, rejection responses, and negotiation scripts. Reads your writing framework and voice samples so nothing sounds generic.

**The Coach** owns your entire interview lifecycle. Preps question banks with your STAR stories mapped to likely questions. Runs realistic mock interviews with feedback. Debriefs you after interviews and drafts thank-you emails that reference specific conversation moments. Also handles networking — coffee chat prep, elevator pitch, and follow-up.

When you paste a job description, all three work together: the Researcher scores fit first, the Writer tailors materials using that analysis, and the Coach preps interview questions in parallel. You get one synthesized package.

---

## Get Started

### Install

**Cowork (easiest):** Add via the plugin manager — works with local folders or GitHub sync.

**Claude Code CLI:**
```bash
claude plugin install github:palashjain95/jobhunter
```

Or clone and run locally:
```bash
git clone https://github.com/palashjain95/jobhunter.git
cd jobhunter
claude --plugin-dir .
```

### Personalize (5 minutes)

```
/personalize
```

Drop your resume, answer a few questions about your background and goals, and the team learns who you are. This creates your knowledge base — profile, STAR stories, writing style, negotiation preferences. Everything stays on your machine.

Quick mode takes 5 minutes. Full mode takes 20 and captures more nuance. You can update any section anytime.

---

## Everything It Can Do

| Phase | What | How |
|-------|------|-----|
| **Find** | Search for matching roles across job boards and company pages | `/discover` |
| **Score** | Score resume vs job description (0-100) and optimize for ATS | `/fit-analysis` |
| **Apply** | Cover letter, LinkedIn message, referral ask, application essays | `/write-application` |
| **Research** | Deep company brief — business model, news, culture, competition | `/company-research` |
| **Prep** | Likely interview questions + STAR frameworks + questions to ask | `/interview-prep` |
| **Practice** | Simulated mock interview with real-time feedback | `/mock-interview` |
| **Network** | Coffee chat prep, elevator pitch, smart questions, follow-up | `/coffee-chat` |
| **Debrief** | Post-interview performance analysis + personalized thank-you | `/interview-debrief` |
| **Follow up** | Nudge stalled applications, handle rejections, withdraw gracefully | `/follow-up` |
| **Offers** | Evaluate a single offer or compare multiple side-by-side | `/offer-analysis` |
| **Negotiate** | Counter-offer strategy with email and phone scripts | `/negotiate` |
| **Track** | Pipeline dashboard — all applications, next actions, risk flags | `/pipeline-status` |

You don't need to remember the slash commands. Just describe what you need.

---

## Interview Frameworks

The coach loads company-specific prep automatically:

**Companies:** Amazon (Leadership Principles), Google (Googliness), Meta (Product Execution), Apple (Design Taste), Microsoft (Growth Mindset), Netflix (Keeper Test)

**Career paths:** McKinsey/Bain/BCG (PEI + Case), Private Equity (Deal Discussion + LBO), Finance (IB, Asset Management, Corp Fin), Marketplace (Uber/DoorDash), Startups (Founder Mindset)

General behavioral framework as fallback. Add your own in `.claude/resources/`.

---

## How the Team Coordinates

```
You: "Here's a JD from Stripe"
            ↓
    The Researcher
    scores fit, finds gaps, checks ATS
            ↓
    The Writer                    The Coach
    tailors resume,               builds question bank,
    writes cover letter,          maps your STAR stories,
    drafts outreach               preps follow-up Qs
            ↓                           ↓
    ──────── synthesized into one package ────────
            ↓
    Fit score + resume + cover letter + outreach
    + interview prep + company intel
```

Or use any skill individually — no team coordination needed.

---

## Works Alone, Better Connected

Everything works out of the box. Connect your tools for an even better experience.

| What you do | Without connections | With connections |
|------------|-------------------|-----------------|
| Find roles | Web search | Searches Indeed + LinkedIn + Glassdoor + ZipRecruiter simultaneously |
| Send thank-yous | Copy-paste the text | Creates a draft in Gmail/Outlook — you review before sending |
| Check interview schedule | You tell it | Auto-detects upcoming interviews from your calendar |
| Debrief after interview | You describe what happened | Auto-pulls the transcript and analyzes specific moments |

See [CONNECTORS.md](CONNECTORS.md) for setup.

---

## Use It On the Go

Start a task on your laptop, check progress from your phone. Claude Code's [Remote Control](https://code.claude.com/docs/en/remote-control) lets you connect any session to the Claude web or mobile app.

```
/remote
```

Scan the QR code or open the URL on another device. Your full session — agents, knowledge base, MCP servers — stays running locally. You just get a window into it from anywhere.

**Example:** Paste a JD at your desk, kick off the full package, run `/remote`, walk to class. Check your phone — fit analysis is done, cover letter is ready, interview prep is building. Type "mock interview me" from your phone. The coach runs on your laptop, the conversation happens in your hand.

---

## Your Data Stays Yours

- Your resume, stories, and preferences live in `knowledge/` — local only, never uploaded
- Materials created for each company live in `output/` — local only
- Your application tracker lives in `pipeline-data.md` — local only
- A safety hook prevents any agent from modifying your personal data during runs

The plugin ships the team's intelligence. Your personal content stays on your machine.

---

## Requirements

- **[Claude Code](https://code.claude.com)** or **[Cowork](https://claude.com/cowork)**
- For multi-agent coordination: `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` (optional — every skill works without it)
- All tool connections are optional

---

## License

MIT
