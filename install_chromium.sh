#!/bin/bash

#======================================#
#   SCRIPT BY: BARON GANTENG PAKE BANGET
#   AUTO INSTALL XFCE + VNC + CHROMIUM
#======================================#

echo "============================================"
echo "  BARON GANTENG PAKE BANGET - VNC SETUP"
echo "============================================"

# Update dan install dependencies
apt update -y
apt install -y xfce4 xfce4-goodies tigervnc-standalone-server snapd curl

# Install Chromium via Snap
snap install chromium

# Setup VNC pertama kali
echo "Set VNC password:"
vncserver

# Stop VNC untuk konfigurasi
vncserver -kill :1

# Buat file xstartup
mkdir -p ~/.vnc
cat > ~/.vnc/xstartup <<EOF
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOF

chmod +x ~/.vnc/xstartup

# Jalankan ulang VNC
vncserver

echo "============================================"
echo "  DONE! Akses VPS kamu via VNC di port :1"
echo "  Buka Chromium dari desktop XFCE"
echo "============================================"
