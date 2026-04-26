#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OUT_DIR="$ROOT_DIR/out"

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

javac -d "$OUT_DIR" $(find "$ROOT_DIR/src" "$ROOT_DIR/test" -name '*.java')
java -cp "$OUT_DIR" photobooth.core.PhotoStripGeneratorTest
