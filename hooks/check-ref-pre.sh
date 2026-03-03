#!/bin/bash
INPUT=$(cat)
if echo "$INPUT" | grep -q 'references/'; then
  echo '[hook] Modifying reference file — run /video-validate after' >&2
fi
