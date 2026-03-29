#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 2 ]; then
  echo "Usage: $0 <version> <sha256>"
  echo "Example: $0 0.2.0 abc123..."
  exit 1
fi

VERSION="$1"
SHA256="$2"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sed -e "s/{{version}}/${VERSION}/g" \
    -e "s/{{sha256}}/${SHA256}/g" \
    "${SCRIPT_DIR}/memlayer.rb.tmpl" > "${SCRIPT_DIR}/memlayer.rb"

cd "${SCRIPT_DIR}"
git add memlayer.rb
git commit -m "Update memlayer to ${VERSION}"
git push
