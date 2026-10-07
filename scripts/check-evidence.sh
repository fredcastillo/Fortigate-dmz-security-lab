#!/bin/sh
# Verifica las 18 evidencias requeridas.

set -eu
BASE="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
DIR="$BASE/images"

for f in \
  01-topologia-general.png \
  02-topologia-lan-vlans.png \
  03-topologia-dmz-servidores.png \
  04-fortigate-interfaces.png \
  05-fortigate-dhcp-vlans.png \
  06-fortigate-firewall-policies.png \
  07-fortigate-update-addresses.png \
  08-fortigate-dns.png \
  09-sw-a-vlans-security.png \
  10-sw-b-dmz.png \
  11-test-vlan20-dhcp-dns.png \
  12-test-vlan20-dns-resolution.png \
  13-test-vlan20-ssh-allowed.png \
  14-test-vlan10-ssh-blocked.png \
  15-test-vlan10-web-caja-allowed.png \
  16-test-vlan10-web-inventario-blocked.png \
  17-test-dmz-ubuntu-updates-allowed.png \
  18-test-dmz-internet-blocked.png
 do
  if [ -f "$DIR/$f" ]; then
    echo "[OK] $f"
  else
    echo "[MISSING] $f"
    exit 1
  fi
done

echo "[OK] Las 18 evidencias están presentes."
