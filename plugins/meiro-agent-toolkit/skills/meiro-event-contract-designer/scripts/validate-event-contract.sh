#!/bin/sh
set -eu
[ "$#" -eq 1 ] || { echo "usage: $0 <event-contract.json>" >&2; exit 2; }
command -v jq >/dev/null 2>&1 || { echo "jq is required" >&2; exit 2; }
jq -e '
  .schemaVersion == "1.0" and .state == "offline_proposal" and
  (.events | type == "array") and
  ([.events[]? | select((.name|type)!="string" or (.version|type)!="string" or (.evidenceState|IN("OBSERVED","DERIVED","PROPOSED","BLOCKED","UNKNOWN")|not) or (.fields|type)!="array")] | length == 0) and
  (.identityTransitions | type == "array") and (.consentRules | type == "array") and
  .deploymentPerformed == false
' "$1" >/dev/null || { echo "FAIL: invalid or unsafe event contract" >&2; exit 1; }
echo "PASS: safe offline event contract"
