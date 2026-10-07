#!/bin/sh
# Instala el cliente OpenSSH en un Browser-PC Debian/Ubuntu/BusyBox.

set -eu

if [ "$(id -u)" -ne 0 ]; then
  echo "[ERROR] Ejecuta como root."
  exit 1
fi

if command -v ssh >/dev/null 2>&1; then
  ssh -V 2>&1 || true
  exit 0
fi

command -v apt-get >/dev/null 2>&1 || {
  echo "[ERROR] apt-get no está disponible."
  exit 1
}

apt-get update
apt-get install -y openssh-client

ssh -V 2>&1
