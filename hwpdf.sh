#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  hwpdf file.md              -> file.html and file.pdf
  hwpdf file.md output.html  -> output.html only
  hwpdf file.md output.pdf   -> output.html and output.pdf
EOF
}

error() {
  echo "Error: $*" >&2
  usage
  exit 1
}

if (( $# < 1 || $# > 2 )); then
  usage
  exit 1
fi

input="$1"
[[ -f "$input" ]] || error "file not found: $input"

script_dir="${HOME}/.local/share/hwpdf"
css_file="${script_dir}/style.css"

input_base="${input%.*}"
html_out="${input_base}.html"
pdf_out="${input_base}.pdf"
need_pdf=1

if (( $# == 2 )); then
  out="$2"
  case "$out" in
    *.html)
      html_out="$out"
      need_pdf=0
      ;;
    *.pdf)
      pdf_out="$out"
      html_out="${out%.pdf}.html"
      ;;
    *)
      error "second arg must be .html or .pdf"
      ;;
  esac
fi

pandoc "$input" \
  --standalone \
  --from=markdown \
  --to=html \
  --css="$css_file" \
  --embed-resources \
  --mathml \
  --variable titleblock=false \
  --metadata "pagetitle=$(basename "${2:-$input}" | sed 's/\.[^.]*$//')" \
  --output "$html_out" \

if (( need_pdf )); then
  chromium \
    --headless \
    --disable-logging \
    --log-level=3 \
    --no-pdf-header-footer \
    --print-to-pdf="$pdf_out" \
    "file://$(realpath "$html_out")" \
    2>/dev/null
fi

if (( need_pdf )); then
  echo "Generated: $html_out and $pdf_out"
else
  echo "Generated: $html_out" 
fi
