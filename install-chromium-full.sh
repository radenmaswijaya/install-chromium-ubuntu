
#!/bin/bash

# Ask for credentials
read -p "Masukkan nama pengguna: " USERNAME
read -s -p "Masukkan kata sandi: " PASSWORD
echo ""

# Port settings
PORT_HTTP=3010
IMAGE="kasmweb/chromium:1.13.0"

# Update system
apt update -y

# Remove any conflicting docker
apt remove docker docker.io containerd runc -y

# Install Docker official
curl -fsSL https://get.docker.com | sh

# Pull Chromium image
docker pull $IMAGE

# Run container
docker run -d \
  --name chromium-web \
  -p $PORT_HTTP:6901 \
  -e VNC_PW=$PASSWORD \
  $IMAGE

# Show access info
IP=$(curl -s ifconfig.me)
echo ""
echo "======================================================"
echo "Akses Chromium di browser Anda di: http://$IP:$PORT_HTTP/"
echo "Nama pengguna: $USERNAME"
echo "Kata sandi: $PASSWORD"
echo "Harap simpan data Anda, atau Anda akan kehilangan akses!"
echo "======================================================"
