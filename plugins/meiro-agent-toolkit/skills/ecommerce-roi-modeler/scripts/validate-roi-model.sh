#!/bin/sh
set -eu

if [ "$#" -ne 1 ]; then
  echo "usage: $0 <ecommerce-roi-model.xlsx>" >&2
  exit 2
fi

workbook=$1
[ -f "$workbook" ] || { echo "FAIL: workbook not found: $workbook" >&2; exit 1; }
command -v unzip >/dev/null 2>&1 || { echo "FAIL: unzip is required" >&2; exit 2; }
unzip -t "$workbook" >/dev/null

workbook_xml=$(unzip -p "$workbook" xl/workbook.xml)
for sheet in Assumptions "Use Cases" Summary Checks Sources; do
  printf '%s' "$workbook_xml" | grep -Fq "name=\"$sheet\"" || {
    echo "FAIL: missing required sheet: $sheet" >&2
    exit 1
  }
done

if unzip -l "$workbook" | grep -q 'xl/externalLinks/'; then
  echo "FAIL: external workbook links are not allowed" >&2
  exit 1
fi

content=$(unzip -p "$workbook" 'xl/worksheets/*.xml' xl/sharedStrings.xml 2>/dev/null || true)
for label in ILLUSTRATIVE CLIENT-CONFIRMED "Annual net contribution" "Sources &amp; Evidence Log"; do
  printf '%s' "$content" | grep -Fq "$label" || {
    echo "FAIL: missing governance label: $label" >&2
    exit 1
  }
done

echo "PASS: governed ecommerce ROI workbook structure"
