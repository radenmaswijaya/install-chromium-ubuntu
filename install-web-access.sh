#!/bin/bash

# ========== KONFIGURASI ==========
USERNAME=$(openssl rand -hex 4)
PASSWORD=$(openssl rand -hex 8)
IP=$(curl -s ifconfig.me)
PORT_HTTP=3010
PORT_HTTPS=3011
CONTAINER_NAME="chromium-kasm"

# ========== CEK ROOT ==========
if [ "$EUID" -ne 0 ]; then
  echo "Silakan jalankan script ini sebagai root (gunakan sudo)"
  exit 1
fi

# ========== UPDATE & INSTALL DEPENDENSI ==========
echo "[+] Mengupdate sistem dan menginstal dependensi..."
apt update -y && apt install -y docker.io curl openssl

# ========== CEK DAN PULL IMAGE DOCKER ==========
echo "[+] Menarik image kasmweb/chromium..."
docker pull kasmweb/chromium:latest

# ========== HENTIKAN CONTAINER LAMA (JIKA ADA) ==========
echo "[+] Mengecek container sebelumnya..."
docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

# ========== JALANKAN CONTAINER ==========
echo "[+] Menjalankan Chromium container di latar belakang..."
docker run -d \
  --name $CONTAINER_NAME \
  -p $PORT_HTTP:6901 \
  -p $PORT_HTTPS:6902 \
  -e VNC_PW=$PASSWORD \
  kasmweb/chromium:latest > /dev/null

# ========== TAMPILKAN INFORMASI AKSES ==========
echo ""
echo "============================================"
echo "Akses Chromium di browser Anda di:"
echo "  http://$IP:$PORT_HTTP/  atau  https://$IP:$PORT_HTTPS/"
echo ""
echo "Nama pengguna: $USERNAME"
echo "Kata sandi   : $PASSWORD"
echo "Harap simpan data Anda, atau Anda akan kehilangan akses!"
echo ""
echo "Salam dari: BARON GANTENG PAKE BANGET"
echo "============================================"
