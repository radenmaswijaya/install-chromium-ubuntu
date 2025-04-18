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
apt install -y curl wget gnupg lsb-release software-properties-common apt-transport-https snapd

# Install Chromium via snap
echo "Installing Chromium via snap..."
snap install chromium

# Cek versi Chromium
echo "============================================"
echo " Chromium Version:"
chromium --version
echo "============================================"

echo "============================================"
echo "  DONE! SEMUA BERKAT BARON YANG GANTENG INI!"
echo "============================================"
