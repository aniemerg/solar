# Harness Plan (Codegen-MIR Working Branch)

## Goals

- Keep existing Solar codegen tests as the gold standard for style and structure.
- Add a parallel, curated suite of ported Solidity semantic tests for broader coverage.
- Ensure determinism and stable naming for leaderboard scoring.
- Focus on latest Solidity language + latest EVM version supported by the harness.

## Current Gold-Standard Tests

- Located under `crates/codegen/testdata/` and run by `crates/codegen/tests/foundry_harness/mod.rs`.
- Each test project is a Foundry project (`src/` + `test/`) with concise, explicit assertions.
- These will remain authoritative for style, naming, and organization.

## Proposed New Harness Layout

- `harness/` (new) — Future home for a standalone runner if we split from `crates/codegen/tests`.
- `testdata/` (new) — Staging area for ported semantic tests if we decide to keep them separate.

Note: In the short term, ported tests can live under `crates/codegen/testdata/semantic/` to reuse the existing
runner and keep things simple. The `harness/` + `testdata/` root-level layout is reserved for the eventual
leaderboard harness if we choose to decouple from the codegen crate.

## Porting Strategy (Using Existing Tests as Template)

1. **Mirror current Foundry project structure**
   - For each Solidity semantic category (e.g., arithmetics, storage, events), create a Foundry project folder.
   - Add `src/` files that closely match the Solidity test code.
   - Add `test/` files that translate `// ----` expectations into explicit assertions.

2. **Naming and grouping**
   - Preserve Solidity test names and file stems as much as possible.
   - Keep test function names stable and unique (signatures are stripped in scoring).

3. **Compatibility checks**
   - Avoid EVM-version specific tests unless the harness explicitly pins an EVM version.
   - Include tests that are *not yet supported* by Solar codegen to drive contest improvements; flag these so they can
     be tracked and phased in as implementations land.

4. **Iterative expansion**
   - Phase 1: core semantics (arithmetics, storage, simple calls).
   - Phase 2: external interactions (events, libraries, inheritance).
   - Phase 3: ABI / revert data / multi-source.

## Where Ported Tests Will Land (Initial)

- `crates/codegen/testdata/semantic/` (new Foundry project root)
  - `src/` holds Solidity contracts copied from semantic tests.
  - `test/` holds Foundry tests mirroring `// ----` expectations.

This keeps the existing harness and scoring scripts compatible without immediate refactors.

## Scoring / Worker Constraints Alignment

- Tests are run single-threaded and parsed as forge JSON.
- Test names must be stable and unique; avoid renames once added.
- Adding/removing tests requires regenerating the solc baseline and re-pinning the harness.
