# Solar Scoring ASCII Art & Symbolism Mining

This document mines repository cues and test-harness context to propose ASCII art ideas for scoring displays. It separates **repo-derived signals** from **creative extrapolations** so others can extend or remix safely.

## Repo-Derived Signals (Names, Phrases, Structure)

- **Project identity**: “Solar” — blazingly fast, modular Solidity compiler written in Rust. `README.md`
- **Positioning**: fast, low memory, modular, expressive diagnostics, contributor-friendly. `README.md`
- **Brand assets**: `assets/cover.png`, `assets/logo.png`, `assets/favicon.ico`, `assets/benchmark.png`
- **Pipeline**: Lexing → Parsing → Semantic Analysis → (IR → Codegen planned). `AGENTS.md`
- **Harness language**: Foundry-based “codegen harness,” “baseline,” “leaderboard worker,” “deterministic,” “single-threaded.” `AGENTS.md`, `CODEGEN_TEST_PORTING_REVIEW.md`, `HARNESS_PLAN.md`
- **Porting framing**: Solidity “semantic tests” are the target; curated for runtime semantics. `CODEGEN_TEST_PORTING_REVIEW.md`
- **Test ecosystem**: Many Foundry projects in `crates/codegen/testdata/*` spanning core semantics and stress suites. `CODEGEN_TEST_PORTING_REVIEW.md`, `crates/codegen/testdata/`
- **Rust + compiler internals**: AST, HIR, diagnostics, etc. (`crates/ast`, `crates/interface`, `tests/ui`).

## What Solar Is / Does (Summary)

- **Purpose**: A high-performance Solidity compiler (CLI + Rust library) designed to be fast, modular, and easy to hack on. `README.md`
- **Scope**: Aims to keep up with the latest Solidity 0.8.* syntax and semantics; codegen is still under active development. `README.md`
- **Compiler stages**: Lexing → Parsing → Semantic analysis (symbol resolution, type checking) → planned IR/codegen. `AGENTS.md`
- **Diagnostics**: Explicit emphasis on expressive diagnostics and developer UX. `README.md`

## Harness & Evaluation Context (Scoring-Relevant)

- **Harness**: Foundry-based test runner (`crates/codegen/tests/foundry.rs` + `crates/codegen/tests/foundry_harness/mod.rs`). `CODEGEN_TEST_PORTING_REVIEW.md`
- **Baseline**: Tests run with `FOUNDRY_SOLC=solar` and with solc; pass/fail + gas comparisons are used. `CODEGEN_TEST_PORTING_REVIEW.md`
- **Determinism**: Worker runs single-threaded; tests must be stable and deterministic. `AGENTS.md`
- **Test location**: Worker currently copies from `crates/codegen/testdata/`. `AGENTS.md`
- **Semantic test porting**: Solidity `semanticTests` are being ported, with stable naming and curated coverage. `CODEGEN_TEST_PORTING_REVIEW.md`, `PORTING_LEDGER.md`

### Current Testdata Categories (Foundry Projects)

From `crates/codegen/testdata/`:

- Core semantics: `arithmetic`, `arrays`, `control-flow`, `loops`, `structs`, `enums`, `strings`
- Calls & ABI: `calls`, `low-level-calls`, `abi-encode-decode`, `abi-encoding`, `multi-return`
- Storage: `storage`, `stress-arrays`, `stress-mappings`
- Runtime behavior: `reverts`, `revert-strings`, `errors`, `events`, `receive`, `fallback`, `receive-fallback`
- Inheritance & modifiers: `inheritance`, `modifiers`, `interfaces`, `libraries`
- Protocol/minimal suites: `erc20-minimal`, `erc721-minimal`, `vault-minimal`, `unifap-v2`, `unifap-v2-create`
- Stress/regression: `stress-*`, `stack-deep`, `edge-cases`, `equivalence`

(See directory list in `crates/codegen/testdata/`.)

### Ported Solidity Semantic Tests (Examples)

From `PORTING_LEDGER.md` (not exhaustive):

- **Arithmetic**: `checked_add_v2`, `unchecked_div_by_zero`, exponentiation variants
- **Storage**: packed struct layout tests, getters, mappings, accessors
- **Arrays**: dynamic push/pop, bounds checks, storage layout, indexing variants
- **Calls**: external calls, multiple returns, named args, selectors
- **Constructors**: init order, base constructor args, array args
- **Reverts**: basic revert + assert/require
- **ABI**: `abi_decode_simple`, `abi_encode_with_signature`, `abi_encode_call`
- **Events**: indexed and anonymous events, dynamic data
- **Inheritance/Modifiers**: init order, `super`, modifier order/loops
- **Receive/Fallback**: calldata behavior and routing

These are strong thematic anchors for scoring visuals (arrays, storage, events, calls, revert paths, etc.).

## Symbolism & Metaphor Inventory

### Direct, Repo-Native Language

- **Solar / Sun**: light, heat, speed, rays, sunrise → compiler “illumination,” fast builds
- **Forge / Foundry / Anvil**: test harness name and ecosystem; evokes metalworking, sparks, precision
- **Harness / Baseline / Worker**: controlled testing rig; “flight harness,” “lab bench” cues
- **Pipeline / Stages**: lex → parse → sema → codegen; can be depicted as conveyor belts or funneling rays
- **Diagnostics**: “searchlight,” “spotlight,” “X‑ray” metaphors for errors and warnings

### Adjacent Compiler/EVM Metaphors

- **AST / Parse Trees**: literal trees; “solar tree” (tree + sun) as parsing/structure
- **EVM Stack / Memory / Storage**: stacked blocks, shelves, vaults, grids
- **Bytecode**: binary streams, “solar wind,” beam of bytes
- **Gas**: fuel gauge, pressure meter, throttle, rocket
- **ABI**: barcode, DNA helix, interface ports

### Ecosystem Cues

- **Solidity**: diamond/hex motif; block chain links
- **Rust**: crab with goggles, anvil or sun motif (if playful)
- **Paradigm** (company): “paradigm shift” imagery (tilted axis, rotating frame) — creative extrapolation

## ASCII Art Concepts for Scoring Displays

Each item is an **idea seed**; designers can stylize to match scoring states (pass/fail, speed, gas, etc.).

1. **Sunrise Compile**: sun rising over a horizon labeled `lex → parse → sema → codegen`.
2. **Solar Flare Speed**: blazing sun with streaks, caption “blazingly fast.”
3. **Forge & Anvil**: anvil + hammer + sparks forming `0x…` bytecode.
4. **Foundry Furnace**: molten “bytecode stream” pouring into a mold.
5. **Harness Rig**: a simple harness strap + checklist (determinism, baseline, single-threaded).
6. **Pipeline Conveyor**: tokens go in, AST/tree in the middle, bytecode out.
7. **EVM Stack Blocks**: stacked bricks labeled `stack / memory / storage`.
8. **Gas Gauge**: dial or bar meter; “gas <= solc” needle.
9. **ABI Barcode**: thin vertical bars, “ABI” stamped on it.
10. **Revert Lightning**: bolt or “X” over a function call path.
11. **Event Sparkles**: small bursts (logs) emanating from a contract block.
12. **Sun + Crate System**: core sun with orbiting “crates” (modules).
13. **AST Tree + Sun**: tree with circular crown sun; leaves are tokens.
14. **Bytecode Beam**: diagonal light beam with hex digits.
15. **Shielded Vault**: storage layout tests as a vault door.
16. **Chain Links**: blockchain chain with a sun emblem as a link.
17. **Compiler Lighthouse**: sweeping beam labeled “diagnostics.”
18. **Orbiting Planets**: each planet = test category; stable orbits = determinism.
19. **Solar Eclipse**: “baseline vs solar” overlap; eclipse shows comparison.
20. **Stack-Deep Tower**: tall block tower (stack depth) with warning stripe.
21. **Receiver Dish**: receive/fallback as a radio dish catching calldata.
22. **Modifer Loops**: looped arrows around a function box.
23. **Inheritance Ladder**: stacked contracts with “super” arrow.
24. **Unifap/Protocol Gate**: stylized gate for “protocol/minimal suites.”
25. **Rust Crab in Orbit**: crab holding a tiny sun or hammer.
26. **Binary Constellation**: stars arranged like 0/1 constellation.
27. **Diagnostics X‑Ray**: contract outline with highlighted error location.
28. **Benchmark Lightning**: speedometer + lightning bolt.
29. **Funnel of Tokens**: tokens poured into a funnel, bytecode out.
30. **Anvil + Sun Crest**: anvil stamped with a sun logo.

## Suggested Scoring States (Visual Language)

- **Pass**: bright sun / clear rays / stable orbit
- **Fail**: eclipse / flare outburst / cracked anvil
- **Speedup**: comet tail / streaking rays / lightning
- **Gas regress**: dropping gauge or dimming sun
- **Determinism OK**: perfectly circular orbits, straight beams

## Notes for Future Miners

- Favor signals that appear in repo docs and harness structure (solar, forge, foundry, harness, baseline, pipeline).
- Keep ASCII art simple; the scoreboard context is text-dense.
- Use per-category art to highlight the test suite’s breadth (storage, arrays, calls, events, reverts, etc.).

