#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PORTING_LEDGER="$ROOT_DIR/PORTING_LEDGER.md"
OUTDIR="${OUTDIR:-/tmp/solc-ported}"

if [[ -n "${FOUNDRY_SOLC:-}" ]]; then
  SOLC_BIN="$FOUNDRY_SOLC"
elif [[ -x "/opt/homebrew/bin/solc" ]]; then
  SOLC_BIN="/opt/homebrew/bin/solc"
else
  SOLC_BIN="solc"
fi

mkdir -p "$OUTDIR"

python3 - <<'PY' > "$OUTDIR/ported_roots.txt"
from pathlib import Path
roots=set()
for line in Path("PORTING_LEDGER.md").read_text().splitlines():
    if line.startswith("| test/") and "| ported |" in line:
        cols=[c.strip() for c in line.strip("|").split("|")]
        if len(cols) >= 5:
            path = cols[4]
            if path.startswith("crates/codegen/testdata/"):
                parts = Path(path).parts
                roots.add(Path(*parts[:4]))
for r in sorted(roots):
    print(r)
PY

failures=0
while read -r d; do
  if [[ ! -f "$ROOT_DIR/$d/foundry.toml" ]]; then
    echo "SKIP (no foundry.toml): $d"
    continue
  fi
  echo "=== $d ==="
  name="$(basename "$d")"
  # Human-readable output, also saved
  if (cd "$ROOT_DIR/$d" && FOUNDRY_SOLC="$SOLC_BIN" forge test | tee "$OUTDIR/solc-$name.txt"); then
    echo "PASS $d"
  else
    echo "FAIL $d"
    failures=$((failures+1))
  fi
  echo

done < "$OUTDIR/ported_roots.txt"

if [[ $failures -ne 0 ]]; then
  echo "Completed with $failures failing suite(s). Output saved in $OUTDIR"
  exit 1
fi

echo "All ported suites passed on solc. Output saved in $OUTDIR"
