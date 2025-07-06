# Dockerfile
FROM python:3.11-slim

# Instala dependencias del sistema
RUN apt-get update && apt-get install -y \
    sshpass \
    iputils-ping \
    git \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Instala Ansible
RUN pip install ansible

RUN pip install paramiko netmiko

# Copia la configuración y automatización
COPY automation/ /automation/

# Establece el directorio de trabajo
WORKDIR /automation

# Instala la colección de Cisco IOS
RUN ansible-galaxy collection install -r requirements.yml --force

# Comando por defecto (puedes sobreescribir con docker-compose)
CMD [ "ansible-playbook", "--version" ]
