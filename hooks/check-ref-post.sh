#!/bin/bash
INPUT=$(cat)
if echo "$INPUT" | grep -q 'references/'; then
  echo '[hook] Reference file modified — run /validate-video-refs to check consistency' >&2
fi
