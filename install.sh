#!/usr/bin/env bash
set -e

INSTALL_DIR="$HOME/.local/share/hwpdf"
BIN_DIR="$HOME/.local/bin"

mkdir -p "$INSTALL_DIR"
mkdir -p "$BIN_DIR"

cp style.css "$INSTALL_DIR/"
cp hwpdf.sh "$BIN_DIR/hwpdf"

chmod +x "$BIN_DIR/hwpdf"

echo "Installed hwpdf"

if ! grep -q '.local/bin' ~/.bashrc; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
  echo
  echo "Run:"
  echo "source ~/.bashrc"
fi

