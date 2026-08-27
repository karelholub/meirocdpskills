#!/bin/sh
set -eu
[ "$#" -eq 1 ] || { echo "usage: $0 <change-bundle.json>" >&2; exit 2; }
command -v jq >/dev/null 2>&1 || { echo "jq is required" >&2; exit 2; }
jq -e '
  .schemaVersion=="1.0" and .state=="offline_bundle" and
  (.target|type)=="object" and (.actions|type)=="array" and
  ([.actions[]? | select((.action|IN("create","update")|not) or (.logicalKey|type)!="string" or (.payloadPath|type)!="string" or (.payloadSha256|test("^[a-f0-9]{64}$")|not))] | length)==0 and
  (.explicitExclusions|index("activate"))!=null and
  .approval.draft==false and .approval.validation==false and .approval.activation==false and
  .meiroWritePerformed==false
' "$1" >/dev/null || { echo "FAIL: invalid or unsafe change bundle" >&2; exit 1; }
echo "PASS: immutable offline change bundle"
