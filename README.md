Configuración de VPN IPSec/GRE Full-Mesh con Ansible
Este proyecto proporciona un playbook de Ansible para configurar una topología de VPN IPSec/GRE full-mesh a través de múltiples routers Cisco IOS. Automatiza la configuración de políticas y claves ISAKMP, transform-sets y perfiles IPSec, túneles GRE y enrutamiento OSPF para establecer un enrutamiento seguro y dinámico entre los routers.

Tabla de Contenidos
Configuración de VPN IPSec/GRE Full-Mesh con Ansible
Tabla de Contenidos
Estructura del Proyecto
Requisitos
Inventario de Ansible (inventory.ini)
Variables de Grupo (group_vars/routers.yml)
Playbook (playbooks/roles/IPSec_GRE_VPN_full-mesh.yml)
Cómo Ejecutar el Playbook
Idempotencia
Reusabilidad y Escalabilidad
Contacto
Estructura del Proyecto
El proyecto sigue una estructura de directorios estándar de Ansible:
