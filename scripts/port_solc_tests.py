#!/usr/bin/env python3
"""
Port solc syntax tests to Solar UI test format with proper inline annotations.
"""

import subprocess
import json
import os
import sys
from collections import defaultdict

SOLAR = "target/debug/solar"
SRC_BASE = "tmp/solidity/test/libsolidity/syntaxTests"
DST_BASE = "tests/ui/solc"

total_ported = 0
total_skipped = 0


def run_solar(sol_file, extra_flags=None):
    """Run solar and return (exit_code, list of diagnostics) with column-aware dedup."""
    cmd = [SOLAR, "-j1", "--error-format=rustc-json", "-Zui-testing"]
    if extra_flags:
        cmd.extend(extra_flags)
    cmd.append(sol_file)

    result = subprocess.run(cmd, capture_output=True, text=True)
    output = result.stdout + result.stderr

    diags = []
    seen = set()
    for line_text in output.split('\n'):
        line_text = line_text.strip()
        if not line_text.startswith('{'):
            continue
        try:
            d = json.loads(line_text)
            if d.get('$message_type') != 'diagnostic':
                continue
            level = d.get('level', '')
            if level not in ('error', 'warning'):
                continue
            msg = d['message']
            if msg.startswith('aborting due to'):
                continue

            spans = d.get('spans', [])
            if not spans:
                continue

            primary = next((s for s in spans if s.get('is_primary', False)), spans[0])
            key = (primary['line_start'], primary['column_start'], level, msg)
            if key not in seen:
                seen.add(key)
                diags.append({
                    'level': 'ERROR' if level == 'error' else 'WARN',
                    'message': msg,
                    'line': primary['line_start'],
                    'col': primary['column_start'],
                })
        except (json.JSONDecodeError, KeyError):
            pass

    return result.returncode, diags


def message_is_safe_for_annotation(msg):
    """Check if a message is safe to use inline in //~ annotation.

    Some error messages contain '//' which the test framework may
    misinterpret as a test directive. We skip such messages.
    """
    return '//' not in msg


def line_has_existing_comment(line):
    """Check if a line already has a // comment (which would interfere with inline annotation)."""
    # Simple heuristic: check for '//' outside of strings
    in_string = False
    string_char = None
    i = 0
    while i < len(line):
        c = line[i]
        if in_string:
            if c == '\\':
                i += 2
                continue
            if c == string_char:
                in_string = False
        else:
            if c in ('"', "'"):
                in_string = True
                string_char = c
            elif c == '/' and i + 1 < len(line) and line[i+1] == '/':
                return True
        i += 1
    return False


def add_annotations_to_code(code, diags):
    """Add //~ ERROR:/WARN: annotations to the code.

    For errors on line N:
    - If the line has no existing comment: add inline //~ ERROR: on line N
      Then subsequent errors go on new lines with increasing carets.
    - If the line already has a // comment: put all annotations on the next
      line with //~^ (1 caret), //~^^ (2 carets), etc.

    Returns (annotated_code, success) where success=False if any error
    message contains '//' which would confuse the parser.
    """
    lines = code.split('\n')

    # Check that all error messages are safe for inline annotation
    for d in diags:
        if not message_is_safe_for_annotation(d['message']):
            return None, False

    # Group diagnostics by (source line number), preserving order
    line_diags = defaultdict(list)
    for d in diags:
        line_diags[d['line']].append(d)

    result_lines = []
    annotation_offset = 0  # extra lines added so far

    for i, line in enumerate(lines, 1):
        if i in line_diags:
            errors = line_diags[i]
            has_comment = line_has_existing_comment(line)

            if not has_comment:
                # First error: inline on same line
                result_lines.append(line + f" //~ {errors[0]['level']}: {errors[0]['message']}")
                # Subsequent errors: on new lines with increasing carets
                for j, err in enumerate(errors[1:], 1):
                    carets = '^' * j
                    result_lines.append(f"//~{carets} {err['level']}: {err['message']}")
                    annotation_offset += 1
            else:
                # Line already has a comment - put ALL annotations on subsequent lines
                result_lines.append(line)
                for j, err in enumerate(errors):
                    # First annotation is on the next line (j=0, annotation_offset=0, so line = i+1)
                    # That annotation needs carets = (j+1) because:
                    # annotation line = (current line in result) + j + 1
                    # error line = i
                    # carets = annotation_line - error_line = (i + annotation_offset + j + 1) - i = annotation_offset + j + 1
                    # But annotation_offset grows as we add lines, and we need relative count
                    # Simpler: first annotation is 1 line below code (1 caret), second is 2 lines, etc.
                    carets = '^' * (j + 1)
                    result_lines.append(f"//~{carets} {err['level']}: {err['message']}")
                    annotation_offset += 1
        else:
            result_lines.append(line)

    return '\n'.join(result_lines), True


def strip_solc_test(content):
    """Strip the // ---- and // ==== sections from a solc test."""
    lines = content.split('\n')
    code_lines = []
    in_config = False
    for line in lines:
        if line.startswith("// ===="):
            in_config = True
        elif line.startswith("// ----"):
            break
        elif in_config and not line.startswith("//"):
            in_config = False
            code_lines.append(line)
        elif not in_config:
            code_lines.append(line)
    return '\n'.join(code_lines).rstrip()


def get_expected_errors(content):
    """Extract expected error/warning lines from solc test."""
    after = content.split("// ----", 1)
    errors = []
    if len(after) > 1:
        for line in after[1].split('\n'):
            line = line.strip()
            if line.startswith("//") and ("Error" in line or "Warning" in line):
                errors.append(line)
    return errors


def process_dir(src_dir, dst_dir, extra_flags=None):
    """Process a directory of solc tests recursively."""
    global total_ported, total_skipped

    if not os.path.exists(src_dir):
        return

    os.makedirs(dst_dir, exist_ok=True)
    ported = []
    skipped = []

    for fname in sorted(os.listdir(src_dir)):
        full_path = os.path.join(src_dir, fname)
        if os.path.isdir(full_path):
            sub_dst = os.path.join(dst_dir, fname)
            process_dir(full_path, sub_dst, extra_flags=extra_flags)
            continue
        if not fname.endswith(".sol"):
            continue

        with open(full_path) as f:
            content = f.read()

        # Skip multi-source tests
        if "==== Source:" in content:
            skipped.append((fname, "multi-source"))
            continue

        code = strip_solc_test(content)
        expected_errors = get_expected_errors(content)

        with open("/tmp/test_solar.sol", "w") as f:
            f.write(code)

        flags = list(extra_flags) if extra_flags else []
        rc, diags = run_solar("/tmp/test_solar.sol", flags)

        # Skip panics (ICE)
        if rc == 101:
            skipped.append((fname, "Solar panics (ICE)"))
            total_skipped += 1
            continue

        solar_has_error = rc != 0
        expects_error = len(expected_errors) > 0

        pascal = ''.join(w.capitalize() for w in fname[:-4].split('_'))
        dst_path = os.path.join(dst_dir, f"{pascal}.sol")

        header = ""
        if flags:
            header = "//@ compile-flags: " + " ".join(flags) + "\n"

        # Skip tests where source code itself contains '// @' which the test
        # framework would interpret as a test directive
        if '// @' in code:
            skipped.append((fname, "source contains '// @' - would confuse test framework"))
            total_skipped += 1
            continue

        if expects_error and solar_has_error:
            # Port as error test with annotations
            annotated, ok = add_annotations_to_code(code, diags)
            if not ok:
                # Error message contains '//' - skip this test
                skipped.append((fname, "error message contains '//' - skipped"))
                total_skipped += 1
                continue
            with open(dst_path, "w") as f:
                f.write(header + annotated + "\n")
            ported.append((fname, pascal, "error"))
            total_ported += 1
        elif not expects_error and not solar_has_error:
            # Port as success regression test - no annotations
            # But still skip if source contains '// @'
            with open(dst_path, "w") as f:
                f.write(header + code + "\n")
            ported.append((fname, pascal, "success"))
            total_ported += 1
        elif expects_error and not solar_has_error:
            skipped.append((fname, "Solar doesn't catch"))
            total_skipped += 1
        else:
            skipped.append((fname, "Solar unexpected errors"))
            total_skipped += 1

    return ported, skipped


if __name__ == "__main__":
    # Process all categories
    categories = [
        ("pragma", "pragma", None),
        ("license", "license", None),
        ("underscore", "underscore", None),
        ("inheritance", "inheritance", ["-Ztypeck"]),
        ("functionTypes", "functionTypes", ["-Ztypeck"]),
        ("functionCalls", "functionCalls", ["-Ztypeck"]),
        ("inlineAssembly", "inlineAssembly", ["-Ztypeck"]),
        ("types", "types", ["-Ztypeck"]),
    ]

    for cat_name, cat_dir, flags in categories:
        print(f"Processing {cat_name}...", file=sys.stderr)
        src = os.path.join(SRC_BASE, cat_dir)
        dst = os.path.join(DST_BASE, cat_dir)
        process_dir(src, dst, extra_flags=flags)
        print(f"  Done", file=sys.stderr)

    print(f"\nTotal: Ported {total_ported}, Skipped {total_skipped}", file=sys.stderr)
