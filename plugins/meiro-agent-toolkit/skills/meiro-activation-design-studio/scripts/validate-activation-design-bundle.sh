#!/bin/sh
set -eu

bundle="${1:-}"
[ -n "$bundle" ] && [ -d "$bundle" ] || {
  echo "usage: $0 <activation-design-bundle-directory>" >&2
  exit 64
}

command -v jq >/dev/null 2>&1 || {
  echo "jq is required" >&2
  exit 69
}

for name in brand-evidence.json activation-creative-brief.json personalization-matrix.json exact-content-ledger.json design-qa.json; do
  [ -f "$bundle/$name" ] || {
    echo "DENIED: missing $name" >&2
    exit 65
  }
  jq empty "$bundle/$name" || {
    echo "DENIED: invalid JSON in $name" >&2
    exit 65
  }
done

jq -e '
  .schemaVersion == "1.0" and .state == "offline_evidence" and
  (.sources | type == "array") and (.tokens | type == "array") and
  ([.tokens[]? | select((.evidenceState | IN("OBSERVED_VISUAL","OBSERVED_CODE","PROVIDED","PROPOSED","UNKNOWN") | not))] | length == 0) and
  .brandApproved == false and .websiteWritePerformed == false
' "$bundle/brand-evidence.json" >/dev/null || {
  echo "DENIED: unsafe or invalid brand evidence" >&2
  exit 65
}

jq -e '
  .schemaVersion == "1.0" and .state == "offline_proposal" and
  .campaignSource.sourceOfTruth == true and
  (.channels | type == "array") and
  ([.channels[]? | select(. != "email" and . != "web")] | length == 0) and
  (.directions | type == "array") and (.directions | length > 0) and
  (.artifacts | type == "array") and (.openQuestions | type == "array") and
  .approvals.brandApproved == false and .approvals.legalApproved == false and
  .approvals.businessApproved == false and .approvals.activationApproved == false and
  .productionReady == false and .meiroWritePerformed == false and
  .websiteWritePerformed == false and .channelWritePerformed == false
' "$bundle/activation-creative-brief.json" >/dev/null || {
  echo "DENIED: unsafe or invalid activation creative brief" >&2
  exit 65
}

jq -e '
  .schemaVersion == "1.0" and .state == "offline_proposal" and
  (.fields | type == "array") and
  ([.fields[]? | select((.key | type) != "string" or (.source | type) != "string" or (.fallback | type) != "string" or (.missingBehavior | type) != "string")] | length == 0) and
  (.prohibitedDerivations | type == "array") and
  .customerDataIncluded == false and .meiroWritePerformed == false
' "$bundle/personalization-matrix.json" >/dev/null || {
  echo "DENIED: unsafe or invalid personalization matrix" >&2
  exit 65
}

jq -e '
  .schemaVersion == "1.0" and .state == "offline_ledger" and
  (.items | type == "array") and
  ([.items[]? | select((.status | IN("EXACT","DRAFT","UNKNOWN","PROHIBITED_TO_INVENT") | not))] | length == 0) and
  .inventedRegulatedClaim == false and .legalApproved == false and .brandApproved == false
' "$bundle/exact-content-ledger.json" >/dev/null || {
  echo "DENIED: unsafe or invalid exact-content ledger" >&2
  exit 65
}

jq -e '
  .schemaVersion == "1.0" and .state == "offline_plan" and
  (.scope | type == "array") and (.tests | type == "array") and
  ([.tests[]? | select((.id | type) != "string" or (.status | IN("PASS","FAIL","BLOCKED","NOT_RUN","UNKNOWN") | not))] | length == 0) and
  .liveValidation.approved == false and .brandApproved == false and .legalApproved == false and
  .activationApproved == false and .productionReady == false and
  .meiroWritePerformed == false and .websiteWritePerformed == false and .channelWritePerformed == false
' "$bundle/design-qa.json" >/dev/null || {
  echo "DENIED: unsafe or invalid design QA plan" >&2
  exit 65
}

if jq -s -e 'any(.. | strings; test("(^|[^A-Za-z])(mpat_|Bearer[ ]|api[_-]?key|secret[ ]*=)"; "i"))' \
  "$bundle/brand-evidence.json" \
  "$bundle/activation-creative-brief.json" \
  "$bundle/personalization-matrix.json" \
  "$bundle/exact-content-ledger.json" \
  "$bundle/design-qa.json" >/dev/null; then
  echo "DENIED: bundle appears to contain a credential" >&2
  exit 66
fi

echo "PASS: safe offline activation design bundle"
for name in brand-evidence.json activation-creative-brief.json personalization-matrix.json exact-content-ledger.json design-qa.json; do
  if command -v shasum >/dev/null 2>&1; then
    digest=$(shasum -a 256 "$bundle/$name" | awk '{print $1}')
  else
    digest=$(sha256sum "$bundle/$name" | awk '{print $1}')
  fi
  echo "$name SHA-256: $digest"
done
