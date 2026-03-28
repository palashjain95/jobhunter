# Interview Frameworks

Company and career-path specific interview preparation frameworks.
Loaded automatically by `/interview-prep` and `/mock-interview` based on
company or role detection.

## Structure

```
resources/
├── companies/          # Named company frameworks
│   ├── amazon.md       # Leadership Principles
│   ├── apple.md        # Design Taste + Cross-Functional
│   ├── google.md       # Product Sense + Googliness
│   ├── meta.md         # Product Execution + Metrics
│   ├── microsoft.md    # Growth Mindset
│   └── netflix.md      # Culture Deck + Keeper Test
├── paths/              # Career path / industry frameworks
│   ├── consulting.md   # McKinsey/Bain/BCG — PEI + Case
│   ├── finance.md      # IB, Corp Finance, Asset Management
│   ├── marketplace.md  # Uber/DoorDash — Marketplace Dynamics
│   ├── pe.md           # Private Equity — Deal Discussion + LBO
│   └── startups.md     # Founder Mindset + First 90 Days
├── general.md          # Fallback behavioral framework
└── README.md           # This file
```

## Loading Logic

1. Detect company name from JD or user input
2. Search `companies/` for exact match (case-insensitive)
3. If no company match, search `paths/` for career path match
4. Fall back to `general.md` if nothing matches

## Adding New Frameworks

Create a new .md file in the appropriate directory:
- **Specific company** (e.g., Salesforce, Oracle) → `companies/salesforce.md`
- **Career path** (e.g., data science, product marketing) → `paths/data-science.md`
- **Industry** (e.g., healthcare, energy) → `paths/healthcare.md`

Follow the existing format:
1. Title + context
2. Interview structure (rounds, format)
3. Key evaluation areas (what they test)
4. Question patterns + how to answer
5. Company/path-specific tips
