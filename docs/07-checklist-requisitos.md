# 7. Checklist de requisitos

| Requisito | Implementación / evidencia |
|---|---|
| 1 FortiGate | FortiGate-VM64-KVM, FortiOS 7.0.9 build 0444. Evidencias `04` y `06`. |
| Configuración y demostración por GUI | La configuración funcional del FortiGate se realizó por GUI; CLI se limitó a bootstrap, comprobación o diagnóstico cuando correspondió. |
| Servidores en DMZ | `03-topologia-dmz-servidores.png` y `10-sw-b-dmz.png`. |
| Políticas contra fuga de tráfico | `06-fortigate-firewall-policies.png`. |
| DMZ sin Internet abierto | `18-test-dmz-internet-blocked.png`. |
| Solo endpoints de actualización | `07-fortigate-update-addresses.png` y `17-test-dmz-ubuntu-updates-allowed.png`. |
| VLAN 20 única para SSH | `13-test-vlan20-ssh-allowed.png` más `14-test-vlan10-ssh-blocked.png`. |
| VLAN 10 bloqueada contra Inventario | `16-test-vlan10-web-inventario-blocked.png`. |
| Usuario presencia la violación | La captura 16 muestra el intento bloqueado. |
| Dos switches | `09-sw-a-vlans-security.png` y `10-sw-b-dmz.png`. |
| VLAN + seguridad básica | `09-sw-a-vlans-security.png`. |
| WEB-CAJA | `15-test-vlan10-web-caja-allowed.png`. |
| WEB-INVENTARIO | `16-test-vlan10-web-inventario-blocked.png`. |
| DB-SERVER | `13-test-vlan20-ssh-allowed.png` y `17-test-dmz-ubuntu-updates-allowed.png`. |
| Usuarios /25 | `05-fortigate-dhcp-vlans.png` y evidencias 11–12 de VLAN 20. |
| DHCP | `05` y `11`. |
| Documentación profesional | `README.md` + `docs/`. |
| Imágenes | 18 PNG en `images/`, distribuidos en cuatro carpetas, referenciados por Markdown. |
| Diagramas | `diagrams/topology.mmd` y `diagrams/traffic-flows.mmd`. |
| Scripts | `scripts/`. |
| Running-configs | `configs/running-configs/`. |
| Video al principio | `README.md` enlaza al material del video en la parte superior. |

## Evidencia visual completa

La secuencia completa está en [`06-evidencias.md`](06-evidencias.md).
