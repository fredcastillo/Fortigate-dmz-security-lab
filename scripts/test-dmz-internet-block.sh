#!/bin/sh
# Prueba de salida HTTPS arbitraria desde un servidor DMZ.
# No depende de curl ni de DNS.

TARGET_IP="${1:-1.1.1.1}"
TARGET_PORT="${2:-443}"

if command -v nc >/dev/null 2>&1; then
  echo "[*] Probando $TARGET_IP:$TARGET_PORT ..."
  if nc -w 5 "$TARGET_IP" "$TARGET_PORT"; then
    echo "[FAIL] La conexión TCP se estableció: existe una salida no deseada."
    exit 1
  else
    echo "[OK] La conexión no se estableció; el flujo parece estar bloqueado."
    exit 0
  fi
fi

echo "[ERROR] nc no está disponible en este host."
exit 2
