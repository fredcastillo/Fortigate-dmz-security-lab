# 8. Guion del video demostrativo

## Objetivo

Demostrar la arquitectura y los controles de seguridad sin modificar la topología durante la grabación.

## Secuencia

### 0:00 — Presentación

- Nombre: Fred Sneyder Castillo Apolinar.
- Matrícula: 2025-2175.
- Presentar la topología.
- Referencia: `01-topologia-general.png`.

### 0:20 — FortiGate

Mostrar interfaces, DHCP y políticas desde GUI.

Referencias: `04-fortigate-interfaces.png`, `05-fortigate-dhcp-vlans.png`, `06-fortigate-firewall-policies.png`.

### 1:00 — Seguridad de switches

Mostrar SW-A y SW-B.

Referencias: `09-sw-a-vlans-security.png` y `10-sw-b-dmz.png`.

### 1:25 — VLAN 20: DHCP/DNS

Mostrar preparación del cliente.

Referencias: `11-test-vlan20-dhcp-dns.png` y `12-test-vlan20-dns-resolution.png`.

### 1:50 — SSH permitido

Desde VLAN 20 iniciar sesión SSH en DB-SERVER `20.21.75.132`.

Referencia: `13-test-vlan20-ssh-allowed.png`.

### 2:15 — SSH bloqueado

Desde VLAN 10 mostrar el intento fallido.

Referencia: `14-test-vlan10-ssh-blocked.png`.

### 2:40 — Caja permitida

Mostrar HTTPS al Sistema de Caja.

Referencia: `15-test-vlan10-web-caja-allowed.png`.

### 3:00 — Inventario bloqueado

Intentar acceder desde VLAN 10 y mostrar la violación de política.

Referencia: `16-test-vlan10-web-inventario-blocked.png`.

### 3:30 — Actualizaciones de DMZ

Mostrar objetos/endpoints y la actualización validada.

Referencias: `07-fortigate-update-addresses.png` y `17-test-dmz-ubuntu-updates-allowed.png`.

### 4:00 — Internet arbitrario bloqueado

Mostrar la prueba de salida HTTPS no autorizada desde DMZ.

Referencia: `18-test-dmz-internet-blocked.png`.

### 4:20 — Cierre

Resumir segmentación, mínimo privilegio, SSH exclusivo de VLAN 20, bloqueo de Inventario, actualización controlada y bloqueo de Internet arbitrario.
