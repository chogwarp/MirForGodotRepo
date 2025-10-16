#!/usr/bin/env bash
set -ex

# === Update & install base tools ===
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y curl wget git vim openssh-server net-tools \
    build-essential scons pkg-config \
    libx11-dev libxcursor-dev libxinerama-dev libgl1-mesa-dev libglu1-mesa-dev \
    libasound2-dev libpulse-dev libudev-dev libxi-dev libxrandr-dev libwayland-dev \
    software-properties-common unzip

# === Update GCC ke versi 9 ===
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get update
sudo apt-get install -y gcc-9 g++-9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-9

# === Update scons (pakai pip) ===
sudo apt remove -y scons
sudo apt install -y python3-pip
pip install --upgrade pip
pip install scons

# === Set environment AES-256 encryption key ===
echo 'export SCRIPT_AES256_ENCRYPTION_KEY="B2B8A15FE5962BB6CCEB8D8634E9163561B0D5D62C24ECD0BA5C1EEC61648271"' >> /home/vscode/.bashrc

# === Info Build Instructions ===
echo "✅ Environment siap. Sekarang kamu bisa build Godot custom pakai perintah:"
echo "   cd engine"
echo "   scons -j6 platform=linux production=yes"
echo "   scons platform=linux target=template_debug arch=x86_64"
echo "   scons platform=linux target=template_release arch=x86_64"
