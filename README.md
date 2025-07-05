#  Proyecto Ansible: Automatización de Routers Cisco IOSv

Este proyecto configura una topología de routers Cisco en una red simulada, implementando túneles GRE/IPSec mediante playbooks de Ansible en un entorno Dockerizado.
---

#Objetivos

- Configurar automáticamente routers Cisco IOSv (hostname, interfaces, rutas).
- Asegurar idempotencia (ejecuciones repetidas sin efectos secundarios).
- Facilitar backups y validaciones.
- Preparar la base para una solución CI/CD de redes.

---

##Estructura del Proyecto
```
ansible-docker/
├── docker-compose.yml             # Orquesta contenedor Ansible
├── Dockerfile                     # Imagen Ansible con dependencias
├── ansible.cfg                    # Configuración global de Ansible
├── automation/
│   ├── playbooks/
│   │   └── base_config.yml        # Playbook principal de configuración
│   ├── inventories/
│   │   └── production/
│   │       ├── hosts              # Inventario estático con R1, R2, R3
│   │       ├── group_vars/
│   │       │   └── routers.yml    # Variables comunes a todos los routers
│   │       └── host_vars/
│   │           ├── R1.yml         # Configuración específica de R1
│   │           ├── R2.yml         # Configuración específica de R2
│   │           └── R3.yml         # Configuración específica de R3
└── README.md                      # Este archivo



# Requisitos

- Docker + Docker Compose
- Ansible
- Acceso SSH/Telnet a los dispositivos (simulados o físicos)

# ¿Qué hace?

- Configura hostnames, interfaces y túneles GRE/IPSec
- Aplica crypto maps, ISAKMP policies, ACLs
- Verifica conectividad y estado de los túneles
- Automatiza respaldo de `running-config` de routers

# Cómo usar

# Levantar contenedor con Ansible
docker-compose up -d

# Ejecutar un playbook
docker exec -it ansible-controller ansible-playbook automation/playbooks/base_config.yml -i automation/inventories/production/hosts

#Ejecutar el playbook de configuración
docker-compose run --rm ansible playbooks/base_config.yml
