#!/bin/sh
set -eu
BASE=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
command -v jq >/dev/null 2>&1 || { echo "jq is required" >&2; exit 2; }

validate_catalog() {
  file=$1
  industry=$2
  jq -e --arg industry "$industry" '
    (.id|type)=="string" and (.version|type)=="string" and .industry==$industry and
    (.playbooks|type)=="array" and (.playbooks|length)>=8 and
    ([.playbooks[] | select(
      .industry!=$industry or (.id|type)!="string" or (.name|type)!="string" or
      (.tier|type)!="string" or (.businessObjective|type)!="string" or
      (.kpis|type)!="array" or (.channels|type)!="array" or
      (.requiredEvents|type)!="array" or (.requiredEventFields|type)!="array" or
      (.requiredIdentifiers|type)!="array" or (.requiredAttributes|type)!="array" or
      (.requiredAssets|type)!="array" or (.requiredPolicies|type)!="array" or
      (.defaultJourney|type)!="array" or (.measurement|type)!="array" or
      (.stopConditions|type)!="array" or (.stopConditions|length)==0 or
      (.activationBlockers|type)!="array" or (.activationBlockers|length)==0
    )] | length)==0 and
    ([.playbooks[].id] | length)==([.playbooks[].id] | unique | length)
  ' "$file" >/dev/null || { echo "FAIL: invalid $industry playbook catalogue" >&2; exit 1; }
}

validate_catalog "$BASE/references/travel.catalog.json" travel
validate_catalog "$BASE/references/bfsi.catalog.json" bfsi
jq empty "$BASE/references/use-case.schema.json" "$BASE/references/approval-policy.json"
echo "PASS: governed Travel and BFSI playbook catalogues"
