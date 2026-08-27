#!/bin/sh
set -eu
[ "$#" -eq 1 ] || { echo "usage: $0 <instance-blueprint.json>" >&2; exit 2; }
command -v jq >/dev/null 2>&1 || { echo "jq is required" >&2; exit 2; }
jq -e '
  .schemaVersion == "1.0" and .state == "offline_proposal" and
  (.environment | type == "object") and (.objective | type == "string") and
  (.evidence | type == "array") and (.objects | type == "array") and
  ([.objects[]? | select((.logicalKey|type)!="string" or (.kind|type)!="string" or (.evidenceState|IN("OBSERVED","DERIVED","PROPOSED","BLOCKED","UNKNOWN")|not))] | length == 0) and
  .approval.implementationApproved == false and .approval.activationApproved == false and
  .meiroWritePerformed == false
' "$1" >/dev/null || { echo "FAIL: invalid or unsafe instance blueprint" >&2; exit 1; }
echo "PASS: safe offline instance blueprint"
