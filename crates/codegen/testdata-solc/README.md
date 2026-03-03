# Solc-Ported Codegen Tests

This directory contains Foundry suites ported from Solidity's semantic test corpus.

## Goal

Maintain a 1:1 correspondence between portable Solidity semantic tests and Solar Foundry tests:
- For each relevant Solidity semantic test, add an equivalent Solar test case.
- Keep test names stable and globally unique where required by downstream scoring.
- Preserve semantics; solc behavior is the baseline reference.

## Structure

Each subdirectory is an independent Foundry project:
- `src/`: Solidity contracts adapted from Solidity semantic tests.
- `test/`: Foundry assertions mirroring expected behavior.
- `foundry.toml`: project-local Foundry config.

Shared dependencies are placed under `_shared/lib`.

## Porting Style

When adding or updating tests here:
- Prefer concise, deterministic tests.
- Avoid external state and flaky behavior.
- Keep assertions explicit and easy to compare against solc behavior.
- Use `forge-std` only when it materially improves clarity or coverage.

## Workflow Notes

- These suites are intended for codegen parity validation against solc.
- If adding/removing tests used by worker scoring, regenerate baseline artifacts and repin harness references as needed.

## Coverage Tracking

A tracked manifest is used to ensure every identified Solidity semantic test is accounted for:

- Manifest: `crates/codegen/testdata-solc/porting-manifest.csv`
- Auditor: `scripts/solc_porting_audit.py`

Default discovery root:
- `tmp/solidity/test/libsolidity/semanticTests`

Default excludes (can be overridden with repeated `--exclude-prefix` flags):
- `viaYul/`
- `optimizer/`
- `shanghai/`
- `eof/`

Typical workflow:

```bash
# Sync manifest rows with discovered Solidity tests (add missing rows)
scripts/solc_porting_audit.py sync --prune

# Optional one-time import from old markdown ledger
scripts/solc_porting_audit.py import-ledger

# Check for manifest/discovery consistency
scripts/solc_porting_audit.py check

# Print status summary and a sample of pending tests
scripts/solc_porting_audit.py report --show-pending 50
```

When coverage is expected to be complete, enforce it with:

```bash
scripts/solc_porting_audit.py check --require-no-pending
```
