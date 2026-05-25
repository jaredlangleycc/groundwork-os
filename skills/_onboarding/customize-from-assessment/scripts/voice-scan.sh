#!/usr/bin/env bash
# voice-scan.sh — scan text against the user's voice-rules
#
# Usage:
#   ./voice-scan.sh path/to/voice-rules.md path/to/text-to-check.md
#   echo "some text" | ./voice-scan.sh path/to/voice-rules.md -
#
# Exits 0 if clean. Exits 1 if violations found (printed to stderr).

set -euo pipefail

VOICE_RULES="${1:-}"
INPUT="${2:-}"

if [[ -z "$VOICE_RULES" || -z "$INPUT" ]]; then
    echo "Usage: voice-scan.sh <voice-rules.md> <text-file|->" >&2
    exit 2
fi

if [[ ! -f "$VOICE_RULES" ]]; then
    echo "voice-rules file not found: $VOICE_RULES" >&2
    exit 2
fi

if [[ "$INPUT" == "-" ]]; then
    TEXT=$(cat)
else
    TEXT=$(cat "$INPUT")
fi

# Extract banned phrases from voice-rules.md
# Looks for the BANNED PHRASES section, expects comma-separated list
BANNED=$(awk '/^## BANNED PHRASES/{flag=1; next} /^##/{flag=0} flag' "$VOICE_RULES" | tr -d '\n' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

VIOLATIONS=0

if [[ -n "$BANNED" ]]; then
    IFS=',' read -ra PHRASES <<< "$BANNED"
    for phrase in "${PHRASES[@]}"; do
        phrase_trimmed=$(echo "$phrase" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        if [[ -z "$phrase_trimmed" ]]; then continue; fi
        if echo "$TEXT" | grep -iq -- "$phrase_trimmed"; then
            echo "VIOLATION: banned phrase '$phrase_trimmed'" >&2
            VIOLATIONS=$((VIOLATIONS+1))
        fi
    done
fi

# Em-dash check (off by default — only fires if voice-rules says em-dashes off)
if grep -q "em_dashes: off" "$VOICE_RULES" 2>/dev/null; then
    if echo "$TEXT" | grep -q '—'; then
        echo "VIOLATION: em-dash detected (em_dashes: off in voice-rules)" >&2
        VIOLATIONS=$((VIOLATIONS+1))
    fi
fi

# "X, not Y" antipattern check
if grep -q "not_x_y_pattern: off" "$VOICE_RULES" 2>/dev/null; then
    if echo "$TEXT" | grep -qE ', not [a-z]'; then
        echo "VIOLATION: 'X, not Y' antipattern detected" >&2
        VIOLATIONS=$((VIOLATIONS+1))
    fi
fi

if [[ $VIOLATIONS -eq 0 ]]; then
    echo "VOICE SCAN: clean"
    exit 0
else
    echo "VOICE SCAN: $VIOLATIONS violations" >&2
    exit 1
fi
