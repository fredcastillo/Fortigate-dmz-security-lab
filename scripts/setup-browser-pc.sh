#!/bin/sh
# GNS3 Browser-PC — DHCP + DNS helper
# Uso:
#   ./setup-browser-pc.sh
#   ./setup-browser-pc.sh 10
#   ./setup-browser-pc.sh 20
#
# El argumento es opcional y solo se usa para validar el gateway esperado.

set -u

EXPECTED_GATEWAY=""
case "${1:-}" in
  10) EXPECTED_GATEWAY="10.21.75.1" ;;
  20) EXPECTED_GATEWAY="20.21.75.129" ;;
  "") : ;;
  *) echo "Uso: $0 [10|20]"; exit 2 ;;
esac

if [ "$(id -u)" -ne 0 ]; then
  echo "[ERROR] Ejecuta como root."
  exit 1
fi

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PATH

IFACE="${IFACE:-}"
if [ -z "$IFACE" ]; then
  IFACE="$(ip -o -4 route show default 2>/dev/null | awk '{print $5; exit}')"
fi
if [ -z "$IFACE" ]; then
  IFACE="$(ip -o link show 2>/dev/null | awk -F': ' '$2 != "lo" {print $2; exit}')"
fi
if [ -z "$IFACE" ] || ! ip link show "$IFACE" >/dev/null 2>&1; then
  echo "[ERROR] No se pudo detectar la interfaz."
  ip -br link 2>/dev/null || true
  exit 1
fi

echo "[+] Interfaz: $IFACE"

# Buscar udhcpc directamente o a través de BusyBox.
UDHCPC=""
if command -v udhcpc >/dev/null 2>&1; then
  UDHCPC="$(command -v udhcpc)"
elif command -v busybox >/dev/null 2>&1 && busybox udhcpc --help >/dev/null 2>&1; then
  UDHCPC="busybox udhcpc"
fi

if [ -z "$UDHCPC" ]; then
  echo "[ERROR] No se encontró udhcpc/BusyBox udhcpc."
  exit 1
fi

cat > /tmp/gns3-udhcpc.script <<'HOOK'
#!/bin/sh
mask_to_prefix() {
  m="$1"
  p=0
  oldifs="$IFS"
  IFS=.
  set -- $m
  IFS="$oldifs"
  for o in "$@"; do
    case "$o" in
      255) p=$((p+8));;
      254) p=$((p+7));;
      252) p=$((p+6));;
      248) p=$((p+5));;
      240) p=$((p+4));;
      224) p=$((p+3));;
      192) p=$((p+2));;
      128) p=$((p+1));;
      0) ;;
    esac
  done
  echo "$p"
}

case "${1:-}" in
  bound|renew)
    PREFIX="$(mask_to_prefix "${subnet:-255.255.255.0}")"
    ip addr flush dev "$interface" 2>/dev/null || true
    ip link set "$interface" up
    ip addr add "$ip/$PREFIX" dev "$interface"
    if [ -n "${router:-}" ]; then
      gw="$(echo "$router" | awk '{print $1}')"
      ip route del default 2>/dev/null || true
      ip route add default via "$gw" dev "$interface"
    fi
    ;;
esac
HOOK
chmod +x /tmp/gns3-udhcpc.script

ip addr flush dev "$IFACE" 2>/dev/null || true
ip route del default 2>/dev/null || true
ip link set "$IFACE" up

if [ "$UDHCPC" = "busybox udhcpc" ]; then
  busybox udhcpc -i "$IFACE" -q -f -s /tmp/gns3-udhcpc.script
else
  "$UDHCPC" -i "$IFACE" -q -f -s /tmp/gns3-udhcpc.script
fi

GATEWAY="$(ip -4 route show default 2>/dev/null | awk '{print $3; exit}')"
if [ -z "$GATEWAY" ]; then
  echo "[ERROR] DHCP no proporcionó gateway."
  exit 1
fi

echo "[+] Gateway: $GATEWAY"

if [ -n "$EXPECTED_GATEWAY" ] && [ "$GATEWAY" != "$EXPECTED_GATEWAY" ]; then
  echo "[ERROR] Gateway inesperado. Esperado=$EXPECTED_GATEWAY recibido=$GATEWAY"
  exit 1
fi

# DHCP no siempre entrega DNS en estos nodos BusyBox. Se usa el gateway si no hay servidor DNS.
DNS_SERVER="${DNS_SERVER:-$GATEWAY}"
printf 'nameserver %s\n' "$DNS_SERVER" > /etc/resolv.conf

echo "[+] DNS: $DNS_SERVER"
echo
ip -4 addr show dev "$IFACE"
echo
ip -4 route
