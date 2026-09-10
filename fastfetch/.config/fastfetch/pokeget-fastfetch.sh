#!/usr/bin/env bash
# Show a random pokeget sprite as the logo and put its name on the title line.
set -euo pipefail

if ! command -v pokeget >/dev/null 2>&1; then
  exec fastfetch "$@"
fi

tmpdir="$(mktemp -d -t ff-pokemon.XXXXXX)"
trap 'rm -rf "$tmpdir"' EXIT

# pokeget writes the sprite to stdout and the name to stderr.
if ! pokeget random >"$tmpdir/sprite" 2>"$tmpdir/name"; then
  exec fastfetch "$@"
fi

name="$(tr -d '\r\n' <"$tmpdir/name" | sed $'s/\x1B\\[[0-9;]*[A-Za-z]//g')"

if [[ -z "$name" || ! -s "$tmpdir/sprite" ]]; then
  exec fastfetch "$@"
fi

python3 - "$name" "$HOME/.config/fastfetch/config.jsonc" "$tmpdir" <<'PY'
import json
import sys

name, src, tmpdir = sys.argv[1], sys.argv[2], sys.argv[3]
with open(src) as f:
    cfg = json.load(f)

cfg["logo"] = {
    "type": "file-raw",
    "source": tmpdir + "/sprite",
    "padding": cfg.get("logo", {}).get("padding", {"right": 3}),
}

for module in cfg.get("modules", []):
    if isinstance(module, dict) and module.get("type") == "title":
        module["format"] = (
            "{user-name-colored}{at-symbol-colored}{host-name-colored} (" + name + ")"
        )
        break

with open(tmpdir + "/config.jsonc", "w") as f:
    json.dump(cfg, f)
PY

fastfetch -c "$tmpdir/config.jsonc" "$@"
