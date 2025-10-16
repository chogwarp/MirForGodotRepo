#!/usr/bin/env bash
set -e

apt-get update
# libs dasar untuk headless build Godot & electron tools
apt-get install -y wget unzip curl ca-certificates git build-essential \
  libx11-dev libxcursor-dev libxinerama-dev libgl1-mesa-dev libglu1-mesa \
  xvfb

# === Install Godot 4.3 headless + export templates ===
GODOT_VER="4.3"
GODOT_NAME="Godot_v${GODOT_VER}-stable_linux.x86_64"
GODOT_URL="https://downloads.tuxfamily.org/godotengine/${GODOT_VER}/${GODOT_NAME}.zip"
TPL_URL="https://downloads.tuxfamily.org/godotengine/${GODOT_VER}/${GODOT_NAME}.export_templates.tpz"

# Binary
wget -q "${GODOT_URL}" -O /tmp/godot.zip
unzip -q /tmp/godot.zip -d /usr/local/bin/
mv "/usr/local/bin/${GODOT_NAME}" /usr/local/bin/godot
chmod +x /usr/local/bin/godot

# Templates
mkdir -p /home/vscode/.local/share/godot/export_templates/${GODOT_VER}.stable
wget -q "${TPL_URL}" -O /tmp/templates.tpz
# .tpz adalah zip
unzip -q /tmp/templates.tpz -d /tmp/tpl
cp -r /tmp/tpl/* /home/vscode/.local/share/godot/export_templates/${GODOT_VER}.stable
chown -R vscode:vscode /home/vscode/.local

# Node deps global opsional (jika butuh electron-builder, pnpm, dll)
npm i -g pnpm

echo "✅ Godot ${GODOT_VER} headless & export templates terpasang."
