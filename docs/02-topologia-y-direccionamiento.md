# 2. Topología y direccionamiento

## Vista general

![Topología general](../images/01-topologia/01-topologia-general.png)

La vista completa del laboratorio se complementa con:

![LAN y VLANs](../images/01-topologia/02-topologia-lan-vlans.png)

![DMZ y servidores](../images/01-topologia/03-topologia-dmz-servidores.png)

## Componentes

| Componente | Función |
|---|---|
| FortiGate-VM64-KVM | Firewall, segmentación, DHCP, políticas y control de salida |
| SW-A | Acceso de usuarios y seguridad de capa 2 |
| SW-B | Acceso de los servidores DMZ |
| WEB-CAJA | Sistema de Caja |
| WEB-INVENTARIO | Sistema de Inventario |
| DB-SERVER | Base de Datos |
| Browser-PC VLAN 10 | Cliente de pruebas |
| Browser-PC VLAN 20 | Cliente de pruebas y origen de SSH autorizado |

## Direccionamiento de trabajo

| Segmento/equipo | Dirección observada/documentada | Rol |
|---|---|---|
| VLAN 10 | `10.21.75.0/25` | Usuarios |
| Gateway VLAN 10 | `10.21.75.1` | Gateway/DHCP |
| VLAN 20 — cliente observado | `20.21.75.141` | Cliente |
| Gateway VLAN 20 | `20.21.75.129` | Gateway/DHCP |
| WEB-CAJA | `20.21.75.130/28` | Sistema de Caja |
| WEB-INVENTARIO | `20.21.75.131/28` | Sistema de Inventario |
| DB-SERVER | `20.21.75.132/28` | Base de Datos |

Los valores anteriores corresponden al estado utilizado durante las pruebas. Las capturas de GUI se consideran la referencia visual primaria para una auditoría posterior.

## Flujos principales

```text
VLAN 10 ── HTTPS ──> WEB-CAJA       [permitido]
VLAN 10 ── HTTPS ──> WEB-INVENTARIO  [bloqueado]
VLAN 10 ── SSH ────> DMZ             [bloqueado]
VLAN 20 ── SSH ────> DB-SERVER        [permitido]
DMZ ────── update ─> endpoints        [permitido]
DMZ ────── HTTPS ──> Internet externo [bloqueado]
```

Fuente editable: `../diagrams/traffic-flows.mmd`.
