#!/bin/bash

# Konfigurasi login
USERNAME="ISI SENDIRI"
PASSWORD="ISI SENDIRI"
CONTAINER_NAME="chromium-kasm"
PORT_HTTP=3010
PORT_HTTPS=3011
IP=$(curl -s ifconfig.me)

# Pastikan script dijalankan sebagai root
if [ "$EUID" -ne 0 ]; then
  echo "Silakan jalankan script ini sebagai root."
  exit 1
fi

# Update sistem dan instalasi dependensi
apt update -y
apt install -y docker.io curl openssl

# Menarik image Chromium dari Docker Hub
docker pull kasmweb/chromium:latest

# Menghentikan dan menghapus container lama jika ada
docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

# Menjalankan container Chromium
docker run -d \
  --name $CONTAINER_NAME \
  -p $PORT_HTTP:6901 \
  -p $PORT_HTTPS:6902 \
  -e VNC_PW=$PASSWORD \
  kasmweb/chromium:latest > /dev/null

# Menampilkan informasi akses
echo ""
echo "Akses Chromium di browser Anda di: http://$IP:$PORT_HTTP/ atau https://$IP:$PORT_HTTPS/"
echo "Nama pengguna: $USERNAME"
echo "Kata sandi: $PASSWORD"
echo "Harap simpan data Anda, atau Anda akan kehilangan akses!"
echo ""
