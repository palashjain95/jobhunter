# Changelog — CMC (Career Management Center)

## 1.0.0 (2026-03-23)

Initial release.

### Team
- 3 agents: research (analyst), content (writer), coach (advisor)
- Lead coordinates multi-agent workflows with strict file ownership

### Skills (13)
- **Application:** fit-analysis, discover, write-application
- **Interview:** interview-prep, company-research, mock-interview
- **Networking:** coffee-chat (prep + elevator pitch + follow-up)
- **Post-interview:** interview-debrief (debrief + thank-you), follow-up (nudge + rejection + withdrawal)
- **Offers:** offer-analysis (single + multi-offer comparison), negotiate (counter-offer + scripts)
- **Pipeline:** pipeline-status (dashboard + tracking)
- **Setup:** personalize (first-time + incremental updates)

### Interview Frameworks (12)
- Companies: Amazon, Apple, Google, Meta, Microsoft, Netflix
- Paths: Consulting (MBB), PE, Finance, Marketplace, Startups
- General behavioral fallback

### Connectors
- ~~email (Gmail, Microsoft 365)
- ~~calendar (Google Calendar, Microsoft 365)
- ~~transcription (Granola, Fireflies)
- ~~jobs (JobSpy)
- ~~search (Tavily)

### Hooks
- SessionStart: injects candidate profile + pipeline state
- PreToolUse: protects knowledge/ from writes during runs
