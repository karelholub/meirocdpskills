#!/bin/sh
set -eu

file="${1:-}"
if [ -z "$file" ] || [ ! -f "$file" ]; then
  echo "usage: $0 <campaign-plan.json>" >&2
  exit 64
fi

command -v jq >/dev/null 2>&1 || {
  echo "jq is required" >&2
  exit 69
}

jq -e '
  .schemaVersion == "1.0" and
  .state == "offline_proposal" and
  .meiroWritePerformed == false and
  .activationApproved == false and
  .productionReady == false and
  (.name | type == "string") and
  (.objective | type == "string") and
  (.channel | IN("email", "sms", "whatsapp", "push")) and
  (.audience | type == "object") and
  (.content | type == "object") and
  (.delivery | type == "object") and
  (.measurement | type == "object") and
  (.readinessChecks | type == "array") and
  (.assumptions | type == "array") and
  (.openQuestions | type == "array")
' "$file" >/dev/null || {
  echo "DENIED: invalid or unsafe campaign proposal" >&2
  exit 65
}

if jq -e 'any(.. | strings; test("(^|[^A-Za-z])(mpat_|Bearer[ ]|api[_-]?key|secret[ ]*=)"; "i"))' "$file" >/dev/null; then
  echo "DENIED: proposal appears to contain a credential" >&2
  exit 66
fi

if command -v shasum >/dev/null 2>&1; then
  digest=$(shasum -a 256 "$file" | awk '{print $1}')
else
  digest=$(sha256sum "$file" | awk '{print $1}')
fi

echo "PASS: safe offline proposal"
echo "SHA-256: $digest"
