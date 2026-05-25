#!/usr/bin/env python3
"""
Parse a NightShiftOS assessment output block into a structured JSON profile.

Usage:
  python3 parse-assessment.py path/to/assessment-output.md
  cat assessment-output.md | python3 parse-assessment.py -

Prints JSON to stdout. Exits non-zero on malformed input.
"""

import json
import re
import sys
from pathlib import Path


HEADER = "NIGHTSHIFTOS ASSESSMENT OUTPUT"
FOOTER = "END ASSESSMENT"

SECTIONS = [
    ("01", "identity"),
    ("02", "values"),
    ("03", "brand_state"),
    ("04", "voice"),
    ("05", "current_state"),
    ("06", "offer"),
    ("07", "sales"),
    ("08", "marketing"),
    ("09", "goals"),
    ("10", "risk"),
    ("11", "stack"),
    ("12", "coach_style"),
]


def read_input():
    if len(sys.argv) != 2:
        print("Usage: parse-assessment.py <path|->", file=sys.stderr)
        sys.exit(1)
    arg = sys.argv[1]
    if arg == "-":
        return sys.stdin.read()
    return Path(arg).read_text()


def extract_sections(text):
    if HEADER not in text:
        raise ValueError(f"Missing header: {HEADER}")
    if FOOTER not in text:
        raise ValueError(f"Missing footer: {FOOTER}")
    body = text.split(HEADER, 1)[1].split(FOOTER, 1)[0]
    sections = {}
    pattern = re.compile(r"^## (\d{2}) (\w+)\s*$", re.MULTILINE)
    matches = list(pattern.finditer(body))
    if len(matches) != len(SECTIONS):
        raise ValueError(
            f"Expected {len(SECTIONS)} sections, found {len(matches)}"
        )
    for i, m in enumerate(matches):
        start = m.end()
        end = matches[i + 1].start() if i + 1 < len(matches) else len(body)
        num = m.group(1)
        sections[num] = body[start:end].strip()
    return sections


def parse_kv_block(block):
    """Parse a simple key: value block. Handles inline values and yaml lists."""
    data = {}
    current_key = None
    current_list = None
    for line in block.splitlines():
        if not line.strip():
            continue
        if line.startswith("  - "):
            if current_list is not None:
                current_list.append(line[4:].strip())
            continue
        if re.match(r"^[a-z_]+:\s*$", line):
            key = line.rstrip(":").strip()
            current_list = []
            data[key] = current_list
            current_key = key
            continue
        m = re.match(r"^([a-z_]+):\s*(.*)$", line)
        if m:
            key = m.group(1)
            val = m.group(2).strip()
            data[key] = val
            current_list = None
            current_key = key
    return data


def parse_assessment(text):
    sections = extract_sections(text)
    profile = {"_meta": {"schema_version": "0.1.0"}}
    for num, name in SECTIONS:
        if num not in sections:
            raise ValueError(f"Missing section {num} {name}")
        profile[name] = parse_kv_block(sections[num])
    return profile


def main():
    text = read_input()
    try:
        profile = parse_assessment(text)
    except ValueError as e:
        print(f"Parse error: {e}", file=sys.stderr)
        sys.exit(2)
    print(json.dumps(profile, indent=2))


if __name__ == "__main__":
    main()
