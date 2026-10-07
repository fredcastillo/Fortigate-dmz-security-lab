# Registro técnico — FortiGate

## Plataforma

- FortiGate-VM64-KVM
- FortiOS 7.0.9 build 0444
- Administración principal por GUI

## Componentes documentados

- Interfaces de usuarios y DMZ.
- DHCP para VLAN 10 y VLAN 20.
- DNS / forwarders.
- Políticas de firewall para acceso web, SSH y restricciones de salida.
- Objetos para endpoints de actualización.
- Logging de tráfico para las pruebas.

## Política funcional observada

```text
VLAN 10 -> WEB-CAJA           ALLOW (web)
VLAN 10 -> WEB-INVENTARIO     DENY
VLAN 10 -> SSH DMZ            DENY
VLAN 20 -> SSH DMZ            ALLOW
DMZ -> update endpoints       ALLOW
DMZ -> arbitrary Internet     DENY
```

Este archivo es un **registro técnico**, no sustituye al backup/running-config real solicitado en la entrega.
