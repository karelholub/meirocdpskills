#!/bin/sh
set -eu
[ "$#" -eq 1 ] || { echo "usage: $0 <qa-plan.json>" >&2; exit 2; }
command -v jq >/dev/null 2>&1 || { echo "jq is required" >&2; exit 2; }
jq -e '
  .schemaVersion == "1.0" and .state == "offline_plan" and
  (.scope | type == "array") and (.tests | type == "array") and
  ([.tests[]? | select((.id|type)!="string" or (.status|IN("PASS","FAIL","BLOCKED","NOT_RUN","UNKNOWN")|not))] | length == 0) and
  .liveValidation.approved == false and .activationApproved == false and .meiroWritePerformed == false
' "$1" >/dev/null || { echo "FAIL: invalid or unsafe QA plan" >&2; exit 1; }
echo "PASS: safe offline QA plan"
