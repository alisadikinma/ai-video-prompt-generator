#!/bin/bash
INPUT=$(cat)
if echo "$INPUT" | grep -q 'references/'; then
  echo '[hook] Modifying reference file — run /validate-video-refs after' >&2
fi
