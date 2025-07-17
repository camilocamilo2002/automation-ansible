# Dockerfile
# Usar una imagen base oficial de Ubuntu, que es ligera y común
FROM ubuntu:latest

# Actualizar la lista de paquetes e instalar Python3, pip y OpenSSH client
# OpenSSH client es necesario para las conexiones SSH de Ansible
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        openssh-client \
        build-essential && \
    rm -rf /var/lib/apt/lists/*

# Instalar pip para Python 3 (asegurando que es el pip correcto)
RUN apt-get update && apt-get install -y python3-pip

# 3. DIRECTORIO DE TRABAJO:
# Establece el directorio de trabajo dentro del contenedor Docker.
WORKDIR /app/ansible_vpn_project

# 4. COPIAR EL PROYECTO:
# Copia todo el contenido de tu directorio local actual (donde está este Dockerfile)
# al directorio de trabajo dentro del contenedor.
COPY . .

# 5. INSTALAR ANSIBLE y DEPENDENCIAS ADICIONALES (Recomendado):
# Instala Ansible y 'ansible-pylibssh' para optimizar las conexiones SSH.
# El paquete 'ansible' instalará ansible-core y las colecciones más comunes.
RUN pip3 install --break-system-packages ansible ansible-pylibssh

# 6. COMANDO POR DEFECTO (CMD):
# Define el comando que se ejecuta por defecto si no especificas nada al iniciar el contenedor.
CMD ["ansible", "--version"]
