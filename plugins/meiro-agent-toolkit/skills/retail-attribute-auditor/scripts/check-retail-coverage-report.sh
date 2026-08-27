#!/bin/sh
set -eu

file="${1:-}"
if [ -z "$file" ] || [ ! -f "$file" ]; then
  echo "usage: $0 <retail-attribute-coverage.tsv>" >&2
  exit 64
fi

expected='category	recommended_attribute	coverage_state	meiro_attribute_id	meiro_attribute_name	evidence	confidence	confirmed_inputs	missing_inputs_or_decisions	recommended_next_action'
actual=$(sed -n '1p' "$file")
if [ "$actual" != "$expected" ]; then
  echo "FAIL: unexpected TSV header" >&2
  exit 65
fi

awk -F '\t' '
  NR == 1 { next }
  NF != 10 { printf "FAIL: row %d has %d columns\n", NR, NF > "/dev/stderr"; bad=1 }
  $3 !~ /^(PRESENT_EXACT|PRESENT_EQUIVALENT|PRESENT_PARTIAL|DERIVABLE_CONFIRMED|DERIVABLE_CANDIDATE|BLOCKED_MISSING_INPUT|NOT_RECOMMENDED_AS_SINGLE_ATTRIBUTE|UNKNOWN)$/ {
    printf "FAIL: row %d has invalid state: %s\n", NR, $3 > "/dev/stderr"; bad=1
  }
  END { exit bad }
' "$file"

rows=$(awk 'END { print NR - 1 }' "$file")
if [ "$rows" -lt 100 ]; then
  echo "FAIL: report has only $rows rows; checklist appears incomplete" >&2
  exit 66
fi

echo "PASS: coverage report has $rows valid rows"
awk -F '\t' 'NR > 1 { count[$3]++ } END { for (state in count) print state ": " count[state] }' "$file" | sort

