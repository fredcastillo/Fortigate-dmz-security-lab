# 5. Servidores y servicios

## WEB-CAJA

**IP:** `20.21.75.130/28`  
**Rol:** Sistema de Caja  
**Servicios:** HTTP/HTTPS y administración SSH según la configuración del laboratorio.

![Caja permitido](../images/04-tests/15-test-vlan10-web-caja-allowed.png)

La prueba demuestra que VLAN 10 puede alcanzar el servicio web permitido de Caja.

## WEB-INVENTARIO

**IP:** `20.21.75.131/28`  
**Rol:** Sistema de Inventario  
**Servicios:** HTTP/HTTPS.

![Inventario bloqueado](../images/04-tests/16-test-vlan10-web-inventario-blocked.png)

La política exige que VLAN 10 no pueda acceder al Sistema de Inventario.

## DB-SERVER

**IP:** `20.21.75.132/28`  
**Rol:** Base de Datos.

![SSH a DB-SERVER](../images/04-tests/13-test-vlan20-ssh-allowed.png)

La captura demuestra que el servidor puede ser administrado mediante SSH desde VLAN 20.

![Actualización de DB-SERVER](../images/04-tests/17-test-dmz-ubuntu-updates-allowed.png)

Esta captura demuestra que la salida de actualización requerida fue funcional al menos para DB-SERVER.

## DHCP y DNS del cliente VLAN 20

![DHCP y DNS VLAN 20](../images/04-tests/11-test-vlan20-dhcp-dns.png)

![Resolución DNS VLAN 20](../images/04-tests/12-test-vlan20-dns-resolution.png)

Estas pruebas muestran la preparación de la estación utilizada para la demostración de SSH.
