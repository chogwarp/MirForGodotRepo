#!/bin/bash
set -e

# Install dependencies
apt-get update
apt-get install -y wget unzip git build-essential libx11-dev libxcursor-dev libxinerama-dev libgl1-mesa-dev libglu-dev

# Download Godot 4.3 Headless
wget https://downloads.tuxfamily.org/godotengine/4.3/Godot_v4.3-stable_linux.x86_64.zip -O godot.zip
unzip godot.zip -d /usr/local/bin/
mv /usr/local/bin/Godot_v4.3-stable_linux.x86_64 /usr/local/bin/godot
chmod +x /usr/local/bin/godot
