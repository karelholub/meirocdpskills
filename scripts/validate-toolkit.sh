#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
PLUGIN="$ROOT/plugins/meiro-agent-toolkit"

command -v jq >/dev/null 2>&1 || { echo "jq is required" >&2; exit 2; }
command -v ruby >/dev/null 2>&1 || { echo "ruby is required" >&2; exit 2; }

jq -e '.name=="meiro-agent-toolkit" and (.version|test("^[0-9]+\\.[0-9]+\\.[0-9]+$")) and .skills=="./skills/"' "$PLUGIN/.codex-plugin/plugin.json" >/dev/null
jq -e '(.name=="meiro-team") and ((.plugins|length)==1) and (.plugins[0].name=="meiro-agent-toolkit")' "$ROOT/.agents/plugins/marketplace.json" >/dev/null

ruby -rjson -ryaml -e '
  root=ARGV[0]
  files=Dir[File.join(root,"skills/*/SKILL.md")]
  abort "expected 19 skills" unless files.length==19
  files.each do |file|
    data=YAML.load_file(file)
    folder=File.basename(File.dirname(file))
    abort "skill name mismatch: #{file}" unless data["name"]==folder
    abort "missing description: #{file}" if data["description"].to_s.empty?
    agent=File.join(File.dirname(file),"agents/openai.yaml")
    next unless File.file?(agent)
    meta=YAML.load_file(agent)
    abort "invalid agent metadata: #{agent}" unless meta.dig("interface","display_name").to_s!="" && meta.dig("interface","short_description").to_s!=""
  end
' "$PLUGIN"

for required in \
  SKILL.md \
  agents/openai.yaml \
  assets/activation-creative-brief.template.json \
  assets/brand-evidence.template.json \
  assets/design-qa.template.json \
  assets/exact-content-ledger.template.json \
  assets/personalization-matrix.template.json \
  references/bundle-contract.md \
  references/email-activation.md \
  references/evidence-and-governance.md \
  references/web-activation.md \
  scripts/validate-activation-design-bundle.sh
do
  test -f "$PLUGIN/skills/meiro-activation-design-studio/$required" || {
    echo "missing activation design resource: $required" >&2
    exit 1
  }
done

find "$PLUGIN/skills" -type f -path '*/scripts/*' -exec sh -n {} \;
find "$ROOT" -type f -name '*.json' -exec jq empty {} \;

sh "$PLUGIN/skills/meiro-instance-blueprint/scripts/validate-instance-blueprint.sh" "$PLUGIN/skills/meiro-instance-blueprint/assets/instance-blueprint.template.json"
sh "$PLUGIN/skills/meiro-event-contract-designer/scripts/validate-event-contract.sh" "$PLUGIN/skills/meiro-event-contract-designer/assets/event-contract.template.json"
sh "$PLUGIN/skills/meiro-qa-validator/scripts/validate-qa-plan.sh" "$PLUGIN/skills/meiro-qa-validator/assets/qa-plan.template.json"
sh "$PLUGIN/skills/meiro-change-bundle-builder/scripts/validate-change-bundle.sh" "$PLUGIN/skills/meiro-change-bundle-builder/assets/change-bundle.template.json"
sh "$PLUGIN/skills/ecommerce-playbook-planner/scripts/validate-playbook.sh"
sh "$PLUGIN/skills/industry-playbook-planner/scripts/validate-industry-playbooks.sh"
sh "$PLUGIN/skills/ecommerce-roi-modeler/scripts/validate-roi-model.sh" "$PLUGIN/skills/ecommerce-roi-modeler/assets/ecommerce-roi-template.xlsx"
sh "$PLUGIN/skills/meiro-activation-design-studio/scripts/validate-activation-design-bundle.sh" "$ROOT/tests/activation-design-bundle"

if grep -R -n -E '\[TODO:|/Users/[^/]+/|BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY|Bearer [A-Za-z0-9._-]{16,}' "$ROOT" --exclude-dir=.git --exclude=validate-toolkit.sh --exclude='*.xlsx'; then
  echo "FAIL: placeholder, local path or secret-like material found" >&2
  exit 1
fi
if find "$PLUGIN/skills" -mindepth 1 -maxdepth 1 -type d -name '*writer*' | grep -q .; then
  echo "FAIL: shared plugin must not contain a general writer" >&2
  exit 1
fi

echo "PASS: Meiro Agent Toolkit is structurally valid and distribution-safe"
