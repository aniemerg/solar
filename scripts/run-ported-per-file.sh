#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PORTED_ROOT="$ROOT_DIR/crates/codegen/testdata-ported"
OUTDIR="${OUTDIR:-/tmp/ported-per-file}"

if [[ -n "${FOUNDRY_SOLC:-}" ]]; then
  SOLC_BIN="$FOUNDRY_SOLC"
elif [[ -x "/opt/homebrew/bin/solc" ]]; then
  SOLC_BIN="/opt/homebrew/bin/solc"
else
  SOLC_BIN="solc"
fi

mkdir -p "$OUTDIR"

failures=0
while IFS= read -r testfile; do
  suite_dir="${testfile%/test/*}"
  rel_path="${testfile#"$suite_dir/"}"
  suite_name="$(basename "$suite_dir")"

  echo "=== $suite_name :: $rel_path ==="
  if (cd "$suite_dir" && FOUNDRY_SOLC="$SOLC_BIN" forge test --match-path "$rel_path" | tee "$OUTDIR/${suite_name}__$(basename "$rel_path").txt"); then
    echo "PASS $suite_name :: $rel_path"
  else
    echo "FAIL $suite_name :: $rel_path"
    failures=$((failures+1))
  fi
  echo

done < <(find "$PORTED_ROOT" -path "*/test/*.t.sol" -type f | sort)

if [[ $failures -ne 0 ]]; then
  echo "Completed with $failures failing file(s). Output saved in $OUTDIR"
  exit 1
fi

echo "All ported test files passed. Output saved in $OUTDIR"
