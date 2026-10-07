#!/bin/bash
# Configuración de laboratorio para servidores Linux con OpenSSH.
# Usuario: labssh / Password: LabSSH123!
# Ejecutar exclusivamente en servidores DMZ de laboratorio.

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "[ERROR] Ejecuta como root."
  exit 1
fi

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server

ssh-keygen -A
mkdir -p /run/sshd

if ! id labssh >/dev/null 2>&1; then
  useradd -m -s /bin/bash labssh
fi

echo 'labssh:LabSSH123!' | chpasswd

mkdir -p /etc/ssh/sshd_config.d
cat > /etc/ssh/sshd_config.d/laboratorio.conf <<'CFG'
PasswordAuthentication yes
PubkeyAuthentication yes
PermitRootLogin no
UsePAM yes
CFG

/usr/sbin/sshd -t

if ! ss -lnt 2>/dev/null | grep -q ':22 '; then
  /usr/sbin/sshd
fi

ss -lntp | grep ':22'
id labssh
