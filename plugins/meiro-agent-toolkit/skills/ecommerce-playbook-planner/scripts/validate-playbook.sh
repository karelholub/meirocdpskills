#!/bin/sh
set -eu
BASE=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
MANIFEST=${1:-"$BASE/references/manifest.json"}
command -v jq >/dev/null 2>&1 || { echo "jq is required" >&2; exit 2; }
jq -e '
  .id == "meiro-ecommerce" and (.version|type)=="string" and
  (.playbooks|type)=="array" and (.playbooks|length)>0 and
  ([.playbooks[] | select(
    (.id|type)!="string" or (.name|type)!="string" or (.tier|type)!="string" or
    (.kpis|type)!="array" or (.channels|type)!="array" or
    (.requiredEvents|type)!="array" or (.requiredEventFields|type)!="array" or
    (.requiredAttributes|type)!="array" or (.requiredAssets|type)!="array" or
    (.requiredPolicies|type)!="array" or (.defaultJourney|type)!="array" or
    (.activationBlockers|type)!="array"
  )] | length)==0
' "$MANIFEST" >/dev/null || { echo "FAIL: invalid ecommerce playbook catalogue" >&2; exit 1; }
echo "PASS: structured ecommerce playbook catalogue"
