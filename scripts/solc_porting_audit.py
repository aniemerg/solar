#!/usr/bin/env python3
"""Audit and track Solidity semantic test porting coverage.

This tool discovers Solidity semantic tests from tmp/solidity and compares them
against a tracked CSV manifest under crates/codegen/testdata-solc.
"""

from __future__ import annotations

import argparse
import csv
import re
from collections import Counter
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


ROOT = Path(__file__).resolve().parent.parent
DEFAULT_SOLIDITY_ROOT = ROOT / "tmp/solidity/test/libsolidity/semanticTests"
DEFAULT_MANIFEST = ROOT / "crates/codegen/testdata-solc/porting-manifest.csv"

# Keep this list explicit and conservative; tweak as needed.
DEFAULT_EXCLUDE_PREFIXES = (
    "viaYul/",
    "optimizer/",
    "shanghai/",
    "eof/",
)

MANIFEST_FIELDS = [
    "solidity_test",
    "status",
    "solar_suite",
    "solar_src",
    "solar_test",
    "notes",
]

VALID_STATUSES = {"pending", "ported", "skipped", "blocked"}


@dataclass
class Row:
    solidity_test: str
    status: str = "pending"
    solar_suite: str = ""
    solar_src: str = ""
    solar_test: str = ""
    notes: str = ""

    @classmethod
    def from_dict(cls, d: dict[str, str]) -> "Row":
        return cls(
            solidity_test=d.get("solidity_test", "").strip(),
            status=d.get("status", "pending").strip(),
            solar_suite=d.get("solar_suite", "").strip(),
            solar_src=d.get("solar_src", "").strip(),
            solar_test=d.get("solar_test", "").strip(),
            notes=d.get("notes", "").strip(),
        )

    def as_dict(self) -> dict[str, str]:
        return {
            "solidity_test": self.solidity_test,
            "status": self.status,
            "solar_suite": self.solar_suite,
            "solar_src": self.solar_src,
            "solar_test": self.solar_test,
            "notes": self.notes,
        }


def discover_tests(solidity_root: Path, exclude_prefixes: tuple[str, ...]) -> list[str]:
    if not solidity_root.exists():
        raise FileNotFoundError(f"Solidity semanticTests root not found: {solidity_root}")

    tests: list[str] = []
    for p in sorted(solidity_root.rglob("*.sol")):
        rel = p.relative_to(solidity_root).as_posix()
        if any(rel.startswith(prefix) for prefix in exclude_prefixes):
            continue
        tests.append(rel)
    return tests


def read_manifest(path: Path) -> dict[str, Row]:
    rows: dict[str, Row] = {}
    if not path.exists():
        return rows

    with path.open(newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        if reader.fieldnames is None:
            return rows
        for field in MANIFEST_FIELDS:
            if field not in reader.fieldnames:
                raise ValueError(f"Missing manifest column: {field}")

        for raw in reader:
            row = Row.from_dict(raw)
            if not row.solidity_test:
                continue
            if row.status not in VALID_STATUSES:
                raise ValueError(
                    f"Invalid status '{row.status}' for {row.solidity_test}; "
                    f"valid: {sorted(VALID_STATUSES)}"
                )
            rows[row.solidity_test] = row
    return rows


def write_manifest(path: Path, rows: Iterable[Row]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=MANIFEST_FIELDS)
        writer.writeheader()
        for row in sorted(rows, key=lambda r: r.solidity_test):
            writer.writerow(row.as_dict())


def sync_manifest(
    manifest_path: Path,
    discovered: list[str],
    existing: dict[str, Row],
    prune: bool,
) -> tuple[int, int]:
    discovered_set = set(discovered)

    added = 0
    removed = 0

    for test in discovered:
        if test not in existing:
            existing[test] = Row(solidity_test=test)
            added += 1

    if prune:
        stale = [t for t in existing if t not in discovered_set]
        for t in stale:
            del existing[t]
            removed += 1

    write_manifest(manifest_path, existing.values())
    return added, removed


def parse_ledger_markdown(ledger_path: Path) -> dict[str, Row]:
    """Parse old markdown ledger rows (best-effort) into manifest-style rows."""
    updates: dict[str, Row] = {}
    if not ledger_path.exists():
        return updates

    for line in ledger_path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if not line.startswith("| test/"):
            continue
        cols = [c.strip() for c in line.strip("|").split("|")]
        if len(cols) < 6:
            continue

        solidity_test = cols[0]
        prefix = "test/libsolidity/semanticTests/"
        if solidity_test.startswith(prefix):
            solidity_test = solidity_test[len(prefix):]
        status = cols[2]
        solar_target = cols[4]
        notes = cols[5]

        if status != "ported":
            continue

        rel = ""
        if solar_target.startswith("crates/codegen/testdata-solc/"):
            rel = solar_target.removeprefix("crates/codegen/testdata-solc/")
        elif solar_target.startswith("crates/codegen/testdata-ported/"):
            rel = solar_target.removeprefix("crates/codegen/testdata-ported/")
        elif solar_target.startswith("crates/codegen/testdata/"):
            # tolerate old placement in legacy tree
            rel = solar_target.removeprefix("crates/codegen/testdata/")

        suite = rel.split("/", 1)[0] if rel else ""
        src_name = ""
        if rel:
            stem = rel.rsplit("/", 1)[-1]
            src_name = f"src/{stem}.sol"

        updates[solidity_test] = Row(
            solidity_test=solidity_test,
            status="ported",
            solar_suite=suite,
            solar_src=src_name,
            solar_test="",
            notes=notes,
        )

    return updates


def import_ledger(manifest_path: Path, ledger_path: Path) -> tuple[int, int]:
    rows = read_manifest(manifest_path)
    updates = parse_ledger_markdown(ledger_path)

    applied = 0
    created = 0
    for test, update in updates.items():
        if test in rows:
            row = rows[test]
        else:
            row = Row(solidity_test=test)
            created += 1
        row.status = "ported"
        if update.solar_suite:
            row.solar_suite = update.solar_suite
        if update.solar_src:
            row.solar_src = update.solar_src
        if update.solar_test:
            row.solar_test = update.solar_test
        if update.notes:
            row.notes = update.notes
        rows[test] = row
        applied += 1

    write_manifest(manifest_path, rows.values())
    return applied, created


def run_check(manifest_path: Path, discovered: list[str], require_no_pending: bool) -> int:
    rows = read_manifest(manifest_path)
    discovered_set = set(discovered)

    missing = [t for t in discovered if t not in rows]
    stale = [t for t in rows if t not in discovered_set]

    by_status = Counter(rows[t].status for t in discovered if t in rows)
    pending = [t for t in discovered if rows.get(t) and rows[t].status == "pending"]

    print(f"Discovered relevant Solidity tests: {len(discovered)}")
    print(f"Manifest entries: {len(rows)}")
    print("Status counts (for discovered tests):")
    for s in sorted(VALID_STATUSES):
        print(f"  {s:7} {by_status.get(s, 0)}")

    if missing:
        print("\nMissing manifest rows:")
        for t in missing[:200]:
            print(f"  {t}")
        if len(missing) > 200:
            print(f"  ... and {len(missing) - 200} more")

    if stale:
        print("\nStale manifest rows (not discovered anymore):")
        for t in stale[:200]:
            print(f"  {t}")
        if len(stale) > 200:
            print(f"  ... and {len(stale) - 200} more")

    if require_no_pending and pending:
        print("\nPending rows still exist (require-no-pending enabled):")
        for t in pending[:200]:
            print(f"  {t}")
        if len(pending) > 200:
            print(f"  ... and {len(pending) - 200} more")

    if missing or stale or (require_no_pending and pending):
        return 1
    return 0


def run_report(manifest_path: Path, discovered: list[str], show_pending: int) -> int:
    rows = read_manifest(manifest_path)
    discovered_set = set(discovered)

    by_status = Counter(rows[t].status for t in discovered if t in rows)
    print(f"Discovered relevant Solidity tests: {len(discovered)}")
    print(f"Covered in manifest: {sum(1 for t in discovered if t in rows)}")
    print("Status counts:")
    for s in sorted(VALID_STATUSES):
        print(f"  {s:7} {by_status.get(s, 0)}")

    if show_pending > 0:
        print(f"\nFirst {show_pending} pending tests:")
        shown = 0
        for t in discovered:
            row = rows.get(t)
            if row and row.status == "pending":
                print(f"  {t}")
                shown += 1
                if shown >= show_pending:
                    break

    stale = [t for t in rows if t not in discovered_set]
    if stale:
        print(f"\nStale rows in manifest: {len(stale)}")
    return 0


def make_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--solidity-root",
        default=str(DEFAULT_SOLIDITY_ROOT),
        help="Path to tmp/solidity semanticTests root",
    )
    parser.add_argument(
        "--manifest",
        default=str(DEFAULT_MANIFEST),
        help="Path to CSV manifest file",
    )
    parser.add_argument(
        "--exclude-prefix",
        action="append",
        default=list(DEFAULT_EXCLUDE_PREFIXES),
        help="Exclude discovered tests by relative prefix (repeatable)",
    )

    sub = parser.add_subparsers(dest="cmd", required=True)

    p_sync = sub.add_parser("sync", help="Sync manifest rows with discovered tests")
    p_sync.add_argument("--prune", action="store_true", help="Remove stale rows from manifest")

    p_import = sub.add_parser("import-ledger", help="Import ported rows from old markdown ledger")
    p_import.add_argument(
        "--ledger",
        default=str(ROOT / "tmp/local-notes/PORTING_LEDGER.md"),
        help="Path to markdown ledger",
    )

    p_check = sub.add_parser("check", help="Check manifest coverage consistency")
    p_check.add_argument(
        "--require-no-pending",
        action="store_true",
        help="Fail if any discovered test has status=pending",
    )

    p_report = sub.add_parser("report", help="Print coverage summary")
    p_report.add_argument(
        "--show-pending",
        type=int,
        default=50,
        help="Show the first N pending tests",
    )

    return parser


def main() -> int:
    parser = make_parser()
    args = parser.parse_args()

    solidity_root = Path(args.solidity_root)
    manifest = Path(args.manifest)
    exclude_prefixes = tuple(args.exclude_prefix)

    discovered = discover_tests(solidity_root, exclude_prefixes)

    if args.cmd == "sync":
        rows = read_manifest(manifest)
        added, removed = sync_manifest(manifest, discovered, rows, prune=args.prune)
        print(f"Synced manifest: added={added}, removed={removed}, total={len(read_manifest(manifest))}")
        return 0

    if args.cmd == "import-ledger":
        ledger = Path(args.ledger)
        applied, created = import_ledger(manifest, ledger)
        print(f"Imported ledger rows: applied={applied}, created={created}")
        return 0

    if args.cmd == "check":
        return run_check(manifest, discovered, require_no_pending=args.require_no_pending)

    if args.cmd == "report":
        return run_report(manifest, discovered, show_pending=args.show_pending)

    parser.error("unreachable")
    return 2


if __name__ == "__main__":
    raise SystemExit(main())
