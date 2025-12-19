#!/usr/bin/env bash
set -euo pipefail

# Move to repo root (one level up from scripts/)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${ROOT_DIR}"

# Ensure is available
if ! command -v >/dev/null 2>&1; then
  echo "Error: not found in PATH."
  echo "Install FVM: dart pub global activate fvm"
  echo "Then ensure your PATH includes ~/.pub-cache/bin (or the equivalent on your system)."
  exit 1
fi

echo "Using Flutter via FVM:"
flutter --version

echo "Cleaning Flutter build artifacts..."
flutter clean

echo "Resolving Dart/Flutter packages..."
flutter pub get

echo "Pre-caching iOS engine artifacts..."
flutter precache --ios

echo "Done. You can now run (via FVM), e.g.:"
echo "flutter run -d \"iPhone 16 Pro Max\""


