# 3. FortiGate y políticas

## Interfaces

![Interfaces FortiGate](../images/02-fortigate/04-fortigate-interfaces.png)

## DHCP

![DHCP de VLANs](../images/02-fortigate/05-fortigate-dhcp-vlans.png)

La configuración DHCP se utiliza para entregar direccionamiento a los clientes de las redes de usuarios.

## DNS

![DNS FortiGate](../images/02-fortigate/08-fortigate-dns.png)

La resolución de nombres se utilizó para validar la conectividad necesaria para pruebas y actualizaciones.

## Políticas de firewall

![Políticas de firewall](../images/02-fortigate/06-fortigate-firewall-policies.png)

La política del FortiGate se organiza alrededor del principio de mínimo privilegio: cada flujo requerido se permite explícitamente y los flujos que no corresponden a la función del segmento se bloquean.

### VLAN 10 → WEB-CAJA

Permite el acceso web al Sistema de Caja.

Evidencia funcional: `../images/04-tests/15-test-vlan10-web-caja-allowed.png`.

### VLAN 10 → WEB-INVENTARIO

El acceso al Sistema de Inventario debe ser bloqueado para VLAN 10.

![Inventario bloqueado](../images/04-tests/16-test-vlan10-web-inventario-blocked.png)

La captura anterior es la evidencia principal de la violación de política observada por el usuario.

### VLAN 20 → SSH

SSH se autoriza desde VLAN 20. La prueba funcional final se realizó contra DB-SERVER `20.21.75.132`.

![SSH permitido](../images/04-tests/13-test-vlan20-ssh-allowed.png)

### VLAN 10 → SSH

El intento desde VLAN 10 debe quedar rechazado.

![SSH bloqueado](../images/04-tests/14-test-vlan10-ssh-blocked.png)

### DMZ → endpoints de actualización

Se definieron objetos de dirección/FQDN y una política específica para permitir únicamente la actualización necesaria.

![Objetos de actualización](../images/02-fortigate/07-fortigate-update-addresses.png)

La actualización fue validada en DB-SERVER.

![Actualización permitida](../images/04-tests/17-test-dmz-ubuntu-updates-allowed.png)

### DMZ → Internet arbitrario

La DMZ no dispone de salida HTTPS abierta hacia destinos externos no autorizados.

![Internet arbitrario bloqueado](../images/04-tests/18-test-dmz-internet-blocked.png)

