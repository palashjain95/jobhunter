#!/bin/bash
# Blocks writes to knowledge/ directory during agent runs.
# knowledge/ is READ-ONLY — only /personalize can modify it.

# $TOOL_INPUT is passed by Claude Code containing the tool's parameters
# Check if the write target is inside knowledge/
if echo "$TOOL_INPUT" | grep -q "knowledge/"; then
  echo '{"decision":"block","reason":"knowledge/ is READ-ONLY during runs. Use /personalize to update your profile, stories, or frameworks."}'
else
  echo '{"decision":"approve"}'
fi
