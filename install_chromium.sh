#!/bin/bash

#======================================#
#   SCRIPT BY: BARON GANTENG PAKE BANGET
#   AUTO INSTALL CHROMIUM - UBUNTU VPS
#======================================#

echo "============================================"
echo "  BARON GANTENG PAKE BANGET - INSTALL SCRIPT"
echo "============================================"

# Update package list
apt update -y

# Install dependencies
apt install -y software-properties-common apt-transport-https wget gnupg lsb-release

# Install Chromium
apt install -y chromium-browser

# Cek versi Chromium
echo "============================================"
echo " Chromium Version:"
chromium-browser --version
echo "============================================"

# (Opsional) Jalankan Chromium headless
# chromium-browser --headless --disable-gpu --screenshot https://example.com

echo "============================================"
echo "  DONE! SEMUA BERKAT BARON YANG GANTENG BGT!"
echo "============================================"
