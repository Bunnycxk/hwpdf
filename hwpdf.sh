#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage:"
  echo "  hwpdf file.md            -> file.html"
  echo "  hwpdf file.md file.html"
  # echo "  hwpdf --pdf file.md      -> file.pdf"
}

if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

MODE="html"

if [[ "$1" == "--pdf" ]]; then
  MODE="pdf"
  shift
fi

INPUT="$1"

if [[ ! -f "$INPUT" ]]; then
  echo "Error: file not found: $INPUT"
  exit 1
fi

BASE="${INPUT%.*}"
HTML="${BASE}.html"
PDF="${BASE}.pdf"

SCRIPT_DIR="${HOME}/.local/share/hwpdf"
CSS="${SCRIPT_DIR}/style.css"

if [[ "$MODE" == "html" ]]; then

  if [[ $# -ge 2 ]]; then
    HTML="$2"
  fi

  pandoc "$INPUT" \
    --standalone \
    --from=markdown \
    --to=html \
    --css="$CSS" \
    --embed-resources \
    --mathml \
    --output "$HTML"

  echo "Generated: $HTML"
fi