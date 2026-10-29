#!/usr/bin/env bash
# Builds dist/fictura-openai-plugin.zip for upload at platform.openai.com/plugins.
# The ZIP holds plugin.json and mcp.json at its root, plus assets/.
# Docs: https://developers.openai.com/plugins/deploy/submission
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
src="$root/openai"
out="$root/dist/fictura-openai-plugin.zip"

for f in plugin.json mcp.json assets/icon.png assets/logo.png; do
  [ -f "$src/$f" ] || { echo "missing openai/$f" >&2; exit 1; }
done

mkdir -p "$root/dist"
rm -f "$out"
(cd "$src" && zip -q -r -X "$out" plugin.json mcp.json assets -x '*.DS_Store')
echo "Built $out"
unzip -l "$out"
