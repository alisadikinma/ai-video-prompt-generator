#!/bin/bash
INPUT=$(cat)
if echo "$INPUT" | grep -q 'references/'; then
  echo '[hook] Reference file modified — run /video-validate to check consistency' >&2
fi
