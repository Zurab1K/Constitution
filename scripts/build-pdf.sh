#!/usr/bin/env bash
# Builds the PDFs from their Markdown sources.
# Requires pandoc and Google Chrome (or Chromium).
#   ./scripts/build-pdf.sh                  # build all current documents
#   ./scripts/build-pdf.sh SBCS-Constitution.md
set -euo pipefail

cd "$(dirname "$0")/.."

CHROME="${CHROME:-}"
if [[ -z "$CHROME" ]]; then
  for c in "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
           google-chrome google-chrome-stable chromium chromium-browser; do
    if command -v "$c" >/dev/null 2>&1 || [[ -x "$c" ]]; then CHROME="$c"; break; fi
  done
fi
[[ -n "$CHROME" ]] || { echo "Chrome/Chromium not found; set CHROME=/path/to/chrome" >&2; exit 1; }

docs=("$@")
[[ ${#docs[@]} -gt 0 ]] || docs=(SBCS-Constitution.md Hackathon-Committee-Constitution.md)

for md in "${docs[@]}"; do
  base="${md%.md}"
  html="$(mktemp -t constitution).html"
  title="$(grep -m1 '^# ' "$md" | sed 's/^# //')"
  pandoc "$md" --from gfm --to html5 --standalone \
    --metadata title="$title" --variable title="" \
    --css "$PWD/scripts/pdf.css" --resource-path . \
    --output "$html"
  # Make relative asset paths resolve from the repo root.
  sed -i.bak "s|<head>|<head><base href=\"file://$PWD/\">|" "$html" && rm -f "$html.bak"
  "$CHROME" --headless=new --disable-gpu --no-pdf-header-footer \
    --print-to-pdf="$PWD/$base.pdf" "file://$html" 2>/dev/null
  rm -f "$html"
  echo "built $base.pdf"
done
