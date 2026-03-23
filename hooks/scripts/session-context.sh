#!/bin/bash
# Injects candidate context and pipeline state at session start.
# Every teammate gets this automatically — no need to read files manually.

echo "## Session Context (auto-injected)"
echo ""

# Check if knowledge base exists
if [ -f "knowledge/profile.md" ]; then
  echo "### Candidate Profile"
  # Extract key fields from profile
  grep -A1 "^## Identity" knowledge/profile.md 2>/dev/null | tail -1
  echo ""
  grep -A4 "^## Core Pillars" knowledge/profile.md 2>/dev/null | tail -3
  echo ""
  grep -A2 "^## Target Roles" knowledge/profile.md 2>/dev/null | tail -1
  echo ""
  grep -A2 "^## Target Companies" knowledge/profile.md 2>/dev/null | tail -1
  echo ""

  # Count stories
  STORY_COUNT=$(ls knowledge/stories/*.md 2>/dev/null | wc -l | tr -d ' ')
  echo "**Stories:** ${STORY_COUNT} STAR stories in knowledge/stories/"

  # Check optional files
  [ -f "knowledge/frameworks/writing-framework.md" ] && echo "**Writing framework:** ✅ Set up" || echo "**Writing framework:** ❌ Not set up"
  [ -f "knowledge/negotiation/strategy.md" ] && echo "**Negotiation:** ✅ Set up" || echo "**Negotiation:** ❌ Not set up"
  [ -f "knowledge/voice/samples.md" ] && echo "**Voice samples:** ✅ Set up" || echo "**Voice samples:** ⏭️ Skipped"
  echo ""
else
  echo "⚠️ **Knowledge base not set up.** Run \`/personalize\` before using other skills."
  echo ""
fi

# Inject pipeline state if it exists
if [ -f "pipeline-data.md" ]; then
  echo "### Active Pipeline"
  # Show active applications (skip comments and empty lines)
  grep -A50 "^## Active Applications" pipeline-data.md 2>/dev/null | grep -v "^##" | grep -v "^<!--" | grep -v "^$" | head -10
  echo ""

  # Count applications by rough state
  ACTIVE=$(grep -c "|" pipeline-data.md 2>/dev/null || echo "0")
  echo "**Pipeline entries:** ~${ACTIVE} rows"
  echo ""
else
  echo "### Pipeline"
  echo "No pipeline-data.md yet. Will be created on first \`/pipeline-status add\`."
  echo ""
fi

# Show what output directories exist (active applications)
if [ -d "output" ]; then
  COMPANIES=$(ls -d output/*/ 2>/dev/null | xargs -I{} basename {} | tr '\n' ', ' | sed 's/,$//')
  if [ -n "$COMPANIES" ]; then
    echo "### Active Output Directories"
    echo "Companies with existing work: ${COMPANIES}"
    echo ""
  fi
fi
