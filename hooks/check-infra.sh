#!/bin/bash
INPUT=$(cat)
if echo "$INPUT" | grep -qE '(plugin\.json|marketplace\.json|hooks\.json)'; then
  echo '[hook] BLOCKED: Infrastructure file — confirm with user before editing' >&2
  exit 2
fi
